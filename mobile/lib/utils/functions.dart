import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// capitalize
/// * Capitalize first letter of word
///
String titleCase(String arg) {
  return arg[0].toUpperCase() + arg.substring(1);
}

/// validEmailAddress
/// * Validate whether the email address is valid
///
bool validEmailAddress(String? email) {
  if (email == null) return false;

  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

/// hasInternetConnection
/// * Check whether device has active internet connection
///
Future<bool> hasInternetConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

/// getCurrentLocation
/// * Fetches the current location of the user
///
Future<(Position, String)?> getCurrentLocation(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission = await Geolocator.checkPermission();

  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      if (!context.mounted) return null;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Text('Please Enable Location Permission');
        },
      );

      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    if (!context.mounted) return null;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Text('Please Enable Location Permission');
      },
    );

    return null;
  }

  Position position = await Geolocator.getCurrentPosition();

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

  return (position, geoCodeLoation);
}

/// isPointInsidePolygon (Ray Casting Algorithm)
/// * Check if a (lat, lng) is inside a polygon
///
bool isPointInsidePolygon(LatLng point, List<LatLng> polygon) {
  int intersectCount = 0;
  double precision = 1e-9;

  for (int i = 0; i < polygon.length - 1; i++) {
    LatLng p1 = polygon[i];
    LatLng p2 = polygon[i + 1];

    if (p1.longitude > p2.longitude) {
      LatLng temp = p1;
      p1 = p2;
      p2 = temp;
    }

    if (point.longitude >= p1.longitude && point.longitude <= p2.longitude) {
      double crossProduct =
          (point.latitude - p1.latitude) * (p2.longitude - p1.longitude) -
              (point.longitude - p1.longitude) * (p2.latitude - p1.latitude);

      if (crossProduct.abs() < precision && (p1.longitude <= p2.longitude)) {
        return true;
      }

      if (p1.longitude < point.longitude && p2.longitude >= point.longitude) {
        if (crossProduct.abs() < precision) {
          return true;
        }

        if (p1.latitude +
                (point.longitude - p1.longitude) /
                    (p2.longitude - p1.longitude) *
                    (p2.latitude - p1.latitude) <
            point.latitude) {
          intersectCount++;
        }
      }
    }
  }

  return intersectCount % 2 == 1;
}
