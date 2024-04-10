import { Order } from '@models/Order';
import catchAsync from '@utils/catchAsync';

/**
 * @route GET /api/orders
 * @desc Get all orders for the user
 * @secure true
 */
export const getOrders = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const orders = await Order.find({ user })
    .skip(skip)
    .limit(limit)
    .select('id  createdAt updatedAt')
    .populate('data.acceptedBy', 'id name email')
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: orders });
});
