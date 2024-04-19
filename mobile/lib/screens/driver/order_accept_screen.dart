import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logitech/config/env.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/order.dart';
import 'package:logitech/state/order/nearby_orders_provider.dart';
import 'package:logitech/state/order/order_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';

class OrderAcceptScreen extends ConsumerStatefulWidget {
  final String orderId;
  const OrderAcceptScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderAcceptScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderAcceptScreen> {
  Set<Marker> markers = {};
  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController mapController;
  int distanceLimit = 5;
  CameraPosition cameraPos = const CameraPosition(target: LatLng(0.0, 0.0));
  List<LatLng> polylineCoordinates = [];

  Future<bool> calculateDistance(GetOrderResponseData data) async {
    try {
      markers.clear();
      polylineCoordinates.clear();

      double startLatitude = data.sourceLocation.coordinates[1];
      double startLongitude = data.sourceLocation.coordinates[0];
      double destinationLatitude = data.destinationLocation.coordinates[1];
      double destinationLongitude = data.destinationLocation.coordinates[0];

      Marker startMarker = Marker(
        markerId: const MarkerId('Start'),
        position: LatLng(startLatitude, startLongitude),
        icon: BitmapDescriptor.defaultMarker,
      );

      Marker destinationMarker = Marker(
        markerId: const MarkerId('Destination'),
        position: LatLng(destinationLatitude, destinationLongitude),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(startMarker);
      markers.add(destinationMarker);

      for (var hub in data.hubs) {
        markers.add(
          Marker(
            markerId: MarkerId(hub.address),
            position: LatLng(hub.coordinates[1], hub.coordinates[0]),
            icon: BitmapDescriptor.defaultMarkerWithHue(50),
            infoWindow: InfoWindow(
              title: 'Hub ${hub.address}',
              snippet: hub.address,
            ),
          ),
        );
      }

      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;

      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;

      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;

      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;
      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await createPolylines(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );

      return true;
    } catch (error) {
      if (!mounted) return false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }

    return false;
  }

  // Create the polylines for showing the route between two places
  Future<void> createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Environment.googleMapsApiKey,
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    PolylineId id = const PolylineId('poly');

    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: polylineCoordinates,
      width: 3,
    );

    polylines[id] = polyline;
    setState(() {});
  }

  Future<void> onAcceptOrder() async {
    try {
      await OrderService.acceptOrder(id: widget.orderId);
      if (!mounted) return;
      ref.invalidate(nearbyOrdersProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order Accepted Successfully')),
      );

      context.pop();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Widget buildBody(GetOrderResponseData data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Owner Details', style: titleLargeBold(context)),
            Text(data.createdBy.name, maxLines: 1),
            const SizedBox(height: 20),
            Text(data.sourceLocation.address, maxLines: 1),
            Text(data.destinationLocation.address, maxLines: 1),
            Text('Order Details', style: titleLargeBold(context)),
            Text('Vehicle Type: ${data.vehicleType}', maxLines: 1),
            Text('Type Of Goods: ${data.typeOfGoods}', maxLines: 1),
            Text('Approx Weight: ${data.approxWeight} Kg', maxLines: 1),
            Text('Total Cost: ${moneyFormatter(data.price)}'),
            Text('Total Distance: ${kilometresFormatter(data.distance)}'),
            Text('Order Created On: ${dateFormatter(data.createdAt)}'),
            const SizedBox(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.6,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: GoogleMap(
                  markers: Set<Marker>.from(markers),
                  initialCameraPosition: cameraPos,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  polylines: Set<Polyline>.of(polylines.values),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    calculateDistance(data);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(orderProvider(widget.orderId));

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPagePadding),
        child: ElevatedButton.icon(
          onPressed: onAcceptOrder,
          icon: const Icon(Icons.done),
          label: const Text('Accept Order'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: null,
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
