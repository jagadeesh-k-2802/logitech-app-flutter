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

interface Hub {
  type: string;
  address: string;
  coordinates: mongoose.Types.Array<number>;
}

interface LocationUpdate {
  index: number;
  message: string;
}

interface Order {
  sourceLocation: Location;
  destinationLocation: Location;
  hubs: mongoose.Types.Array<Hub>;
  status: StatusEnum;
  price: number;
  isPaymentDone: boolean;
  isRatingDone: boolean;
  distance: number;
  typeOfGoods: string;
  vehicleType: string;
  deliveryNote?: string;
  approxWeight: number;
  locationUpdates: mongoose.Types.Array<LocationUpdate>;
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
    hubs: [
      {
        type: { type: String, enum: ['Point'] },
        address: { type: String },
        coordinates: { type: [Number], index: '2dsphere' }
      }
    ],
    status: {
      type: String,
      default: StatusEnum.pending,
      enum: Object.values(StatusEnum)
    },
    vehicleType: { type: String },
    deliveryNote: { type: String },
    approxWeight: { type: Number },
    locationUpdates: [{ index: Number, message: String }],
    price: { type: Number },
    isPaymentDone: { type: Boolean, default: false },
    isRatingDone: { type: Boolean, default: false },
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
