import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/state/order/driver_order_stats_provider.dart';
import 'package:logitech/state/order/nearby_orders_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';
import 'package:logitech/widgets/core/info_card.dart';

class DriverHomeScreen extends ConsumerStatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  ConsumerState<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends ConsumerState<DriverHomeScreen> {
  int nearbyRadius = 200;

  @override
  void initState() {
    super.initState();
  }

  void showFilterModal() {
    TextTheme textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: defaultPagePadding,
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Filter', style: textTheme.headlineMedium),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Nearby Orders Radius (Km)',
                        style: textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Slider(
                            min: 50,
                            max: 500,
                            label: '$nearbyRadius km',
                            value: nearbyRadius.toDouble(),
                            onChanged: (double value) {
                              setState(() => nearbyRadius = value.toInt());
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$nearbyRadius km',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            ref.invalidate(nearbyOrdersProvider);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.done),
                          label: const Text('Apply'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildHomeStats() {
    final provider = ref.watch(driverOrderStatsProvider);

    return provider.when(
      data: (data) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InfoCard(
                icon: Icons.star,
                title: 'Average Rating',
                description: data.averageRating.toStringAsFixed(2),
                onTap: () {},
              ),
              InfoCard(
                icon: Icons.local_shipping,
                title: 'Completed Orders',
                description: data.completedOrders.toString(),
                onTap: () {},
              ),
              InfoCard(
                icon: Icons.attach_money_rounded,
                title: 'Total Earned',
                description: moneyFormatter(data.totalEarned),
                onTap: () {},
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(child: Text('Something went wrong'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildEmptyView() {
    return const Column(
      children: [
        SizedBox(height: 220),
        Text('No Nearby Orders Around You'),
      ],
    );
  }

  Widget buildOrdersTitleBar() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Delivery Orders Nearby',
                style: textTheme.titleLarge,
              ),
              const SizedBox(width: 8.0),
              const Icon(Icons.location_on_outlined),
            ],
          ),
          IconButton(
            onPressed: showFilterModal,
            icon: const Icon(Icons.filter_alt_sharp),
          )
        ],
      ),
    );
  }

  Widget buildOrderItem(GetOrdersResponseData item) {
    return InkWell(
      onTap: () => context.push(Routes.orderAcceptDetailPath(item.id)),
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
                Text('Order ID: ${item.id}'),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    item.sourceLocation.address,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    item.destinationLocation.address,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${moneyFormatter(item.price)} - ${kilometresFormatter(item.distance)}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(List<GetOrdersResponseData> data) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[];
      },
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(nearbyOrdersProvider);
          ref.invalidate(driverOrderStatsProvider);
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (data.length) + 1,
          itemBuilder: (context, index) {
            if (index == 0) return buildHomeStats();
            if (data.length < 2) return buildEmptyView();
            if (index == 1) return buildOrdersTitleBar();
            return buildOrderItem(data[index - 1]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;
    final provider = ref.watch(nearbyOrdersProvider(nearbyRadius));

    return Scaffold(
      appBar: AppBar(title: Text('Welcome, ${user?.name}')),
      body: provider.when(
        data: (data) {
          return buildBody(data);
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Something went wrong'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
