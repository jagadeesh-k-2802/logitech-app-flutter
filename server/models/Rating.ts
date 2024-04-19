import mongoose from 'mongoose';

interface Rating {
  name: string;
  comment: string;
  user: mongoose.ObjectId;
  createdBy: mongoose.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const schema = new mongoose.Schema<Rating>(
  {
    name: { type: String, required: true, maxlength: 100 },
    comment: { type: String, required: true, maxlength: 1000 },
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Rating = mongoose.model<Rating>('Rating', schema);
type RatingType = mongoose.HydratedDocument<Rating>;

export { RatingType, Rating };
