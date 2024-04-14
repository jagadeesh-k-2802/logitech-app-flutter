import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/order.dart';

typedef Data = GetOrderResponseData;

final orderProvider = FutureProvider.autoDispose.family<Data, String>(
  (ref, id) async {
    final response = await OrderService.getOrder(id: id);
    return response.data;
  },
);
