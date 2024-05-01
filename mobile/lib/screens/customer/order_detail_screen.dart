import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/services/order.dart';
import 'package:logitech/state/order/order_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  final String orderId;
  const OrderDetailScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  Future<void> onPayment(GetOrderResponseData data) async {
    try {
      if (!skipPayments) {
        await EasyUpiPaymentPlatform.instance.startPayment(
          EasyUpiPaymentModel(
            payeeVpa: data.acceptedBy?.driverDetails?.upiId ?? '',
            payeeName: data.acceptedBy?.name ?? '',
            amount: fakePayments ? 1 : data.price,
            description: 'Payment for LogiTech Delivery of Order ${data.id}',
          ),
        );
      }

      await OrderService.updateOrder(id: data.id, isPaymentDone: true);
      ref.invalidate(orderProvider(widget.orderId));
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment Successful')),
      );
    } on EasyUpiPaymentException {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaction Failed')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Widget buildTimeLineItem(int index, GetOrderResponseData data) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        data.locationUpdates[index].message,
        softWrap: true,
      ),
    );
  }

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
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: data.status == StatusType.completed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Your Order Has Been Delievered',
                  style: titleLargeBold(context),
                ),
                Text(
                  'Your order has been successfully delivered on ${data.locationUpdates.isNotEmpty ? data.locationUpdates.last.message.split(' ')[0] : ''}',
                ),
                Visibility(
                  visible: !data.isPaymentDone,
                  child: const Text(
                    'Please make the payment at the earliest possible',
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: !data.isPaymentDone,
                  child: ElevatedButton(
                    onPressed: () async => await onPayment(data),
                    child: const Text('Make Payment'),
                  ),
                ),
                const SizedBox(height: 4),
                Visibility(
                  visible: !data.isRatingDone,
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.push(
                        Routes.ratingPath(data.acceptedBy?.id ?? '', data.id),
                      );

                      ref.invalidate(orderProvider(widget.orderId));
                    },
                    style: secondaryButtonStyle,
                    child: const Text('Send Rating'),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
              ],
            ),
          ),
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
          const SizedBox(height: 4),
          Row(
            children: [
              InkWell(
                onTap: () => context.push(
                  Routes.driverProfilePath(data.acceptedBy?.id ?? ''),
                ),
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 38,
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${data.acceptedBy?.avatar}',
                    ),
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
          Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder.fromStyle(
              itemCount: data.locationUpdates.length,
              indicatorStyle: IndicatorStyle.dot,
              contentsAlign: ContentsAlign.basic,
              oppositeContentsBuilder: (context, index) => buildTimeLineItem(
                index,
                data,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(orderProvider(widget.orderId));

    return Scaffold(
      appBar: AppBar(),
      body: provider.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(
              orderProvider(widget.orderId),
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPagePadding,
                ),
                child: buildBody(data),
              ),
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
