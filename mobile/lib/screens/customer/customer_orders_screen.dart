import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/state/order/orders_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class CustomerOrdersScreen extends ConsumerStatefulWidget {
  const CustomerOrdersScreen({super.key});

  @override
  ConsumerState<CustomerOrdersScreen> createState() =>
      _CustomerOrdersScreenState();
}

class _CustomerOrdersScreenState extends ConsumerState<CustomerOrdersScreen> {
  Widget buildOrderItem(GetOrdersResponseData data) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => context.push(Routes.customerOrderDetailPath(data.id)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order ID: ${data.id}'),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    data.destinationLocation.address,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  '${moneyFormatter(data.price)} - ${kilometresFormatter(data.distance)}',
                ),
              ],
            ),
            data.status == StatusType.pending
                ? Text(
                    'Pending',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.amber,
                    ),
                  )
                : data.status == StatusType.accepted
                    ? Text(
                        'Live',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.green,
                        ),
                      )
                    : Text(
                        'Completed',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.green,
                        ),
                      ),
          ],
        ),
      ),
    );
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
