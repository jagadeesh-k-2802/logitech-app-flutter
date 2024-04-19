import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/order.dart';

typedef Data = GetOrderStatsResponseData;

final driverOrderStatsProvider = FutureProvider.autoDispose<Data>(
  (ref) async {
    final response = await OrderService.getOrderStats();
    return response.data;
  },
);
