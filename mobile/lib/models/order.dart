import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logitech/models/converters.dart';
part 'order.freezed.dart';
part 'order.g.dart';

enum StatusType {
  @JsonValue('active')
  followRequest,
  @JsonValue('pending')
  info
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
    required String type,
    required String address,
    required List<int> coordinates,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}

@freezed
class GetOrdersResponseData with _$GetOrdersResponseData {
  const factory GetOrdersResponseData({
    required String id,
    required int price,
    required int distance,
    required Location sourceLocation,
    required Location destinationLocation,
    required String createdBy,
    required String acceptedBy,
    required StatusType type,
    @DateTimeConvertor() required DateTime createdAt,
    @DateTimeConvertor() required DateTime updatedAt,
  }) = _GetOrdersResponseData;

  factory GetOrdersResponseData.fromJson(Map<String, Object?> json) =>
      _$GetOrdersResponseDataFromJson(json);
}
