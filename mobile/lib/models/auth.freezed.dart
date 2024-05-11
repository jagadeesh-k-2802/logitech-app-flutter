// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  bool get success => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
  @useResult
  $Res call({bool success, String token});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenResponseImplCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$$TokenResponseImplCopyWith(
          _$TokenResponseImpl value, $Res Function(_$TokenResponseImpl) then) =
      __$$TokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String token});
}

/// @nodoc
class __$$TokenResponseImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$TokenResponseImpl>
    implements _$$TokenResponseImplCopyWith<$Res> {
  __$$TokenResponseImplCopyWithImpl(
      _$TokenResponseImpl _value, $Res Function(_$TokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? token = null,
  }) {
    return _then(_$TokenResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenResponseImpl implements _TokenResponse {
  const _$TokenResponseImpl({required this.success, required this.token});

  factory _$TokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String token;

  @override
  String toString() {
    return 'TokenResponse(success: $success, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      __$$TokenResponseImplCopyWithImpl<_$TokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenResponse implements TokenResponse {
  const factory _TokenResponse(
      {required final bool success,
      required final String token}) = _$TokenResponseImpl;

  factory _TokenResponse.fromJson(Map<String, dynamic> json) =
      _$TokenResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  bool get success => throw _privateConstructorUsedError;
  UserResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call({bool success, UserResponseData data});

  $UserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

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
              as UserResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseDataCopyWith<$Res> get data {
    return $UserResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
          _$UserResponseImpl value, $Res Function(_$UserResponseImpl) then) =
      __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, UserResponseData data});

  @override
  $UserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
      _$UserResponseImpl _value, $Res Function(_$UserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$UserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl({required this.success, required this.data});

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final UserResponseData data;

  @override
  String toString() {
    return 'UserResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {required final bool success,
      required final UserResponseData data}) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  UserResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
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
  String? get upiId => throw _privateConstructorUsedError;
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
      String? upiId,
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
    Object? upiId = freezed,
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
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
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
      String? upiId,
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
    Object? upiId = freezed,
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
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
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
      required this.upiId,
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
  final String? upiId;
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
    return 'DriverDetails(ownerNumber: $ownerNumber, driverNumber: $driverNumber, ownerName: $ownerName, driverName: $driverName, upiId: $upiId, location: $location, vehicleBodyType: $vehicleBodyType, vehicleCapacity: $vehicleCapacity, vehicleNumber: $vehicleNumber, drivingLicenseNumber: $drivingLicenseNumber)';
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
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
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
      upiId,
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
      required final String? upiId,
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
  String? get upiId;
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

UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) {
  return _UserResponseData.fromJson(json);
}

/// @nodoc
mixin _$UserResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserType get type => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  DriverDetails? get driverDetails => throw _privateConstructorUsedError;
  int get unReadNotificationsCount => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseDataCopyWith<UserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDataCopyWith<$Res> {
  factory $UserResponseDataCopyWith(
          UserResponseData value, $Res Function(UserResponseData) then) =
      _$UserResponseDataCopyWithImpl<$Res, UserResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      UserType type,
      String email,
      String dateOfBirth,
      String gender,
      String? phone,
      DriverDetails? driverDetails,
      int unReadNotificationsCount,
      String? fcmToken,
      @DateTimeConvertor() String createdAt});

  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class _$UserResponseDataCopyWithImpl<$Res, $Val extends UserResponseData>
    implements $UserResponseDataCopyWith<$Res> {
  _$UserResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? type = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? driverDetails = freezed,
    Object? unReadNotificationsCount = null,
    Object? fcmToken = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType,
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
      unReadNotificationsCount: null == unReadNotificationsCount
          ? _value.unReadNotificationsCount
          : unReadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$UserResponseDataImplCopyWith<$Res>
    implements $UserResponseDataCopyWith<$Res> {
  factory _$$UserResponseDataImplCopyWith(_$UserResponseDataImpl value,
          $Res Function(_$UserResponseDataImpl) then) =
      __$$UserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      UserType type,
      String email,
      String dateOfBirth,
      String gender,
      String? phone,
      DriverDetails? driverDetails,
      int unReadNotificationsCount,
      String? fcmToken,
      @DateTimeConvertor() String createdAt});

  @override
  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class __$$UserResponseDataImplCopyWithImpl<$Res>
    extends _$UserResponseDataCopyWithImpl<$Res, _$UserResponseDataImpl>
    implements _$$UserResponseDataImplCopyWith<$Res> {
  __$$UserResponseDataImplCopyWithImpl(_$UserResponseDataImpl _value,
      $Res Function(_$UserResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? type = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? driverDetails = freezed,
    Object? unReadNotificationsCount = null,
    Object? fcmToken = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UserResponseDataImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType,
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
      unReadNotificationsCount: null == unReadNotificationsCount
          ? _value.unReadNotificationsCount
          : unReadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDataImpl implements _UserResponseData {
  const _$UserResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.type,
      required this.email,
      required this.dateOfBirth,
      required this.gender,
      required this.phone,
      required this.driverDetails,
      required this.unReadNotificationsCount,
      required this.fcmToken,
      @DateTimeConvertor() required this.createdAt});

  factory _$UserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final UserType type;
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
  @override
  final int unReadNotificationsCount;
  @override
  final String? fcmToken;
  @override
  @DateTimeConvertor()
  final String createdAt;

  @override
  String toString() {
    return 'UserResponseData(id: $id, avatar: $avatar, name: $name, type: $type, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, phone: $phone, driverDetails: $driverDetails, unReadNotificationsCount: $unReadNotificationsCount, fcmToken: $fcmToken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.driverDetails, driverDetails) ||
                other.driverDetails == driverDetails) &&
            (identical(
                    other.unReadNotificationsCount, unReadNotificationsCount) ||
                other.unReadNotificationsCount == unReadNotificationsCount) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avatar,
      name,
      type,
      email,
      dateOfBirth,
      gender,
      phone,
      driverDetails,
      unReadNotificationsCount,
      fcmToken,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      __$$UserResponseDataImplCopyWithImpl<_$UserResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDataImplToJson(
      this,
    );
  }
}

abstract class _UserResponseData implements UserResponseData {
  const factory _UserResponseData(
          {@JsonKey(name: '_id') required final String id,
          required final String avatar,
          required final String name,
          required final UserType type,
          required final String email,
          required final String dateOfBirth,
          required final String gender,
          required final String? phone,
          required final DriverDetails? driverDetails,
          required final int unReadNotificationsCount,
          required final String? fcmToken,
          @DateTimeConvertor() required final String createdAt}) =
      _$UserResponseDataImpl;

  factory _UserResponseData.fromJson(Map<String, dynamic> json) =
      _$UserResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  UserType get type;
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
  int get unReadNotificationsCount;
  @override
  String? get fcmToken;
  @override
  @DateTimeConvertor()
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
