import mongoose from 'mongoose';
import { Order, StatusEnum } from '@models/Order';
import { Rating } from '@models/Rating';
import { User } from '@models/User';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';

/**
 * @route GET /api/user/:id
 * @desc Get a user with their stats & ratings
 * @secure true
 */
export const getProfile = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const user = await User.findById(id).lean();

  if (!user) {
    return next(new ErrorResponse('User not found', 404));
  }

  const avgRating = await Rating.aggregate([
    { $match: { user: new mongoose.Types.ObjectId(user._id) } },
    { $group: { _id: null, averageRating: { $avg: '$rating' } } }
  ]);

  const completedOrders = await Order.countDocuments({
    status: StatusEnum.completed,
    acceptedBy: user
  });

  const reviews = await Rating.find({ user: user._id })
    .populate('createdBy')
    .lean();

  const data = {
    averageRating: avgRating.length > 0 ? avgRating[0].averageRating : 0,
    completedOrders
  };

  res.status(200).json({
    success: true,
    data: { ...data, ...user, reviews }
  });
});
