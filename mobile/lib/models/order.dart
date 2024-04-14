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
class AcceptedBy with _$AcceptedBy {
  const factory AcceptedBy({
    required String id,
    required String name,
  }) = _AcceptedBy;

  factory AcceptedBy.fromJson(Map<String, Object?> json) =>
      _$AcceptedByFromJson(json);
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
    required AcceptedBy? acceptedBy,
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
    required double distance,
    required double approxWeight,
    required Location sourceLocation,
    required Location destinationLocation,
    required String vehicleType,
    required String createdBy,
    required AcceptedBy? acceptedBy,
    required StatusType status,
    @DateTimeConvertor() required DateTime createdAt,
    @DateTimeConvertor() required DateTime updatedAt,
  }) = _GetOrderResponseData;

  factory GetOrderResponseData.fromJson(Map<String, Object?> json) =>
      _$GetOrderResponseDataFromJson(json);
}
