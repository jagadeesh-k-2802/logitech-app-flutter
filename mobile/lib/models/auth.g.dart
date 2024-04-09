// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenResponseImpl _$$TokenResponseImplFromJson(Map<String, dynamic> json) =>
    _$TokenResponseImpl(
      success: json['success'] as bool,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$TokenResponseImplToJson(_$TokenResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      success: json['success'] as bool,
      data: UserResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$DriverDetailsImpl _$$DriverDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DriverDetailsImpl(
      ownerNumber: json['ownerNumber'] as String?,
      driverNumber: json['driverNumber'] as String?,
      ownerName: json['ownerName'] as String?,
      driverName: json['driverName'] as String?,
      city: json['city'] as String?,
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
      'city': instance.city,
      'vehicleBodyType': instance.vehicleBodyType,
      'vehicleCapacity': instance.vehicleCapacity,
      'vehicleNumber': instance.vehicleNumber,
      'drivingLicenseNumber': instance.drivingLicenseNumber,
    };

_$UserResponseDataImpl _$$UserResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseDataImpl(
      id: json['_id'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String?,
      driverDetails: json['driverDetails'] == null
          ? null
          : DriverDetails.fromJson(
              json['driverDetails'] as Map<String, dynamic>),
      fcmToken: json['fcmToken'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserResponseDataImplToJson(
        _$UserResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'type': instance.type,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'phone': instance.phone,
      'driverDetails': instance.driverDetails,
      'fcmToken': instance.fcmToken,
      'createdAt': instance.createdAt,
    };
