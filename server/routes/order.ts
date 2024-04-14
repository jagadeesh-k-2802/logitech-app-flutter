import express from 'express';
import * as orderController from '@controllers/order';
import { protect } from '@middlewares/auth';

const router = express.Router();
router.get('/', protect, orderController.getOrders);
router.get('/:id', protect, orderController.getOrder);
router.post('/', protect, orderController.createOrder);

export default router;
