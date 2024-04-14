import { Order } from '@models/Order';
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
    .populate('acceptedBy', 'id name email')
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: orders });
});

/**
 * @route GET /api/orders/:id
 * @desc Get a order by it's id
 * @secure true
 */
export const getOrder = catchAsync(async (req, res, next) => {
  const user = req.user;
  const queryCondition = { $or: [{ createdBy: user }, { acceptedBy: user }] };

  const order = await Order.findOne(queryCondition).populate(
    'acceptedBy',
    'id name email'
  );

  if (!order) {
    next(new ErrorResponse('Order not found', 404));
  } else {
    res.status(200).json({ success: true, data: order });
  }
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
    deliveryNote,
    approxWeight: parseFloat(approxWeight),
    price: parseFloat(totalCost),
    distance: parseFloat(totalDistance),
    typeOfGoods,
    createdBy: user
  });

  // TODO: Send Push Notification to Nearby Drivers of 50 KM

  await new Email(user.name, user.email, {
    orderId: order.id,
    start: startAddress,
    destination: destinationAddress
  }).sendOrderConfirm();

  res.status(200).json({
    success: true,
    message: 'Order created successfully'
  });
});
