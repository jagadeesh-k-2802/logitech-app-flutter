import 'package:flutter/material.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logitech/config/env.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';

class CustomerHomeScreen extends ConsumerStatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  ConsumerState<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends ConsumerState<CustomerHomeScreen> {
  late GoogleMapController mapController;
  CameraPosition cameraPos = const CameraPosition(target: LatLng(0.0, 0.0));
  late Position currentPosition;
  String currentAddress = '';
  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();
  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();
  String? placeDistance;
  String? totalCost;
  Set<Marker> markers = {};
  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCurrentLocation();
    });
  }

  Future<void> getCurrentLocation() async {
    try {
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
      List<Placemark> places = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      Placemark place = places[0];

      setState(() {
        currentAddress = "${place.name},";
        currentAddress += ", ${place.locality}";
        currentAddress += "${place.postalCode}";
        currentAddress += ", ${place.country}";
        startAddressController.text = currentAddress;
        startAddressController.text = currentAddress;
      });
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
      polylineCoordinates.clear();

      List<Location> startPlacemark = await locationFromAddress(
        startAddressController.text,
      );

      List<Location> destinationPlacemark = await locationFromAddress(
        destinationAddressController.text,
      );

      double startLatitude = startAddressController.text == currentAddress
          ? currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = startAddressController.text == currentAddress
          ? currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;
      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString = '($destinationLatitude, ';
      destinationCoordinatesString += '$destinationLongitude)';

      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startAddressController.text,
        ),
      );

      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationAddressController.text,
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

      setState(() {
        placeDistance = '${distance.toStringAsFixed(2)} KM';
        totalCost = '₹ ${(distance * 20).toStringAsFixed(2)}';
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

    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: polylineCoordinates,
      width: 3,
    );

    polylines[id] = polyline;
  }

  Future<void> onMapTap(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String geoCodeLoation = '';

      if (placemarks.isNotEmpty) {
        geoCodeLoation += '${placemarks[0].street} ';
        geoCodeLoation += '${placemarks[0].subLocality} ';
        geoCodeLoation += '${placemarks[0].locality} ';
        geoCodeLoation += '${placemarks[0].postalCode} ';
        geoCodeLoation += '${placemarks[0].country} ';
      }

      destinationAddressController.text = geoCodeLoation;
      await calculateDistance();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
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
                  controller: startAddressController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.my_location_sharp),
                    hintText: 'Start Address',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: destinationAddressController,
                  onFieldSubmitted: (value) async => await calculateDistance(),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin),
                    hintText: 'Destination Address',
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_shipping),
                  label: Text(
                    placeDistance == null
                        ? 'Place Order'
                        : 'Place Order ($totalCost | $placeDistance)',
                  ),
                  onPressed: placeDistance == null ? null : () {},
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
