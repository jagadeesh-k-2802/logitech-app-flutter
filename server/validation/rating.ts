import { z } from 'zod';

export const createRating = z.object({
  body: z.object({
    name: z.string({ required_error: 'Type of vehicle is required' }),
    comment: z.string({ required_error: 'Start Address is required' }),
    rating: z.number(),
    userId: z.string({ required_error: 'User Id is required' }),
    orderId: z.string({ required_error: 'Order Id is required' })
  })
});
