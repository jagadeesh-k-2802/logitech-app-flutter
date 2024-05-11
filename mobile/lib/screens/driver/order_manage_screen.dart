import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/services/order.dart';
import 'package:logitech/utils/functions.dart';
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
  Future<void> openCoordinatesInMap(double lat, double lon) async {
    String url = 'https://maps.google.com/maps?q=$lat,$lon';
    await launchUrl(Uri.parse(url));
  }

  Future<void> onLocationUpdate(int index, GetOrderResponseData data) async {
    try {
      (Position, String)? location = await getCurrentLocation(context);

      if (location == null) {
        throw Exception('Cannot fetch GPS Location');
      }

      List<double> userCoordinates = [
        location.$1.latitude,
        location.$1.longitude,
      ];

      if (index == 0) {
        await OrderService.updateOrderLocation(
          id: widget.orderId,
          index: index,
          message: 'Started at ${data.sourceLocation.address}',
          coordinates: data.sourceLocation.coordinates.reversed.toList(),
          userCoordinates: userCoordinates,
        );
      } else if (index - 1 == data.hubs.length) {
        await OrderService.updateOrderLocation(
          id: widget.orderId,
          index: index,
          message: 'Reached Destination ${data.destinationLocation.address}',
          coordinates: data.destinationLocation.coordinates.reversed.toList(),
          userCoordinates: userCoordinates,
        );
      } else {
        await OrderService.updateOrderLocation(
          id: widget.orderId,
          index: index,
          message: 'Arrived Hub at ${data.hubs[index - 1].address}',
          coordinates: data.hubs[index - 1].coordinates.reversed.toList(),
          userCoordinates: userCoordinates,
        );
      }

      ref.invalidate(orderProvider(widget.orderId));
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location Updated!')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Widget buildTimeLineControl(int index, GetOrderResponseData data) {
    List<LocationUpdate> updates = data.locationUpdates;
    int size = updates.length;

    if (index < size) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ElevatedButton(
          onPressed: null,
          child: Text('Done'),
        ),
      );
    } else if (index == size) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ElevatedButton(
          onPressed: () => onLocationUpdate(index, data),
          child: const Text('Update'),
        ),
      );
    }

    return Container();
  }

  Widget buildTimeLineItem(int index, GetOrderResponseData data) {
    if (index == 0) {
      return InkWell(
        onTap: () async => await openCoordinatesInMap(
          data.sourceLocation.coordinates[1],
          data.sourceLocation.coordinates[0],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Start - ${data.sourceLocation.address}',
            softWrap: true,
          ),
        ),
      );
    }

    if (index - 1 == data.hubs.length) {
      return InkWell(
        onTap: () async => await openCoordinatesInMap(
          data.destinationLocation.coordinates[1],
          data.destinationLocation.coordinates[0],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Destination - ${data.destinationLocation.address}'),
        ),
      );
    }

    return Row(
      children: [
        InkWell(
          onTap: () async => await openCoordinatesInMap(
            data.hubs[index - 1].coordinates[1],
            data.hubs[index - 1].coordinates[0],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Hub - ${data.hubs[index - 1].address}',
              textAlign: TextAlign.left,
            ),
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
      TextTheme textTheme = Theme.of(context).textTheme;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  size: 75,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text('Order Delivered', style: titleLargeBold(context)),
          const Text(
            'The Order has been successfully delivered\n Thank You.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: !data.isPaymentDone,
            child: Column(
              children: [
                const Text('Waiting for the customer to send the payment'),
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    children: <TextSpan>[
                      const TextSpan(text: 'If taking longer call Support: '),
                      TextSpan(
                        text: customerSupportNumber,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(
                              Uri.parse('tel:$customerSupportNumber'),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: data.isPaymentDone,
            child: const Column(
              children: [
                Card(
                  surfaceTintColor: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPagePadding),
                    child: Text('The customer has paid successfully.'),
                  ),
                )
              ],
            ),
          )
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
