import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/order.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetOrdersResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetOrdersResponse orders = await OrderService.getOrders(
              page: page,
              limit: limit,
            );

            return orders.data;
          },
        );

  void invalidate() {
    state = state.copyWith(
      records: [],
      error: null,
      previousPageKeys: [],
      nextPageKey: 1,
    );

    load(1, 20);
  }
}

final ordersProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
