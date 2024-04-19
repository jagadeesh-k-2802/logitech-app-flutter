import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/state/order/order_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';

class OrderManageScreen extends ConsumerStatefulWidget {
  final String orderId;
  const OrderManageScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderManageScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderManageScreen> {
  Widget buildTimeLineControl(int index, GetOrderResponseData data) {
    // TODO: Hide for Completed Locations

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Update'),
      ),
    );
  }

  Widget buildTimeLineItem(int index, GetOrderResponseData data) {
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          'Start - ${data.sourceLocation.address}',
          softWrap: true,
        ),
      );
    }

    if (index - 1 == data.hubs.length) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text('Destination - ${data.destinationLocation.address}'),
      );
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Hub - ${data.hubs[index - 1].address}',
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget buildBody(GetOrderResponseData data) {
    if (data.status == StatusType.accepted) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Owner Details', style: titleLargeBold(context)),
          Text(data.createdBy.name, maxLines: 1),
          GestureDetector(
            child: Text(data.createdBy.phone, maxLines: 1),
            onTap: () async {
              await launchUrl(Uri.parse('tel:${data.createdBy.phone}'));
            },
          ),
          const SizedBox(height: 20),
          Text('Order Details', style: titleLargeBold(context)),
          Text(data.sourceLocation.address, maxLines: 1),
          Text(data.destinationLocation.address, maxLines: 1),
          Text('Vehicle Type: ${data.vehicleType}', maxLines: 1),
          Text('Total Cost: ${moneyFormatter(data.price)}'),
          Text('Total Distance: ${kilometresFormatter(data.distance)}'),
          Text('Order Created On: ${dateFormatter(data.createdAt)}'),
          const SizedBox(height: 20),
          Text('Manage Order', style: titleLargeBold(context)),
          const Text('Please, Update Your Location After Reaching Hubs'),
          const SizedBox(height: 20),
          Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder.fromStyle(
              itemCount: data.hubs.length + 2,
              indicatorStyle: IndicatorStyle.dot,
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) => buildTimeLineControl(
                index,
                data,
              ),
              oppositeContentsBuilder: (context, index) => buildTimeLineItem(
                index,
                data,
              ),
            ),
          ),
        ],
      );
    } else {
      // TODO: Completed View
      return const Text('Completed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(orderProvider(widget.orderId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            tooltip: 'Open Google Maps',
            onPressed: () async {
              final data = provider.asData?.value;

              if (data != null) {
                final lat = data.destinationLocation.coordinates[1];
                final lon = data.destinationLocation.coordinates[0];
                String url = 'https://maps.google.com/maps?q=$lat,$lon';
                await launchUrl(Uri.parse(url));
              }
            },
          )
        ],
      ),
      body: provider.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
              ),
              child: buildBody(data),
            ),
          );
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
