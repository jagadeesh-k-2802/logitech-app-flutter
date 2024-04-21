import { z } from 'zod';

export const createOrder = z.object({
  body: z.object({
    vehicleType: z.string({ required_error: 'Type of vehicle is required' }),
    startAddress: z.string({ required_error: 'Start Address is required' }),
    destinationAddress: z.string({ required_error: 'Destination is required' }),
    startLatitude: z.number(),
    startLongitude: z.number(),
    destinationLatitude: z.number(),
    destinationLongitude: z.number(),
    hubs: z.array(
      z.object({
        address: z.string(),
        coordinates: z.array(z.number())
      })
    ),
    deliveryNote: z.string().optional().nullable(),
    totalCost: z.string({ required_error: 'Total Cost is required' }),
    totalDistance: z.string({ required_error: 'Total Distance is required' }),
    approxWeight: z.string({ required_error: 'Approx Weight is required' }),
    typeOfGoods: z.string({ required_error: 'Type of Goods is required' })
  })
});

export const updateOrderLocation = z.object({
  body: z.object({
    index: z.number({ required_error: 'Index is required' }),
    message: z.string({ required_error: 'Message is required' }),
    coordinates: z.tuple([z.number(), z.number()]),
    userCoordinates: z.tuple([z.number(), z.number()])
  })
});
