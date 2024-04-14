import 'package:geocoding/geocoding.dart';
import 'package:moment_dart/moment_dart.dart';

String kilometresFormatter(double? value) {
  if (value == null) return '';
  return '${value.toStringAsFixed(2)} Km';
}

String moneyFormatter(double? value) {
  if (value == null) return '';
  return '₹ ${value.toStringAsFixed(2)}';
}

String addressFormatter(Placemark placemark) {
  String address = "";
  address += placemark.street != null ? "${placemark.street}, " : "";
  address += placemark.subLocality != null ? "${placemark.subLocality}, " : "";
  address += placemark.thoroughfare != null ? "${placemark.thoroughfare}" : "";
  address += placemark.locality != null ? " - ${placemark.locality} " : "";
  address += placemark.postalCode != null ? "${placemark.postalCode} " : "";
  address += placemark.country != null ? "${placemark.country} " : "";
  return address;
}

String dateFormatter(DateTime dateTime) {
  return dateTime.toMoment().LLL;
}
