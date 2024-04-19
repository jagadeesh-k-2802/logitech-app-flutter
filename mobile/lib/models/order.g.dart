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
      address: json['address'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'coordinates': instance.coordinates,
    };

_$HubImpl _$$HubImplFromJson(Map<String, dynamic> json) => _$HubImpl(
      address: json['address'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$HubImplToJson(_$HubImpl instance) => <String, dynamic>{
      'address': instance.address,
      'coordinates': instance.coordinates,
    };

_$CreatedByImpl _$$CreatedByImplFromJson(Map<String, dynamic> json) =>
    _$CreatedByImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$CreatedByImplToJson(_$CreatedByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };

_$AcceptedByImpl _$$AcceptedByImplFromJson(Map<String, dynamic> json) =>
    _$AcceptedByImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$AcceptedByImplToJson(_$AcceptedByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'phone': instance.phone,
    };

_$GetOrdersResponseDataImpl _$$GetOrdersResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrdersResponseDataImpl(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      sourceLocation:
          Location.fromJson(json['sourceLocation'] as Map<String, dynamic>),
      destinationLocation: Location.fromJson(
          json['destinationLocation'] as Map<String, dynamic>),
      createdBy: json['createdBy'] as String,
      acceptedBy: json['acceptedBy'] == null
          ? null
          : AcceptedBy.fromJson(json['acceptedBy'] as Map<String, dynamic>),
      status: $enumDecode(_$StatusTypeEnumMap, json['status']),
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
      'status': _$StatusTypeEnumMap[instance.status]!,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
      'updatedAt': const DateTimeConvertor().toJson(instance.updatedAt),
    };

const _$StatusTypeEnumMap = {
  StatusType.pending: 'pending',
  StatusType.accepted: 'accepted',
  StatusType.completed: 'completed',
};

_$GetOrderResponseImpl _$$GetOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrderResponseImpl(
      success: json['success'] as bool,
      data: GetOrderResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetOrderResponseImplToJson(
        _$GetOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetOrderResponseDataImpl _$$GetOrderResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrderResponseDataImpl(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      approxWeight: (json['approxWeight'] as num).toDouble(),
      sourceLocation:
          Location.fromJson(json['sourceLocation'] as Map<String, dynamic>),
      destinationLocation: Location.fromJson(
          json['destinationLocation'] as Map<String, dynamic>),
      hubs: (json['hubs'] as List<dynamic>)
          .map((e) => Hub.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleType: json['vehicleType'] as String,
      typeOfGoods: json['typeOfGoods'] as String,
      deliveryNote: json['deliveryNote'] as String,
      createdBy: CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      acceptedBy: json['acceptedBy'] == null
          ? null
          : AcceptedBy.fromJson(json['acceptedBy'] as Map<String, dynamic>),
      status: $enumDecode(_$StatusTypeEnumMap, json['status']),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConvertor().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GetOrderResponseDataImplToJson(
        _$GetOrderResponseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'distance': instance.distance,
      'approxWeight': instance.approxWeight,
      'sourceLocation': instance.sourceLocation,
      'destinationLocation': instance.destinationLocation,
      'hubs': instance.hubs,
      'vehicleType': instance.vehicleType,
      'typeOfGoods': instance.typeOfGoods,
      'deliveryNote': instance.deliveryNote,
      'createdBy': instance.createdBy,
      'acceptedBy': instance.acceptedBy,
      'status': _$StatusTypeEnumMap[instance.status]!,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
      'updatedAt': const DateTimeConvertor().toJson(instance.updatedAt),
    };

_$GetOrderStatsResponseImpl _$$GetOrderStatsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrderStatsResponseImpl(
      success: json['success'] as bool,
      data: GetOrderStatsResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetOrderStatsResponseImplToJson(
        _$GetOrderStatsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$GetOrderStatsResponseDataImpl _$$GetOrderStatsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOrderStatsResponseDataImpl(
      averageRating: (json['averageRating'] as num).toDouble(),
      completedOrders: json['completedOrders'] as int,
      totalEarned: (json['totalEarned'] as num).toDouble(),
    );

Map<String, dynamic> _$$GetOrderStatsResponseDataImplToJson(
        _$GetOrderStatsResponseDataImpl instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'completedOrders': instance.completedOrders,
      'totalEarned': instance.totalEarned,
    };
