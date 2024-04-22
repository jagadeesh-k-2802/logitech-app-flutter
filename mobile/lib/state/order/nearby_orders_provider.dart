import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/order.dart';

typedef Data = List<GetOrdersResponseData>;

GetOrdersResponseData tempData = GetOrdersResponseData(
  id: "-1",
  price: 0,
  distance: 0,
  sourceLocation: const Location(address: '', coordinates: []),
  destinationLocation: const Location(address: '', coordinates: []),
  createdBy: "",
  status: StatusType.pending,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

final nearbyOrdersProvider = FutureProvider.autoDispose.family<Data, int>(
  (ref, radius) async {
    final response = await OrderService.getOrdersNearby(radius: radius);
    return [tempData, ...response.data];
  },
);
