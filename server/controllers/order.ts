import mongoose from 'mongoose';
import { Order, StatusEnum } from '@models/Order';
import { Rating } from '@models/Rating';
import { Notification, NotificationTypeEnum } from '@models/Notification';
import { AccountTypeEnum, User, UserType } from '@models/User';
import catchAsync from '@utils/catchAsync';
import Email from '@utils/email';
import ErrorResponse from '@utils/errorResponse';
import sendPushNotification from '@utils/sendPushNotfication';
import { zParse } from '@validation/index';
import * as orderValidation from '@validation/order';
import { getCurrentDateTimeAsString, withinGeoRadius } from '@utils/functions';

/**
 * @route GET /api/order
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
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: orders });
});

/**
 * @route GET /api/order/nearby
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
 * @route GET /api/order/stats
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
    {
      $match: {
        acceptedBy: new mongoose.Types.ObjectId(user.id),
        status: StatusEnum.completed
      }
    },
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

  const order = await Order.findById(id).populate<{ createdBy: UserType }>(
    'createdBy',
    'id name avatar'
  );

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

  await Notification.create({
    content: `${user.name} Has accepted to take on your order`,
    user: order.createdBy,
    data: { user },
    type: NotificationTypeEnum.info
  });

  await sendPushNotification({
    title: 'Your order has been accepted',
    body: `${user.name} Has accepted to take on your order`,
    tokens: [order.createdBy.fcmToken]
  });

  res.status(200).json({
    success: true,
    message: 'Order Accepted Successfully'
  });
});

/**
 * @route GET /api/location/:id
 * @desc Let a driver update their location
 * @secure true
 */
export const updateOrderLocation = catchAsync(async (req, res) => {
  const id = req.params.id;
  const user = req.user;

  const order = await Order.findById(id).populate<{ createdBy: UserType }>(
    'createdBy',
    'id name fcmToken'
  );

  if (!order) {
    throw new ErrorResponse('Order not found', 404);
  }

  if (user.id !== order.acceptedBy.toString()) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  const { body } = await zParse(orderValidation.updateOrderLocation, req);
  const { index, message, coordinates, userCoordinates } = body;

  if (!withinGeoRadius(userCoordinates, coordinates, 750)) {
    throw new ErrorResponse('Please, be near the location', 401);
  }

  // Check if destination reached
  // The coordinates order is swapped in MongoDB
  if (
    coordinates[0] === order.destinationLocation.coordinates[1] &&
    coordinates[1] === order.destinationLocation.coordinates[0]
  ) {
    order.status = StatusEnum.completed;
  }

  order.locationUpdates.push({
    index,
    message: `${getCurrentDateTimeAsString()} - ${message}`
  });

  await order.save();

  await Notification.create({
    content: `Location Update for Order ${order.id} | ${message}`,
    user: order.createdBy,
    type: NotificationTypeEnum.info
  });

  await sendPushNotification({
    title: `Location Update for Order ${order.id}`,
    body: message,
    tokens: [order.createdBy.fcmToken]
  });

  res.status(200).json({
    success: true,
    message: 'Order Location Updated Successfully'
  });
});

/**
 * @route GET /api/order/:id
 * @desc Get a order by it's id
 * @secure true
 */
export const getOrder = catchAsync(async (req, res) => {
  const id = req.params.id;
  const user = req.user;

  const order = await Order.findById(id)
    .populate('createdBy', 'id name phone')
    .populate('acceptedBy', 'id name phone avatar driverDetails');

  console.log(order);

  if (!order) {
    throw new ErrorResponse('Order not found', 404);
  }

  if (order.createdBy == user.id || !order.acceptedBy == user.id) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  res.status(200).json({ success: true, data: order });
});

/**
 * @route POST /api/order
 * @desc Create a new order by the user
 * @secure true
 */
export const createOrder = catchAsync(async (req, res) => {
  const user = req.user;
  const { body } = await zParse(orderValidation.createOrder, req);

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

  // Send Push Notification to Nearby Drivers in 50 KM
  const searchRadiusInKilometres = 50 / 6378.1;
  const limit = 500;

  const driversInRadius = await User.find({
    type: AccountTypeEnum.driver,
    'driverDetails.location.coordinates': {
      $geoWithin: {
        $centerSphere: [
          [startLongitude, startLatitude],
          searchRadiusInKilometres
        ]
      }
    }
  })
    .select('id name fcmToken')
    .limit(limit);

  await Promise.all(
    driversInRadius.map(user =>
      Notification.create({
        content: `New Order requested to ${destinationAddress} of ${totalDistance} Km for ${totalCost} price`,
        user: user.id,
        data: { order: order.id },
        type: NotificationTypeEnum.info
      })
    )
  );

  await sendPushNotification({
    title: 'New Order Nearby',
    body: `New Order requested to ${destinationAddress} of ${totalDistance} Km for ${totalCost} price`,
    tokens: driversInRadius.map(user => user.fcmToken)
  });

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

/**
 * @route PUT /api/order/:id
 * @desc Let a user update the order
 * @secure true
 */
export const updateOrder = catchAsync(async (req, res) => {
  const id = req.params.id;
  const user = req.user;
  const { body } = await zParse(orderValidation.updateOrder, req);
  const { isPaymentDone } = body;

  const order = await Order.findById(id).populate<{ acceptedBy: UserType }>(
    'acceptedBy',
    'id name fcmToken'
  );

  if (!order) {
    throw new ErrorResponse('Order not found', 404);
  }

  if (user.id !== order.createdBy.toString()) {
    throw new ErrorResponse('Unauthorized Access', 401);
  }

  if (isPaymentDone) {
    order.isPaymentDone = isPaymentDone;
    await order.save();

    await Notification.create({
      content: `Payment Recieved for Order ${order.id}`,
      user: order.acceptedBy,
      type: NotificationTypeEnum.info
    });

    await sendPushNotification({
      title: `Payment Recieved for Order ${order.id}`,
      body: `The customer has sent payment of ₹ ${order.price}`,
      tokens: [order.acceptedBy.fcmToken]
    });
  }

  res.status(200).json({
    success: true,
    message: 'Order Updated Successfully.'
  });
});
