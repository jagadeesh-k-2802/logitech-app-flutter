// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetOrdersResponseImpl _$$GetOrdersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrdersResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => GetOrdersResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetOrdersResponseImplToJson(
        _$GetOrdersResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      type: json['type'] as String,
      address: json['address'] as String,
      coordinates:
          (json['coordinates'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'coordinates': instance.coordinates,
    };

_$GetOrdersResponseDataImpl _$$GetOrdersResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrdersResponseDataImpl(
      id: json['id'] as String,
      price: json['price'] as int,
      distance: json['distance'] as int,
      sourceLocation:
          Location.fromJson(json['sourceLocation'] as Map<String, dynamic>),
      destinationLocation: Location.fromJson(
          json['destinationLocation'] as Map<String, dynamic>),
      createdBy: json['createdBy'] as String,
      acceptedBy: json['acceptedBy'] as String,
      type: $enumDecode(_$StatusTypeEnumMap, json['type']),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConvertor().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GetOrdersResponseDataImplToJson(
        _$GetOrdersResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'distance': instance.distance,
      'sourceLocation': instance.sourceLocation,
      'destinationLocation': instance.destinationLocation,
      'createdBy': instance.createdBy,
      'acceptedBy': instance.acceptedBy,
      'type': _$StatusTypeEnumMap[instance.type]!,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
      'updatedAt': const DateTimeConvertor().toJson(instance.updatedAt),
    };

const _$StatusTypeEnumMap = {
  StatusType.followRequest: 'active',
  StatusType.info: 'pending',
};
