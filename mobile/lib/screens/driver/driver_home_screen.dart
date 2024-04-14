import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/widgets/core/info_card.dart';

class DriverHomeScreen extends ConsumerStatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  ConsumerState<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends ConsumerState<DriverHomeScreen> {
  String averageRating = '...';
  String totalDeliveries = '...';
  String totalEarned = '...';
  int requestRadius = 200;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    // TODO: Fetch Driver Stats
  }

  void showFilterModal() {
    TextTheme textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
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
                        'Request Geo Radius',
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
                            label: '$requestRadius km',
                            value: requestRadius.toDouble(),
                            onChanged: (double value) {
                              setState(() => requestRadius = value.toInt());
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$requestRadius km',
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
                            // TODO: Refresh data
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InfoCard(
            icon: Icons.star,
            title: 'Average Rating',
            description: averageRating,
            onTap: () {},
          ),
          InfoCard(
            icon: Icons.local_shipping,
            title: 'Times Delivered',
            description: totalEarned,
            onTap: () {},
          ),
          InfoCard(
            icon: Icons.attach_money_rounded,
            title: 'Total Earned',
            description: totalDeliveries,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildOrderItem(GetOrdersResponseData item, int index) {
    if (index == 0) return buildHomeStats();
    // TODO: Build Order Item
    return const Text('Test');
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    // TODO: Create Surrounding Orders Provider List with Filter
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, ${user?.name}')),
      body: null,
    );
  }
}
