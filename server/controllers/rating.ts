import catchAsync from '@utils/catchAsync';
import { Rating } from '@models/Rating';
import { zParse } from '@validation/index';
import * as ratingValidation from '@validation/rating';

/**
 * @route POST /api/rating
 * @desc Let a user send a rating
 * @secure true
 */
export const createRating = catchAsync(async (req, res) => {
  const { body } = await zParse(ratingValidation.createRating, req);
  const user = req.user;
  const { name, comment, rating, userId } = body;

  await Rating.create({
    name,
    comment,
    rating,
    user: userId,
    createdBy: user
  });

  res.status(200).json({
    success: true,
    message: 'Rating created successfully'
  });
});
