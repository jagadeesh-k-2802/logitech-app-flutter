import catchAsync from '@utils/catchAsync';
import { Rating } from '@models/Rating';
import { Notification, NotificationTypeEnum } from '@models/Notification';
import { zParse } from '@validation/index';
import * as ratingValidation from '@validation/rating';
import { Order } from '@models/Order';
import ErrorResponse from '@utils/errorResponse';
import sendPushNotification from '@utils/sendPushNotfication';
import { UserType } from '@models/User';

/**
 * @route POST /api/rating
 * @desc Let a user send a rating
 * @secure true
 */
export const createRating = catchAsync(async (req, res) => {
  const { body } = await zParse(ratingValidation.createRating, req);
  const user = req.user;
  const { name, comment, rating, userId, orderId } = body;

  const order = await Order.findById(orderId).populate<{
    acceptedBy: UserType;
  }>('acceptedBy', 'id name fcmToken');

  if (order === null) {
    throw new ErrorResponse('Order not found cannot send rating', 404);
  }

  if (order.isRatingDone) {
    throw new ErrorResponse('Cannot rate more than once', 400);
  }

  await Rating.create({
    name,
    comment,
    rating,
    user: userId,
    createdBy: user
  });

  order.isRatingDone = true;
  await order.save();

  // Send push notification
  await Notification.create({
    content: `${user.name} Has rated your delivery: ${rating} stars`,
    user: order.acceptedBy,
    type: NotificationTypeEnum.info
  });

  await sendPushNotification({
    title: `${user.name} Has rated you`,
    body: `${user.name} Has rated your delivery: ${rating} stars`,
    tokens: [order.acceptedBy.fcmToken]
  });

  res.status(200).json({
    success: true,
    message: 'Rating created successfully'
  });
});
