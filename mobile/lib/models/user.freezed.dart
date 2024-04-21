// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) {
  return _GetProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProfileResponse {
  bool get success => throw _privateConstructorUsedError;
  GetProfileResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProfileResponseCopyWith<GetProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProfileResponseCopyWith<$Res> {
  factory $GetProfileResponseCopyWith(
          GetProfileResponse value, $Res Function(GetProfileResponse) then) =
      _$GetProfileResponseCopyWithImpl<$Res, GetProfileResponse>;
  @useResult
  $Res call({bool success, GetProfileResponseData data});

  $GetProfileResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetProfileResponseCopyWithImpl<$Res, $Val extends GetProfileResponse>
    implements $GetProfileResponseCopyWith<$Res> {
  _$GetProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetProfileResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetProfileResponseDataCopyWith<$Res> get data {
    return $GetProfileResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetProfileResponseImplCopyWith<$Res>
    implements $GetProfileResponseCopyWith<$Res> {
  factory _$$GetProfileResponseImplCopyWith(_$GetProfileResponseImpl value,
          $Res Function(_$GetProfileResponseImpl) then) =
      __$$GetProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetProfileResponseData data});

  @override
  $GetProfileResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetProfileResponseImplCopyWithImpl<$Res>
    extends _$GetProfileResponseCopyWithImpl<$Res, _$GetProfileResponseImpl>
    implements _$$GetProfileResponseImplCopyWith<$Res> {
  __$$GetProfileResponseImplCopyWithImpl(_$GetProfileResponseImpl _value,
      $Res Function(_$GetProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetProfileResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetProfileResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProfileResponseImpl implements _GetProfileResponse {
  const _$GetProfileResponseImpl({required this.success, required this.data});

  factory _$GetProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProfileResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetProfileResponseData data;

  @override
  String toString() {
    return 'GetProfileResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProfileResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProfileResponseImplCopyWith<_$GetProfileResponseImpl> get copyWith =>
      __$$GetProfileResponseImplCopyWithImpl<_$GetProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _GetProfileResponse implements GetProfileResponse {
  const factory _GetProfileResponse(
      {required final bool success,
      required final GetProfileResponseData data}) = _$GetProfileResponseImpl;

  factory _GetProfileResponse.fromJson(Map<String, dynamic> json) =
      _$GetProfileResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetProfileResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetProfileResponseImplCopyWith<_$GetProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverLocation _$DriverLocationFromJson(Map<String, dynamic> json) {
  return _DriverLocation.fromJson(json);
}

/// @nodoc
mixin _$DriverLocation {
  String get address => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverLocationCopyWith<DriverLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverLocationCopyWith<$Res> {
  factory $DriverLocationCopyWith(
          DriverLocation value, $Res Function(DriverLocation) then) =
      _$DriverLocationCopyWithImpl<$Res, DriverLocation>;
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class _$DriverLocationCopyWithImpl<$Res, $Val extends DriverLocation>
    implements $DriverLocationCopyWith<$Res> {
  _$DriverLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverLocationImplCopyWith<$Res>
    implements $DriverLocationCopyWith<$Res> {
  factory _$$DriverLocationImplCopyWith(_$DriverLocationImpl value,
          $Res Function(_$DriverLocationImpl) then) =
      __$$DriverLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class __$$DriverLocationImplCopyWithImpl<$Res>
    extends _$DriverLocationCopyWithImpl<$Res, _$DriverLocationImpl>
    implements _$$DriverLocationImplCopyWith<$Res> {
  __$$DriverLocationImplCopyWithImpl(
      _$DriverLocationImpl _value, $Res Function(_$DriverLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_$DriverLocationImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverLocationImpl implements _DriverLocation {
  const _$DriverLocationImpl(
      {required this.address, required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$DriverLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverLocationImplFromJson(json);

  @override
  final String address;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'DriverLocation(address: $address, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverLocationImpl &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverLocationImplCopyWith<_$DriverLocationImpl> get copyWith =>
      __$$DriverLocationImplCopyWithImpl<_$DriverLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverLocationImplToJson(
      this,
    );
  }
}

abstract class _DriverLocation implements DriverLocation {
  const factory _DriverLocation(
      {required final String address,
      required final List<double> coordinates}) = _$DriverLocationImpl;

  factory _DriverLocation.fromJson(Map<String, dynamic> json) =
      _$DriverLocationImpl.fromJson;

  @override
  String get address;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$DriverLocationImplCopyWith<_$DriverLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverDetails _$DriverDetailsFromJson(Map<String, dynamic> json) {
  return _DriverDetails.fromJson(json);
}

/// @nodoc
mixin _$DriverDetails {
  String? get ownerNumber => throw _privateConstructorUsedError;
  String? get driverNumber => throw _privateConstructorUsedError;
  String? get ownerName => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;
  DriverLocation? get location => throw _privateConstructorUsedError;
  String? get vehicleBodyType => throw _privateConstructorUsedError;
  String? get vehicleCapacity => throw _privateConstructorUsedError;
  String? get vehicleNumber => throw _privateConstructorUsedError;
  String? get drivingLicenseNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverDetailsCopyWith<DriverDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetailsCopyWith<$Res> {
  factory $DriverDetailsCopyWith(
          DriverDetails value, $Res Function(DriverDetails) then) =
      _$DriverDetailsCopyWithImpl<$Res, DriverDetails>;
  @useResult
  $Res call(
      {String? ownerNumber,
      String? driverNumber,
      String? ownerName,
      String? driverName,
      DriverLocation? location,
      String? vehicleBodyType,
      String? vehicleCapacity,
      String? vehicleNumber,
      String? drivingLicenseNumber});

  $DriverLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$DriverDetailsCopyWithImpl<$Res, $Val extends DriverDetails>
    implements $DriverDetailsCopyWith<$Res> {
  _$DriverDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerNumber = freezed,
    Object? driverNumber = freezed,
    Object? ownerName = freezed,
    Object? driverName = freezed,
    Object? location = freezed,
    Object? vehicleBodyType = freezed,
    Object? vehicleCapacity = freezed,
    Object? vehicleNumber = freezed,
    Object? drivingLicenseNumber = freezed,
  }) {
    return _then(_value.copyWith(
      ownerNumber: freezed == ownerNumber
          ? _value.ownerNumber
          : ownerNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverNumber: freezed == driverNumber
          ? _value.driverNumber
          : driverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
      vehicleBodyType: freezed == vehicleBodyType
          ? _value.vehicleBodyType
          : vehicleBodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleCapacity: freezed == vehicleCapacity
          ? _value.vehicleCapacity
          : vehicleCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      drivingLicenseNumber: freezed == drivingLicenseNumber
          ? _value.drivingLicenseNumber
          : drivingLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $DriverLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverDetailsImplCopyWith<$Res>
    implements $DriverDetailsCopyWith<$Res> {
  factory _$$DriverDetailsImplCopyWith(
          _$DriverDetailsImpl value, $Res Function(_$DriverDetailsImpl) then) =
      __$$DriverDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ownerNumber,
      String? driverNumber,
      String? ownerName,
      String? driverName,
      DriverLocation? location,
      String? vehicleBodyType,
      String? vehicleCapacity,
      String? vehicleNumber,
      String? drivingLicenseNumber});

  @override
  $DriverLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$DriverDetailsImplCopyWithImpl<$Res>
    extends _$DriverDetailsCopyWithImpl<$Res, _$DriverDetailsImpl>
    implements _$$DriverDetailsImplCopyWith<$Res> {
  __$$DriverDetailsImplCopyWithImpl(
      _$DriverDetailsImpl _value, $Res Function(_$DriverDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerNumber = freezed,
    Object? driverNumber = freezed,
    Object? ownerName = freezed,
    Object? driverName = freezed,
    Object? location = freezed,
    Object? vehicleBodyType = freezed,
    Object? vehicleCapacity = freezed,
    Object? vehicleNumber = freezed,
    Object? drivingLicenseNumber = freezed,
  }) {
    return _then(_$DriverDetailsImpl(
      ownerNumber: freezed == ownerNumber
          ? _value.ownerNumber
          : ownerNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverNumber: freezed == driverNumber
          ? _value.driverNumber
          : driverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
      vehicleBodyType: freezed == vehicleBodyType
          ? _value.vehicleBodyType
          : vehicleBodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleCapacity: freezed == vehicleCapacity
          ? _value.vehicleCapacity
          : vehicleCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      drivingLicenseNumber: freezed == drivingLicenseNumber
          ? _value.drivingLicenseNumber
          : drivingLicenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDetailsImpl implements _DriverDetails {
  const _$DriverDetailsImpl(
      {required this.ownerNumber,
      required this.driverNumber,
      required this.ownerName,
      required this.driverName,
      required this.location,
      required this.vehicleBodyType,
      required this.vehicleCapacity,
      required this.vehicleNumber,
      required this.drivingLicenseNumber});

  factory _$DriverDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDetailsImplFromJson(json);

  @override
  final String? ownerNumber;
  @override
  final String? driverNumber;
  @override
  final String? ownerName;
  @override
  final String? driverName;
  @override
  final DriverLocation? location;
  @override
  final String? vehicleBodyType;
  @override
  final String? vehicleCapacity;
  @override
  final String? vehicleNumber;
  @override
  final String? drivingLicenseNumber;

  @override
  String toString() {
    return 'DriverDetails(ownerNumber: $ownerNumber, driverNumber: $driverNumber, ownerName: $ownerName, driverName: $driverName, location: $location, vehicleBodyType: $vehicleBodyType, vehicleCapacity: $vehicleCapacity, vehicleNumber: $vehicleNumber, drivingLicenseNumber: $drivingLicenseNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDetailsImpl &&
            (identical(other.ownerNumber, ownerNumber) ||
                other.ownerNumber == ownerNumber) &&
            (identical(other.driverNumber, driverNumber) ||
                other.driverNumber == driverNumber) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.vehicleBodyType, vehicleBodyType) ||
                other.vehicleBodyType == vehicleBodyType) &&
            (identical(other.vehicleCapacity, vehicleCapacity) ||
                other.vehicleCapacity == vehicleCapacity) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.drivingLicenseNumber, drivingLicenseNumber) ||
                other.drivingLicenseNumber == drivingLicenseNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerNumber,
      driverNumber,
      ownerName,
      driverName,
      location,
      vehicleBodyType,
      vehicleCapacity,
      vehicleNumber,
      drivingLicenseNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      __$$DriverDetailsImplCopyWithImpl<_$DriverDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDetailsImplToJson(
      this,
    );
  }
}

abstract class _DriverDetails implements DriverDetails {
  const factory _DriverDetails(
      {required final String? ownerNumber,
      required final String? driverNumber,
      required final String? ownerName,
      required final String? driverName,
      required final DriverLocation? location,
      required final String? vehicleBodyType,
      required final String? vehicleCapacity,
      required final String? vehicleNumber,
      required final String? drivingLicenseNumber}) = _$DriverDetailsImpl;

  factory _DriverDetails.fromJson(Map<String, dynamic> json) =
      _$DriverDetailsImpl.fromJson;

  @override
  String? get ownerNumber;
  @override
  String? get driverNumber;
  @override
  String? get ownerName;
  @override
  String? get driverName;
  @override
  DriverLocation? get location;
  @override
  String? get vehicleBodyType;
  @override
  String? get vehicleCapacity;
  @override
  String? get vehicleNumber;
  @override
  String? get drivingLicenseNumber;
  @override
  @JsonKey(ignore: true)
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetProfileResponseData _$GetProfileResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetProfileResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetProfileResponseData {
  double get averageRating => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  DriverDetails? get driverDetails => throw _privateConstructorUsedError;
  List<ProfileReviewData> get reviews => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProfileResponseDataCopyWith<GetProfileResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProfileResponseDataCopyWith<$Res> {
  factory $GetProfileResponseDataCopyWith(GetProfileResponseData value,
          $Res Function(GetProfileResponseData) then) =
      _$GetProfileResponseDataCopyWithImpl<$Res, GetProfileResponseData>;
  @useResult
  $Res call(
      {double averageRating,
      int completedOrders,
      @JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String email,
      String dateOfBirth,
      String gender,
      String? phone,
      DriverDetails? driverDetails,
      List<ProfileReviewData> reviews,
      @DateTimeConvertor() DateTime createdAt});

  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class _$GetProfileResponseDataCopyWithImpl<$Res,
        $Val extends GetProfileResponseData>
    implements $GetProfileResponseDataCopyWith<$Res> {
  _$GetProfileResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = null,
    Object? completedOrders = null,
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? driverDetails = freezed,
    Object? reviews = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ProfileReviewData>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsCopyWith<$Res>? get driverDetails {
    if (_value.driverDetails == null) {
      return null;
    }

    return $DriverDetailsCopyWith<$Res>(_value.driverDetails!, (value) {
      return _then(_value.copyWith(driverDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetProfileResponseDataImplCopyWith<$Res>
    implements $GetProfileResponseDataCopyWith<$Res> {
  factory _$$GetProfileResponseDataImplCopyWith(
          _$GetProfileResponseDataImpl value,
          $Res Function(_$GetProfileResponseDataImpl) then) =
      __$$GetProfileResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double averageRating,
      int completedOrders,
      @JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String email,
      String dateOfBirth,
      String gender,
      String? phone,
      DriverDetails? driverDetails,
      List<ProfileReviewData> reviews,
      @DateTimeConvertor() DateTime createdAt});

  @override
  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class __$$GetProfileResponseDataImplCopyWithImpl<$Res>
    extends _$GetProfileResponseDataCopyWithImpl<$Res,
        _$GetProfileResponseDataImpl>
    implements _$$GetProfileResponseDataImplCopyWith<$Res> {
  __$$GetProfileResponseDataImplCopyWithImpl(
      _$GetProfileResponseDataImpl _value,
      $Res Function(_$GetProfileResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = null,
    Object? completedOrders = null,
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? driverDetails = freezed,
    Object? reviews = null,
    Object? createdAt = null,
  }) {
    return _then(_$GetProfileResponseDataImpl(
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ProfileReviewData>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProfileResponseDataImpl implements _GetProfileResponseData {
  const _$GetProfileResponseDataImpl(
      {required this.averageRating,
      required this.completedOrders,
      @JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.email,
      required this.dateOfBirth,
      required this.gender,
      required this.phone,
      required this.driverDetails,
      required final List<ProfileReviewData> reviews,
      @DateTimeConvertor() required this.createdAt})
      : _reviews = reviews;

  factory _$GetProfileResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProfileResponseDataImplFromJson(json);

  @override
  final double averageRating;
  @override
  final int completedOrders;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final String email;
  @override
  final String dateOfBirth;
  @override
  final String gender;
  @override
  final String? phone;
  @override
  final DriverDetails? driverDetails;
  final List<ProfileReviewData> _reviews;
  @override
  List<ProfileReviewData> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @DateTimeConvertor()
  final DateTime createdAt;

  @override
  String toString() {
    return 'GetProfileResponseData(averageRating: $averageRating, completedOrders: $completedOrders, id: $id, avatar: $avatar, name: $name, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, phone: $phone, driverDetails: $driverDetails, reviews: $reviews, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProfileResponseDataImpl &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.driverDetails, driverDetails) ||
                other.driverDetails == driverDetails) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageRating,
      completedOrders,
      id,
      avatar,
      name,
      email,
      dateOfBirth,
      gender,
      phone,
      driverDetails,
      const DeepCollectionEquality().hash(_reviews),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProfileResponseDataImplCopyWith<_$GetProfileResponseDataImpl>
      get copyWith => __$$GetProfileResponseDataImplCopyWithImpl<
          _$GetProfileResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProfileResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetProfileResponseData implements GetProfileResponseData {
  const factory _GetProfileResponseData(
          {required final double averageRating,
          required final int completedOrders,
          @JsonKey(name: '_id') required final String id,
          required final String avatar,
          required final String name,
          required final String email,
          required final String dateOfBirth,
          required final String gender,
          required final String? phone,
          required final DriverDetails? driverDetails,
          required final List<ProfileReviewData> reviews,
          @DateTimeConvertor() required final DateTime createdAt}) =
      _$GetProfileResponseDataImpl;

  factory _GetProfileResponseData.fromJson(Map<String, dynamic> json) =
      _$GetProfileResponseDataImpl.fromJson;

  @override
  double get averageRating;
  @override
  int get completedOrders;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  String get email;
  @override
  String get dateOfBirth;
  @override
  String get gender;
  @override
  String? get phone;
  @override
  DriverDetails? get driverDetails;
  @override
  List<ProfileReviewData> get reviews;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GetProfileResponseDataImplCopyWith<_$GetProfileResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProfileReviewData _$ProfileReviewDataFromJson(Map<String, dynamic> json) {
  return _ProfileReviewData.fromJson(json);
}

/// @nodoc
mixin _$ProfileReviewData {
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  ReviewCreatedBy get createdBy => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileReviewDataCopyWith<ProfileReviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileReviewDataCopyWith<$Res> {
  factory $ProfileReviewDataCopyWith(
          ProfileReviewData value, $Res Function(ProfileReviewData) then) =
      _$ProfileReviewDataCopyWithImpl<$Res, ProfileReviewData>;
  @useResult
  $Res call(
      {int rating,
      String comment,
      ReviewCreatedBy createdBy,
      @DateTimeConvertor() DateTime createdAt});

  $ReviewCreatedByCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$ProfileReviewDataCopyWithImpl<$Res, $Val extends ProfileReviewData>
    implements $ProfileReviewDataCopyWith<$Res> {
  _$ProfileReviewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ReviewCreatedBy,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewCreatedByCopyWith<$Res> get createdBy {
    return $ReviewCreatedByCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileReviewDataImplCopyWith<$Res>
    implements $ProfileReviewDataCopyWith<$Res> {
  factory _$$ProfileReviewDataImplCopyWith(_$ProfileReviewDataImpl value,
          $Res Function(_$ProfileReviewDataImpl) then) =
      __$$ProfileReviewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rating,
      String comment,
      ReviewCreatedBy createdBy,
      @DateTimeConvertor() DateTime createdAt});

  @override
  $ReviewCreatedByCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$ProfileReviewDataImplCopyWithImpl<$Res>
    extends _$ProfileReviewDataCopyWithImpl<$Res, _$ProfileReviewDataImpl>
    implements _$$ProfileReviewDataImplCopyWith<$Res> {
  __$$ProfileReviewDataImplCopyWithImpl(_$ProfileReviewDataImpl _value,
      $Res Function(_$ProfileReviewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_$ProfileReviewDataImpl(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ReviewCreatedBy,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileReviewDataImpl implements _ProfileReviewData {
  const _$ProfileReviewDataImpl(
      {required this.rating,
      required this.comment,
      required this.createdBy,
      @DateTimeConvertor() required this.createdAt});

  factory _$ProfileReviewDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileReviewDataImplFromJson(json);

  @override
  final int rating;
  @override
  final String comment;
  @override
  final ReviewCreatedBy createdBy;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ProfileReviewData(rating: $rating, comment: $comment, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileReviewDataImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating, comment, createdBy, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileReviewDataImplCopyWith<_$ProfileReviewDataImpl> get copyWith =>
      __$$ProfileReviewDataImplCopyWithImpl<_$ProfileReviewDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileReviewDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileReviewData implements ProfileReviewData {
  const factory _ProfileReviewData(
          {required final int rating,
          required final String comment,
          required final ReviewCreatedBy createdBy,
          @DateTimeConvertor() required final DateTime createdAt}) =
      _$ProfileReviewDataImpl;

  factory _ProfileReviewData.fromJson(Map<String, dynamic> json) =
      _$ProfileReviewDataImpl.fromJson;

  @override
  int get rating;
  @override
  String get comment;
  @override
  ReviewCreatedBy get createdBy;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ProfileReviewDataImplCopyWith<_$ProfileReviewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewCreatedBy _$ReviewCreatedByFromJson(Map<String, dynamic> json) {
  return _ReviewCreatedBy.fromJson(json);
}

/// @nodoc
mixin _$ReviewCreatedBy {
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCreatedByCopyWith<ReviewCreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCreatedByCopyWith<$Res> {
  factory $ReviewCreatedByCopyWith(
          ReviewCreatedBy value, $Res Function(ReviewCreatedBy) then) =
      _$ReviewCreatedByCopyWithImpl<$Res, ReviewCreatedBy>;
  @useResult
  $Res call({String name, String avatar});
}

/// @nodoc
class _$ReviewCreatedByCopyWithImpl<$Res, $Val extends ReviewCreatedBy>
    implements $ReviewCreatedByCopyWith<$Res> {
  _$ReviewCreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewCreatedByImplCopyWith<$Res>
    implements $ReviewCreatedByCopyWith<$Res> {
  factory _$$ReviewCreatedByImplCopyWith(_$ReviewCreatedByImpl value,
          $Res Function(_$ReviewCreatedByImpl) then) =
      __$$ReviewCreatedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String avatar});
}

/// @nodoc
class __$$ReviewCreatedByImplCopyWithImpl<$Res>
    extends _$ReviewCreatedByCopyWithImpl<$Res, _$ReviewCreatedByImpl>
    implements _$$ReviewCreatedByImplCopyWith<$Res> {
  __$$ReviewCreatedByImplCopyWithImpl(
      _$ReviewCreatedByImpl _value, $Res Function(_$ReviewCreatedByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$ReviewCreatedByImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCreatedByImpl implements _ReviewCreatedBy {
  const _$ReviewCreatedByImpl({required this.name, required this.avatar});

  factory _$ReviewCreatedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCreatedByImplFromJson(json);

  @override
  final String name;
  @override
  final String avatar;

  @override
  String toString() {
    return 'ReviewCreatedBy(name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCreatedByImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCreatedByImplCopyWith<_$ReviewCreatedByImpl> get copyWith =>
      __$$ReviewCreatedByImplCopyWithImpl<_$ReviewCreatedByImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCreatedByImplToJson(
      this,
    );
  }
}

abstract class _ReviewCreatedBy implements ReviewCreatedBy {
  const factory _ReviewCreatedBy(
      {required final String name,
      required final String avatar}) = _$ReviewCreatedByImpl;

  factory _ReviewCreatedBy.fromJson(Map<String, dynamic> json) =
      _$ReviewCreatedByImpl.fromJson;

  @override
  String get name;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$ReviewCreatedByImplCopyWith<_$ReviewCreatedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
