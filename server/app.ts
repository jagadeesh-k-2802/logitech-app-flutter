import express from 'express';
import path from 'path';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import errorHandler from '@middlewares/error';
import authRoutes from '@routes/auth';
import notificationRoutes from '@routes/notification';
import orderRoutes from '@routes/order';
import ratingRoutes from '@routes/rating';
import userRoutes from '@routes/user';

const app = express();

// Middlewares
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' }));
app.use(express.static(path.join(__dirname, 'public')));

if (process.env.NODE_ENV === 'production') {
  app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 }));
}

// Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/notification', notificationRoutes);
app.use('/api/v1/order', orderRoutes);
app.use('/api/v1/rating', ratingRoutes);
app.use('/api/v1/user', userRoutes);

// Error Handler
app.use(errorHandler);

export default app;
