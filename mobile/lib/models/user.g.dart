// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProfileResponseImpl _$$GetProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProfileResponseImpl(
      success: json['success'] as bool,
      data:
          GetProfileResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetProfileResponseImplToJson(
        _$GetProfileResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$DriverLocationImpl _$$DriverLocationImplFromJson(Map<String, dynamic> json) =>
    _$DriverLocationImpl(
      address: json['address'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$DriverLocationImplToJson(
        _$DriverLocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'coordinates': instance.coordinates,
    };

_$DriverDetailsImpl _$$DriverDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DriverDetailsImpl(
      ownerNumber: json['ownerNumber'] as String?,
      driverNumber: json['driverNumber'] as String?,
      ownerName: json['ownerName'] as String?,
      driverName: json['driverName'] as String?,
      upiId: json['upiId'] as String?,
      location: json['location'] == null
          ? null
          : DriverLocation.fromJson(json['location'] as Map<String, dynamic>),
      vehicleBodyType: json['vehicleBodyType'] as String?,
      vehicleCapacity: json['vehicleCapacity'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      drivingLicenseNumber: json['drivingLicenseNumber'] as String?,
    );

Map<String, dynamic> _$$DriverDetailsImplToJson(_$DriverDetailsImpl instance) =>
    <String, dynamic>{
      'ownerNumber': instance.ownerNumber,
      'driverNumber': instance.driverNumber,
      'ownerName': instance.ownerName,
      'driverName': instance.driverName,
      'upiId': instance.upiId,
      'location': instance.location,
      'vehicleBodyType': instance.vehicleBodyType,
      'vehicleCapacity': instance.vehicleCapacity,
      'vehicleNumber': instance.vehicleNumber,
      'drivingLicenseNumber': instance.drivingLicenseNumber,
    };

_$GetProfileResponseDataImpl _$$GetProfileResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProfileResponseDataImpl(
      averageRating: (json['averageRating'] as num).toDouble(),
      completedOrders: json['completedOrders'] as int,
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String?,
      driverDetails: json['driverDetails'] == null
          ? null
          : DriverDetails.fromJson(
              json['driverDetails'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ProfileReviewData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GetProfileResponseDataImplToJson(
        _$GetProfileResponseDataImpl instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'completedOrders': instance.completedOrders,
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'phone': instance.phone,
      'driverDetails': instance.driverDetails,
      'reviews': instance.reviews,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
    };

_$ProfileReviewDataImpl _$$ProfileReviewDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileReviewDataImpl(
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      createdBy:
          ReviewCreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt:
          const DateTimeConvertor().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProfileReviewDataImplToJson(
        _$ProfileReviewDataImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'createdBy': instance.createdBy,
      'createdAt': const DateTimeConvertor().toJson(instance.createdAt),
    };

_$ReviewCreatedByImpl _$$ReviewCreatedByImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewCreatedByImpl(
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$ReviewCreatedByImplToJson(
        _$ReviewCreatedByImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
    };
