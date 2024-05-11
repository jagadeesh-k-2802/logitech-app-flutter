import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logitech/models/converters.dart';
part 'auth.freezed.dart';
part 'auth.g.dart';

enum UserType {
  @JsonValue('customer')
  customer,
  @JsonValue('driver')
  driver
}

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    required bool success,
    required String token,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, Object?> json) =>
      _$TokenResponseFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool success,
    required UserResponseData data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class DriverLocation with _$DriverLocation {
  const factory DriverLocation({
    required String address,
    required List<double> coordinates,
  }) = _DriverLocation;

  factory DriverLocation.fromJson(Map<String, Object?> json) =>
      _$DriverLocationFromJson(json);
}

@freezed
class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    required String? ownerNumber,
    required String? driverNumber,
    required String? ownerName,
    required String? driverName,
    required String? upiId,
    required DriverLocation? location,
    required String? vehicleBodyType,
    required String? vehicleCapacity,
    required String? vehicleNumber,
    required String? drivingLicenseNumber,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, Object?> json) =>
      _$DriverDetailsFromJson(json);
}

@freezed
class UserResponseData with _$UserResponseData {
  const factory UserResponseData({
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required UserType type,
    required String email,
    required String dateOfBirth,
    required String gender,
    required String? phone,
    required DriverDetails? driverDetails,
    required int unReadNotificationsCount,
    required String? fcmToken,
    @DateTimeConvertor() required String createdAt,
  }) = _UserResponseData;

  factory UserResponseData.fromJson(Map<String, Object?> json) =>
      _$UserResponseDataFromJson(json);
}
