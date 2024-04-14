import express from 'express';
import * as ratingController from '@controllers/rating';
import { protect } from '@middlewares/auth';

const router = express.Router();
router.post('/', protect, ratingController.createRating);

export default router;
