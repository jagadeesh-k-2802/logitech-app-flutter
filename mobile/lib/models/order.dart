import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logitech/models/converters.dart';
part 'order.freezed.dart';
part 'order.g.dart';

enum StatusType {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('completed')
  completed
}

@freezed
class GetOrdersResponse with _$GetOrdersResponse {
  const factory GetOrdersResponse({
    required bool success,
    required List<GetOrdersResponseData> data,
  }) = _GetOrdersResponse;

  factory GetOrdersResponse.fromJson(Map<String, Object?> json) =>
      _$GetOrdersResponseFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String address,
    required List<double> coordinates,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}

@freezed
class Hub with _$Hub {
  const factory Hub({
    required String address,
    required List<double> coordinates,
  }) = _Hub;

  factory Hub.fromJson(Map<String, Object?> json) => _$HubFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    required String id,
    required String name,
    required String phone,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, Object?> json) =>
      _$CreatedByFromJson(json);
}

@freezed
class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    required String? upiId,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, Object?> json) =>
      _$DriverDetailsFromJson(json);
}

@freezed
class AcceptedBy with _$AcceptedBy {
  const factory AcceptedBy({
    required String id,
    required String name,
    required DriverDetails? driverDetails,
    required String avatar,
    required String phone,
  }) = _AcceptedBy;

  factory AcceptedBy.fromJson(Map<String, Object?> json) =>
      _$AcceptedByFromJson(json);
}

@freezed
class LocationUpdate with _$LocationUpdate {
  const factory LocationUpdate({
    required int index,
    required String message,
  }) = _LocationUpdate;

  factory LocationUpdate.fromJson(Map<String, Object?> json) =>
      _$LocationUpdateFromJson(json);
}

@freezed
class GetOrdersResponseData with _$GetOrdersResponseData {
  const factory GetOrdersResponseData({
    required String id,
    required double price,
    required double distance,
    required Location sourceLocation,
    required Location destinationLocation,
    required String createdBy,
    required StatusType status,
    @DateTimeConvertor() required DateTime createdAt,
    @DateTimeConvertor() required DateTime updatedAt,
  }) = _GetOrdersResponseData;

  factory GetOrdersResponseData.fromJson(Map<String, Object?> json) =>
      _$GetOrdersResponseDataFromJson(json);
}

@freezed
class GetOrderResponse with _$GetOrderResponse {
  const factory GetOrderResponse({
    required bool success,
    required GetOrderResponseData data,
  }) = _GetOrderResponse;

  factory GetOrderResponse.fromJson(Map<String, Object?> json) =>
      _$GetOrderResponseFromJson(json);
}

@freezed
class GetOrderResponseData with _$GetOrderResponseData {
  const factory GetOrderResponseData({
    required String id,
    required double price,
    required bool isPaymentDone,
    required bool isRatingDone,
    required double distance,
    required double approxWeight,
    required Location sourceLocation,
    required Location destinationLocation,
    required List<Hub> hubs,
    required String vehicleType,
    required String typeOfGoods,
    required String deliveryNote,
    required List<LocationUpdate> locationUpdates,
    required CreatedBy createdBy,
    required AcceptedBy? acceptedBy,
    required StatusType status,
    @DateTimeConvertor() required DateTime createdAt,
    @DateTimeConvertor() required DateTime updatedAt,
  }) = _GetOrderResponseData;

  factory GetOrderResponseData.fromJson(Map<String, Object?> json) =>
      _$GetOrderResponseDataFromJson(json);
}

@freezed
class GetOrderStatsResponse with _$GetOrderStatsResponse {
  const factory GetOrderStatsResponse({
    required bool success,
    required GetOrderStatsResponseData data,
  }) = _GetOrderStatsResponse;

  factory GetOrderStatsResponse.fromJson(Map<String, Object?> json) =>
      _$GetOrderStatsResponseFromJson(json);
}

@freezed
class GetOrderStatsResponseData with _$GetOrderStatsResponseData {
  const factory GetOrderStatsResponseData({
    required double averageRating,
    required int completedOrders,
    required double totalEarned,
  }) = _GetOrderStatsResponseData;

  factory GetOrderStatsResponseData.fromJson(Map<String, Object?> json) =>
      _$GetOrderStatsResponseDataFromJson(json);
}
