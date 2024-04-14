import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/state/order/orders_provider.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class DriverOrdersScreen extends ConsumerStatefulWidget {
  const DriverOrdersScreen({super.key});

  @override
  ConsumerState<DriverOrdersScreen> createState() => _DriverOrdersScreenState();
}

class _DriverOrdersScreenState extends ConsumerState<DriverOrdersScreen> {
  Widget buildOrderItem(GetOrdersResponseData data) {
    // TODO: Build Driver Order Item
    return const Text('Order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        automaticallyImplyLeading: false,
      ),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        pullToRefresh: true,
        provider: ordersProvider,
        itemBuilder: (context, item, index) => buildOrderItem(item),
        noItemsFoundIndicatorBuilder: (context, controller) {
          return const Center(child: Text('No Orders'));
        },
        pagedBuilder: (controller, builder) => PagedListView.separated(
          pagingController: controller,
          builderDelegate: builder,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}