import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logitech/config/env.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/screens/customer/place_order_screen.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/formatters.dart';
import 'package:logitech/utils/functions.dart';

class CustomerHomeScreen extends ConsumerStatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  ConsumerState<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends ConsumerState<CustomerHomeScreen> {
  late GoogleMapController mapController;
  int distanceLimit = 5;
  CameraPosition cameraPos = const CameraPosition(target: LatLng(0.0, 0.0));
  late Position currentPosition;
  String currentAddress = '';
  (double, double) startCoordinates = (0, 0);
  (double, double) destinationCoordinates = (0, 0);
  final startController = TextEditingController();
  final destinationController = TextEditingController();
  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();
  double? totalDistance;
  double? totalCost;
  Set<Marker> markers = {};
  Set<(String, LatLng)> activeHubs = {};
  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  List<(String, LatLng)> hubs = [
    ('Thiruvallur', const LatLng(13.1231, 79.9120)),
    ('Arakkonam', const LatLng(13.0841, 79.6704)),
    ('Bangalore', const LatLng(12.9716, 77.5946)),
    ('Chennai', const LatLng(13.0827, 80.2707)),
    ('Electronic City, Bangalore', const LatLng(12.9718, 77.5939)),
    ('Coimbatore', const LatLng(11.0168, 76.9558)),
    ('Visakhapatnam', const LatLng(17.6868, 83.2185)),
    ('Sriperumbudur, Chennai', const LatLng(13.0493, 80.2123)),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCurrentLocation();
    });
  }

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = position;

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });

      await getAddress();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      if (placemarks.isNotEmpty) {
        setState(() {
          currentAddress = addressFormatter(placemarks[0]);
          startController.text = currentAddress;
        });
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> getCoordinates() async {
    try {
      List<Location> locations = await locationFromAddress(
        startController.text,
      );

      if (locations.isNotEmpty) {
        Location location = locations[0];

        setState(() {
          currentPosition = Position(
            latitude: location.latitude,
            longitude: location.longitude,
            timestamp: DateTime.now(),
            accuracy: 2,
            altitude: 2,
            altitudeAccuracy: 80,
            heading: 0,
            headingAccuracy: 80,
            speed: 0,
            speedAccuracy: 80,
          );
        });
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<bool> calculateDistance() async {
    try {
      markers.clear();
      activeHubs.clear();
      polylineCoordinates.clear();

      List<Location> startPlacemark = await locationFromAddress(
        startController.text,
      );

      List<Location> destinationPlacemark = await locationFromAddress(
        destinationController.text,
      );

      double startLatitude = startController.text == currentAddress
          ? currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = startController.text == currentAddress
          ? currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;
      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString = '($destinationLatitude, ';
      destinationCoordinatesString += '$destinationLongitude)';
      startCoordinates = (startLatitude, startLongitude);
      destinationCoordinates = (destinationLatitude, destinationLongitude);

      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startController.text,
        ),
      );

      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationController.text,
        ),
      );

      markers.add(startMarker);
      markers.add(destinationMarker);

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

      double distance = FlutterMapMath().distanceBetween(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
        "kilometers",
      );

      for (var hub in activeHubs) {
        markers.add(
          Marker(
            markerId: MarkerId(hub.$1),
            position: hub.$2,
            icon: BitmapDescriptor.defaultMarkerWithHue(50),
            infoWindow: InfoWindow(
              title: 'Hub ${hub.$1}',
              snippet: hub.$1,
            ),
          ),
        );
      }

      if (distance < distanceLimit) {
        setState(() {
          markers.clear();
          polylineCoordinates.clear();
          hubs.clear();
        });

        if (!mounted) return false;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Should be at least $distanceLimit Km')),
        );

        return false;
      }

      setState(() {
        totalDistance = distance;
        totalCost = distance * 15;
      });

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
    Set<(String, LatLng)> selectedHubs = {};

    for (var hub in hubs) {
      if (isPointInsidePolygon(hub.$2, polylineCoordinates)) {
        selectedHubs.add(hub);
      }
    }

    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: polylineCoordinates,
      width: 3,
    );

    polylines[id] = polyline;
    setState(() => activeHubs = selectedHubs);
  }

  Future<void> onMapTap(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String geoCodeLoation = addressFormatter(placemarks[0]);
        destinationController.text = geoCodeLoation;
      }

      await calculateDistance();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> onPlaceOrder() async {
    if (polylineCoordinates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Roadways Exists')),
      );

      return;
    }

    await context.pushNamed(
      Routes.placeOrder,
      extra: PlaceOrderScreenArgs(
        startAddress: startController.text,
        destinationAddress: destinationController.text,
        startCoordinates: startCoordinates,
        destinationCoordinates: destinationCoordinates,
        totalCost: totalCost ?? 0,
        totalDistance: totalDistance ?? 0,
        hubs: activeHubs,
      ),
    );

    setState(() {
      markers.clear();
      polylineCoordinates.clear();
      destinationController.text = "";
      totalDistance = null;
      totalCost = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${user?.name}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
            child: Column(
              children: [
                TextFormField(
                  controller: startController,
                  onFieldSubmitted: (value) async => await getCoordinates(),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.start),
                    hintText: 'Start Address',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: destinationController,
                  onFieldSubmitted: (value) async => await calculateDistance(),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Destination Address',
                    icon: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: const Icon(Icons.start_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_shipping),
                  label: Text(
                    totalDistance == null
                        ? 'Place Order'
                        : 'Place Order (${moneyFormatter(totalCost)} | ${kilometresFormatter(totalDistance)})',
                  ),
                  onPressed: totalDistance == null ? null : onPlaceOrder,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.my_location_sharp),
        onPressed: () => getCurrentLocation(),
        style: primaryIconButtonStyle,
      ),
      body: GoogleMap(
        markers: Set<Marker>.from(markers),
        initialCameraPosition: cameraPos,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onTap: onMapTap,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}
