import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/state/order/order_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  final String orderId;
  const OrderDetailScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  Widget buildBody(GetOrderResponseData data) {
    if (data.status == StatusType.pending) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Address', style: titleLargeBold(context)),
          Text(data.sourceLocation.address, maxLines: 1),
          Text(data.destinationLocation.address, maxLines: 1),
          const SizedBox(height: 20),
          Text('Order Details', style: titleLargeBold(context)),
          Text('Vehicle Type: ${data.vehicleType}', maxLines: 1),
          Text('Total Cost: ${moneyFormatter(data.price)}'),
          Text('Total Distance: ${kilometresFormatter(data.distance)}'),
          Text('Order Created On: ${dateFormatter(data.createdAt)}'),
          const SizedBox(height: 20),
          Text('Current Status', style: titleLargeBold(context)),
          const Text('Waiting for a Driver to Accept your Order.'),
          const Text('You will be Notified when someone accepts your order.'),
        ],
      );
    } else if (data.status == StatusType.accepted) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Address', style: titleLargeBold(context)),
          Text(data.sourceLocation.address, maxLines: 1),
          Text(data.destinationLocation.address, maxLines: 1),
          const SizedBox(height: 20),
          Text('Order Details', style: titleLargeBold(context)),
          Text('Vehicle Type: ${data.vehicleType}', maxLines: 1),
          Text('Total Cost: ${moneyFormatter(data.price)}'),
          Text('Total Distance: ${kilometresFormatter(data.distance)}'),
          Text('Order Created On: ${dateFormatter(data.createdAt)}'),
          const SizedBox(height: 20),
          Text('Driver Details', style: titleLargeBold(context)),
          Row(
            children: [
              ClipOval(
                child: CircleAvatar(
                  radius: 38,
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${data.acceptedBy?.avatar}',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${data.acceptedBy?.name}', maxLines: 1),
                  GestureDetector(
                    child: Text(data.createdBy.phone, maxLines: 1),
                    onTap: () async {
                      await launchUrl(
                        Uri.parse('tel:${data.acceptedBy?.phone}'),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Text('Location Updates', style: titleLargeBold(context)),
        ],
      );
    } else {
      // TODO: Completed State in OrderDetail
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(orderProvider(widget.orderId));

    return Scaffold(
      appBar: AppBar(),
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
