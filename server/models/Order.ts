import mongoose from 'mongoose';

enum StatusEnum {
  pending = 'pending',
  completed = 'completed'
}

interface Location {
  type: string;
  address: string;
  coordinates: mongoose.Types.Array<number>;
}

interface Order {
  price: number;
  distance: number;
  sourceLocation: Location;
  destinationLocation: Location;
  createdBy: mongoose.ObjectId;
  acceptedBy: mongoose.ObjectId;
  status: StatusEnum;
  createdAt: Date;
  updatedAt: Date;
}

const schema = new mongoose.Schema<Order>(
  {
    price: { type: Number },
    distance: { type: Number },
    sourceLocation: {
      type: { type: String, enum: ['Point'] },
      address: { type: String },
      coordinates: { type: [Number], index: '2dsphere' }
    },
    destinationLocation: {
      type: { type: String, enum: ['Point'] },
      address: { type: String },
      coordinates: { type: [Number], index: '2dsphere' }
    },
    status: {
      type: String,
      default: StatusEnum.pending,
      enum: Object.values(StatusEnum)
    },
    createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    acceptedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Order = mongoose.model<Order>('Order', schema);
type OrderType = mongoose.HydratedDocument<Order>;

export { OrderType, Order, StatusEnum };
