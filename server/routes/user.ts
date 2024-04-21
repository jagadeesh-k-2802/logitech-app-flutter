import express from 'express';
import * as userController from '@controllers/user';
import { protect } from '@middlewares/auth';

const router = express.Router();
router.get('/:id', protect, userController.getProfile);

export default router;
