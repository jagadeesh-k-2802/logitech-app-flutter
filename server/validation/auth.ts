import { z } from 'zod';

export const login = z.object({
  body: z.object({
    identifier: z.string({
      required_error: 'Email, Username or Phone Number is required'
    }),
    password: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters'),
    fcmToken: z.string().optional().nullable()
  })
});

export const register = z.object({
  name: z
    .string({ required_error: 'Name is required' })
    .max(30, 'Name must not be greater than 30 characters'),
  avatar: z.string().optional().nullable(),
  dateOfBirth: z.string({ required_error: 'Date of Birth is required' }),
  email: z
    .string({ required_error: 'Email is required' })
    .email('Not a valid email'),
  gender: z.string({ required_error: 'Gender is required' }),
  password: z
    .string({ required_error: 'Password is required' })
    .min(6, 'Password must contain at least 6 characters'),
  fcmToken: z.string().optional().nullable(),
  phone: z.string().optional().nullable(),
  address: z.string().optional().nullable(),
  company: z.string().optional().nullable(),
  type: z.string().optional().nullable(),
  location: z
    .object({
      type: z.string(),
      address: z.string(),
      coordinates: z.array(z.number())
    })
    .nullable()
    .optional(),
  driverDetails: z
    .object({
      ownerNumber: z.string().optional().nullable(),
      driverNumber: z.string().optional().nullable(),
      ownerName: z.string().optional().nullable(),
      driverName: z.string().optional().nullable(),
      upiId: z.string().optional().nullable(),
      vehicleBodyType: z.string().optional().nullable(),
      vehicleCapacity: z.string().optional().nullable(),
      vehicleNumber: z.string().optional().nullable(),
      drivingLicenseNumber: z.string().optional().nullable(),
      aadharCardFile: z.string().optional().nullable(),
      drivingLicenseFile: z.string().optional().nullable(),
      fitnessCertificateFile: z.string().optional().nullable(),
      photoOfVehicleFile: z.string().optional().nullable(),
      driverSelfieFile: z.string().optional().nullable()
    })
    .optional()
    .nullable()
});

export const updateDetails = z.object({
  body: z.object({
    name: z
      .string({ required_error: 'Name is required' })
      .max(30, 'Name must not be greater than 30 characters'),
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email'),
    phone: z.string({ required_error: 'Phone is required' }),
    gender: z.string({ required_error: 'Gender is required' }),
    upiId: z.string({ required_error: 'UPI ID is required' })
  })
});

export const updatePassword = z.object({
  body: z.object({
    currentPassword: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters'),
    newPassword: z
      .string({ required_error: 'Confirm Password is required' })
      .min(6, 'Password must contain atleast 6 characters')
  })
});

export const updateAvatar = z.object({
  removeAvatar: z.boolean({ required_error: 'removeAvatar is required' })
});

export const forgotPassword = z.object({
  body: z.object({
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email')
  })
});

export const verifyForgotPasswordCode = z.object({
  body: z.object({
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email'),
    code: z.string({ required_error: 'Code is required' })
  })
});

export const resetPassword = z.object({
  body: z.object({
    code: z.string({ required_error: 'Code is required' }),
    password: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters')
  })
});
