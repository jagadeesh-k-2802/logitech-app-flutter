import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { TokenInterface } from '../middlewares/auth';
import { generateSixDigitRandomNumber } from '../utils/functions';

enum AccountTypeEnum {
  customer = 'customer',
  driver = 'driver'
}

interface DriverDetails {
  ownerNumber: string;
  driverNumber: string;
  ownerName: string;
  driverName: string;
  city: string;
  vehicleBodyType: string;
  vehicleCapacity: string;
  vehicleNumber: string;
  drivingLicenseNumber: string;
  aadharCardFile: string;
  drivingLicenseFile: string;
  fitnessCertificateFile: string;
  photoOfVehicleFile: string;
  driverSelfieFile: string;
}

interface User {
  type: AccountTypeEnum;
  name: string;
  gender: string;
  avatar: string;
  dateOfBirth: string;
  email: string;
  password?: string;
  phone: string;
  address: string;
  company: string;
  fcmToken: string;
  driverDetails?: DriverDetails;
  resetPasswordToken?: string;
  resetPasswordExpire?: Date;
  createdAt: Date;
  updatedAt: Date;
}

interface UserMethods {
  getSignedJwtToken(): string;
  matchPassword(enteredPassword: string): Promise<boolean>;
  getResetPasswordToken(): string;
}

type UserModel = mongoose.Model<User, object, UserMethods>;

const driverDetailsSchema = new mongoose.Schema<DriverDetails>({
  ownerNumber: { type: String },
  driverNumber: { type: String },
  ownerName: { type: String },
  driverName: { type: String },
  city: { type: String },
  vehicleBodyType: { type: String },
  vehicleCapacity: { type: String },
  vehicleNumber: { type: String },
  drivingLicenseNumber: { type: String },
  aadharCardFile: { type: String },
  drivingLicenseFile: { type: String },
  fitnessCertificateFile: { type: String },
  photoOfVehicleFile: { type: String },
  driverSelfieFile: { type: String }
});

const schema = new mongoose.Schema<User, UserModel, UserMethods>(
  {
    name: {
      type: String,
      required: [true, 'Name is required'],
      maxlength: [20, 'Name should not exceed 16 characters']
    },
    type: { type: String, enum: Object.values(AccountTypeEnum) },
    gender: { type: String },
    dateOfBirth: { type: String },
    avatar: { type: String, default: 'default-profile.png' },
    email: {
      type: String,
      required: [true, 'Please add an Email'],
      unique: true
    },
    phone: {
      type: String,
      unique: true
    },
    password: {
      type: String,
      required: [true, 'Please add a Password'],
      minlength: 6,
      select: false
    },
    address: { type: String },
    company: { type: String },
    fcmToken: { type: String },
    driverDetails: { type: driverDetailsSchema },
    resetPasswordToken: { type: String },
    resetPasswordExpire: { type: Date },
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

// Hash password using bcrypt before saving
schema.pre('save', async function (next) {
  if (!this.isModified('password')) {
    next();
  }

  const salt = await bcrypt.genSalt(10);

  if (this.password !== undefined) {
    this.password = await bcrypt.hash(this.password, salt);
  }
});

// Sign And Return JWT
schema.method('getSignedJwtToken', function () {
  return jwt.sign(
    { id: this._id.toString() } as TokenInterface,
    process.env.JWT_SECRET,
    {
      expiresIn: process.env.JWT_EXPIRE
    }
  );
});

// Match user entered password to hashed password in database
schema.method('matchPassword', async function (enteredPassword: string) {
  if (this.password !== undefined) {
    return await bcrypt.compare(enteredPassword, this.password);
  }
});

// Generate and hash password token
schema.method('getResetPasswordToken', function (): string {
  const resetToken = generateSixDigitRandomNumber().toString();
  this.resetPasswordToken = resetToken;
  // Set expire for 10 mins
  this.resetPasswordExpire = new Date(Date.now() + 10 * 60 * 1000);
  return resetToken;
});

const User = mongoose.model<User, UserModel>('User', schema);
type UserType = mongoose.HydratedDocument<User, UserMethods>;

export { UserType, AccountTypeEnum, User };
