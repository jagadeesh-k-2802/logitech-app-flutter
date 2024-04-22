import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logitech/models/converters.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class GetProfileResponse with _$GetProfileResponse {
  const factory GetProfileResponse({
    required bool success,
    required GetProfileResponseData data,
  }) = _GetProfileResponse;

  factory GetProfileResponse.fromJson(Map<String, Object?> json) =>
      _$GetProfileResponseFromJson(json);
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
class GetProfileResponseData with _$GetProfileResponseData {
  const factory GetProfileResponseData({
    required double averageRating,
    required int completedOrders,
    @JsonKey(name: '_id') required String id,
    required String avatar,
    required String name,
    required String email,
    required String dateOfBirth,
    required String gender,
    required String? phone,
    required DriverDetails? driverDetails,
    required List<ProfileReviewData> reviews,
    @DateTimeConvertor() required DateTime createdAt,
  }) = _GetProfileResponseData;

  factory GetProfileResponseData.fromJson(Map<String, Object?> json) =>
      _$GetProfileResponseDataFromJson(json);
}

@freezed
class ProfileReviewData with _$ProfileReviewData {
  const factory ProfileReviewData({
    required int rating,
    required String comment,
    required ReviewCreatedBy createdBy,
    @DateTimeConvertor() required DateTime createdAt,
  }) = _ProfileReviewData;

  factory ProfileReviewData.fromJson(Map<String, Object?> json) =>
      _$ProfileReviewDataFromJson(json);
}

@freezed
class ReviewCreatedBy with _$ReviewCreatedBy {
  const factory ReviewCreatedBy({
    required String name,
    required String avatar,
  }) = _ReviewCreatedBy;

  factory ReviewCreatedBy.fromJson(Map<String, Object?> json) =>
      _$ReviewCreatedByFromJson(json);
}
