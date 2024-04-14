import mongoose from 'mongoose';

enum StatusEnum {
  pending = 'pending',
  accepted = 'accepted',
  completed = 'completed'
}

interface Location {
  type: string;
  address: string;
  coordinates: mongoose.Types.Array<number>;
}

interface Order {
  sourceLocation: Location;
  destinationLocation: Location;
  status: StatusEnum;
  price: number;
  distance: number;
  typeOfGoods: string;
  vehicleType: string;
  deliveryNote?: string;
  approxWeight: number;
  createdBy: mongoose.ObjectId;
  acceptedBy: mongoose.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const schema = new mongoose.Schema<Order>(
  {
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
    vehicleType: { type: String },
    deliveryNote: { type: String },
    approxWeight: { type: Number },
    price: { type: Number },
    distance: { type: Number },
    typeOfGoods: { type: String },
    createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    acceptedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Order = mongoose.model<Order>('Order', schema);
type OrderType = mongoose.HydratedDocument<Order>;

export { OrderType, Order, StatusEnum };
