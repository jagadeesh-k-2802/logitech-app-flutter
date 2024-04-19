import mongoose from 'mongoose';
import { Order, StatusEnum } from '@models/Order';
import { Rating } from '@models/Rating';
import { AccountTypeEnum } from '@models/User';
import catchAsync from '@utils/catchAsync';
import Email from '@utils/email';
import ErrorResponse from '@utils/errorResponse';
import { zParse } from '@validation/index';
import * as orderValidation from '@validation/order';

/**
 * @route GET /api/orders
 * @desc Get all orders for the customer / driver
 * @secure true
 */
export const getOrders = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;
  const queryCondition = { $or: [{ createdBy: user }, { acceptedBy: user }] };

  const orders = await Order.find(queryCondition)
    .skip(skip)
    .limit(limit)
    .populate('acceptedBy', 'id name phone avatar')
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: orders });
});

/**
 * @route GET /api/orders/nearby
 * @desc Get all orders nearby driver
 * @secure true
 */
export const getOrdersNearby = catchAsync(async (req, res) => {
  const user = req.user;
  const radius = req.query.radius?.toString() || '200';
  const userCoordinates = user.driverDetails?.location.coordinates;
  const searchRadiusInKilometres = parseInt(radius, 10) / 6378.1;
  const limit = 50;

  if (user.type !== AccountTypeEnum.driver) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  const orders = await Order.find({
    'sourceLocation.coordinates': {
      $geoWithin: {
        $centerSphere: [userCoordinates, searchRadiusInKilometres]
      }
    },
    status: { $eq: StatusEnum.pending },
    createdBy: { $ne: user.id }
  }).limit(limit);

  res.status(200).json({ success: true, data: orders });
});

/**
 * @route GET /api/orders/stats
 * @desc Get all driver stats
 * @secure true
 */
export const getOrderStats = catchAsync(async (req, res) => {
  const user = req.user;

  if (user.type !== AccountTypeEnum.driver) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  const avgRating = await Rating.aggregate([
    { $match: { user: new mongoose.Types.ObjectId(user.id) } },
    { $group: { _id: null, averageRating: { $avg: '$rating' } } }
  ]);

  const completedOrders = await Order.countDocuments({
    status: StatusEnum.completed,
    acceptedBy: user
  });

  const totalEarned = await Order.aggregate([
    { $match: { user: new mongoose.Types.ObjectId(user.id) } },
    { $group: { _id: null, totalPrice: { $sum: '$price' } } }
  ]);

  const data = {
    averageRating: avgRating.length > 0 ? avgRating[0].averageRating : 0,
    totalEarned: totalEarned.length > 0 ? totalEarned[0].totalPrice : 0,
    completedOrders
  };

  res.status(200).json({ success: true, data });
});

/**
 * @route GET /api/accept/:id
 * @desc Let a driver accept a order
 * @secure true
 */
export const acceptOrder = catchAsync(async (req, res) => {
  const id = req.params.id;
  const user = req.user;
  const order = await Order.findById(id);

  if (!order) {
    throw new ErrorResponse('Order not found', 404);
  }

  if (order.status !== StatusEnum.pending) {
    throw new ErrorResponse('Sorry, Order already Accepted', 400);
  }

  const previousAcceptedOrder = await Order.findOne({
    status: StatusEnum.accepted,
    acceptedBy: user
  });

  if (previousAcceptedOrder !== null) {
    throw new ErrorResponse('Sorry, Finish your Current Order', 400);
  }

  await Order.findByIdAndUpdate(id, {
    status: StatusEnum.accepted,
    acceptedBy: user
  });

  // TODO: Send Push Notification to Created By User

  res.status(200).json({
    success: true,
    message: 'Order Accepted Successfully'
  });
});

/**
 * @route GET /api/orders/:id
 * @desc Get a order by it's id
 * @secure true
 */
export const getOrder = catchAsync(async (req, res) => {
  const id = req.params.id;
  const user = req.user;

  const order = await Order.findById(id)
    .populate('createdBy', 'id name phone')
    .populate('acceptedBy', 'id name phone avatar');

  if (!order) {
    throw new ErrorResponse('Order not found', 404);
  }

  if (order.createdBy == user.id || !order.acceptedBy == user.id) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  res.status(200).json({ success: true, data: order });
});

/**
 * @route POST /api/orders
 * @desc Create a new order by the user
 * @secure true
 */
export const createOrder = catchAsync(async (req, res) => {
  const { body } = await zParse(orderValidation.createOrder, req);
  const user = req.user;

  const {
    vehicleType,
    startAddress,
    destinationAddress,
    startLatitude,
    startLongitude,
    destinationLatitude,
    destinationLongitude,
    hubs,
    deliveryNote,
    approxWeight,
    totalCost,
    totalDistance,
    typeOfGoods
  } = body;

  const order = await Order.create({
    vehicleType,
    sourceLocation: {
      address: startAddress,
      coordinates: [startLongitude, startLatitude],
      type: 'Point'
    },
    destinationLocation: {
      address: destinationAddress,
      coordinates: [destinationLongitude, destinationLatitude],
      type: 'Point'
    },
    hubs,
    deliveryNote,
    approxWeight: parseFloat(approxWeight),
    price: parseFloat(totalCost),
    distance: parseFloat(totalDistance),
    typeOfGoods,
    createdBy: user
  });

  // TODO: Send Push Notification to Nearby Drivers of 50 KM

  res.status(200).json({
    success: true,
    message: 'Order created successfully'
  });

  await new Email(user.name, user.email, {
    orderId: order.id,
    start: startAddress,
    destination: destinationAddress
  }).sendOrderConfirm();
});
