// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetOrdersResponse _$GetOrdersResponseFromJson(Map<String, dynamic> json) {
  return _GetOrdersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetOrdersResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetOrdersResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrdersResponseCopyWith<GetOrdersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrdersResponseCopyWith<$Res> {
  factory $GetOrdersResponseCopyWith(
          GetOrdersResponse value, $Res Function(GetOrdersResponse) then) =
      _$GetOrdersResponseCopyWithImpl<$Res, GetOrdersResponse>;
  @useResult
  $Res call({bool success, List<GetOrdersResponseData> data});
}

/// @nodoc
class _$GetOrdersResponseCopyWithImpl<$Res, $Val extends GetOrdersResponse>
    implements $GetOrdersResponseCopyWith<$Res> {
  _$GetOrdersResponseCopyWithImpl(this._value, this._then);

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
              as List<GetOrdersResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetOrdersResponseImplCopyWith<$Res>
    implements $GetOrdersResponseCopyWith<$Res> {
  factory _$$GetOrdersResponseImplCopyWith(_$GetOrdersResponseImpl value,
          $Res Function(_$GetOrdersResponseImpl) then) =
      __$$GetOrdersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetOrdersResponseData> data});
}

/// @nodoc
class __$$GetOrdersResponseImplCopyWithImpl<$Res>
    extends _$GetOrdersResponseCopyWithImpl<$Res, _$GetOrdersResponseImpl>
    implements _$$GetOrdersResponseImplCopyWith<$Res> {
  __$$GetOrdersResponseImplCopyWithImpl(_$GetOrdersResponseImpl _value,
      $Res Function(_$GetOrdersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetOrdersResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetOrdersResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrdersResponseImpl implements _GetOrdersResponse {
  const _$GetOrdersResponseImpl(
      {required this.success, required final List<GetOrdersResponseData> data})
      : _data = data;

  factory _$GetOrdersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrdersResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetOrdersResponseData> _data;
  @override
  List<GetOrdersResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetOrdersResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersResponseImplCopyWith<_$GetOrdersResponseImpl> get copyWith =>
      __$$GetOrdersResponseImplCopyWithImpl<_$GetOrdersResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrdersResponseImplToJson(
      this,
    );
  }
}

abstract class _GetOrdersResponse implements GetOrdersResponse {
  const factory _GetOrdersResponse(
          {required final bool success,
          required final List<GetOrdersResponseData> data}) =
      _$GetOrdersResponseImpl;

  factory _GetOrdersResponse.fromJson(Map<String, dynamic> json) =
      _$GetOrdersResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetOrdersResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetOrdersResponseImplCopyWith<_$GetOrdersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get address => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

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
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_$LocationImpl(
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
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.address, required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

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
    return 'Location(address: $address, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
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
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final String address,
      required final List<double> coordinates}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get address;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hub _$HubFromJson(Map<String, dynamic> json) {
  return _Hub.fromJson(json);
}

/// @nodoc
mixin _$Hub {
  String get address => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HubCopyWith<Hub> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HubCopyWith<$Res> {
  factory $HubCopyWith(Hub value, $Res Function(Hub) then) =
      _$HubCopyWithImpl<$Res, Hub>;
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class _$HubCopyWithImpl<$Res, $Val extends Hub> implements $HubCopyWith<$Res> {
  _$HubCopyWithImpl(this._value, this._then);

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
abstract class _$$HubImplCopyWith<$Res> implements $HubCopyWith<$Res> {
  factory _$$HubImplCopyWith(_$HubImpl value, $Res Function(_$HubImpl) then) =
      __$$HubImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, List<double> coordinates});
}

/// @nodoc
class __$$HubImplCopyWithImpl<$Res> extends _$HubCopyWithImpl<$Res, _$HubImpl>
    implements _$$HubImplCopyWith<$Res> {
  __$$HubImplCopyWithImpl(_$HubImpl _value, $Res Function(_$HubImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_$HubImpl(
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
class _$HubImpl implements _Hub {
  const _$HubImpl(
      {required this.address, required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$HubImpl.fromJson(Map<String, dynamic> json) =>
      _$$HubImplFromJson(json);

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
    return 'Hub(address: $address, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HubImpl &&
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
  _$$HubImplCopyWith<_$HubImpl> get copyWith =>
      __$$HubImplCopyWithImpl<_$HubImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HubImplToJson(
      this,
    );
  }
}

abstract class _Hub implements Hub {
  const factory _Hub(
      {required final String address,
      required final List<double> coordinates}) = _$HubImpl;

  factory _Hub.fromJson(Map<String, dynamic> json) = _$HubImpl.fromJson;

  @override
  String get address;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$HubImplCopyWith<_$HubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
  @useResult
  $Res call({String id, String name, String phone});
}

/// @nodoc
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedByImplCopyWith<$Res>
    implements $CreatedByCopyWith<$Res> {
  factory _$$CreatedByImplCopyWith(
          _$CreatedByImpl value, $Res Function(_$CreatedByImpl) then) =
      __$$CreatedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String phone});
}

/// @nodoc
class __$$CreatedByImplCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$CreatedByImpl>
    implements _$$CreatedByImplCopyWith<$Res> {
  __$$CreatedByImplCopyWithImpl(
      _$CreatedByImpl _value, $Res Function(_$CreatedByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$CreatedByImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedByImpl implements _CreatedBy {
  const _$CreatedByImpl(
      {required this.id, required this.name, required this.phone});

  factory _$CreatedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedByImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'CreatedBy(id: $id, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      __$$CreatedByImplCopyWithImpl<_$CreatedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedByImplToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
      {required final String id,
      required final String name,
      required final String phone}) = _$CreatedByImpl;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$CreatedByImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AcceptedBy _$AcceptedByFromJson(Map<String, dynamic> json) {
  return _AcceptedBy.fromJson(json);
}

/// @nodoc
mixin _$AcceptedBy {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptedByCopyWith<AcceptedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptedByCopyWith<$Res> {
  factory $AcceptedByCopyWith(
          AcceptedBy value, $Res Function(AcceptedBy) then) =
      _$AcceptedByCopyWithImpl<$Res, AcceptedBy>;
  @useResult
  $Res call({String id, String name, String avatar, String phone});
}

/// @nodoc
class _$AcceptedByCopyWithImpl<$Res, $Val extends AcceptedBy>
    implements $AcceptedByCopyWith<$Res> {
  _$AcceptedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AcceptedByImplCopyWith<$Res>
    implements $AcceptedByCopyWith<$Res> {
  factory _$$AcceptedByImplCopyWith(
          _$AcceptedByImpl value, $Res Function(_$AcceptedByImpl) then) =
      __$$AcceptedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String avatar, String phone});
}

/// @nodoc
class __$$AcceptedByImplCopyWithImpl<$Res>
    extends _$AcceptedByCopyWithImpl<$Res, _$AcceptedByImpl>
    implements _$$AcceptedByImplCopyWith<$Res> {
  __$$AcceptedByImplCopyWithImpl(
      _$AcceptedByImpl _value, $Res Function(_$AcceptedByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? phone = null,
  }) {
    return _then(_$AcceptedByImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AcceptedByImpl implements _AcceptedBy {
  const _$AcceptedByImpl(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.phone});

  factory _$AcceptedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptedByImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final String phone;

  @override
  String toString() {
    return 'AcceptedBy(id: $id, name: $name, avatar: $avatar, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptedByImplCopyWith<_$AcceptedByImpl> get copyWith =>
      __$$AcceptedByImplCopyWithImpl<_$AcceptedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptedByImplToJson(
      this,
    );
  }
}

abstract class _AcceptedBy implements AcceptedBy {
  const factory _AcceptedBy(
      {required final String id,
      required final String name,
      required final String avatar,
      required final String phone}) = _$AcceptedByImpl;

  factory _AcceptedBy.fromJson(Map<String, dynamic> json) =
      _$AcceptedByImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$AcceptedByImplCopyWith<_$AcceptedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationUpdate _$LocationUpdateFromJson(Map<String, dynamic> json) {
  return _LocationUpdate.fromJson(json);
}

/// @nodoc
mixin _$LocationUpdate {
  int get index => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationUpdateCopyWith<LocationUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUpdateCopyWith<$Res> {
  factory $LocationUpdateCopyWith(
          LocationUpdate value, $Res Function(LocationUpdate) then) =
      _$LocationUpdateCopyWithImpl<$Res, LocationUpdate>;
  @useResult
  $Res call({int index, String message});
}

/// @nodoc
class _$LocationUpdateCopyWithImpl<$Res, $Val extends LocationUpdate>
    implements $LocationUpdateCopyWith<$Res> {
  _$LocationUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationUpdateImplCopyWith<$Res>
    implements $LocationUpdateCopyWith<$Res> {
  factory _$$LocationUpdateImplCopyWith(_$LocationUpdateImpl value,
          $Res Function(_$LocationUpdateImpl) then) =
      __$$LocationUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String message});
}

/// @nodoc
class __$$LocationUpdateImplCopyWithImpl<$Res>
    extends _$LocationUpdateCopyWithImpl<$Res, _$LocationUpdateImpl>
    implements _$$LocationUpdateImplCopyWith<$Res> {
  __$$LocationUpdateImplCopyWithImpl(
      _$LocationUpdateImpl _value, $Res Function(_$LocationUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? message = null,
  }) {
    return _then(_$LocationUpdateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationUpdateImpl implements _LocationUpdate {
  const _$LocationUpdateImpl({required this.index, required this.message});

  factory _$LocationUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUpdateImplFromJson(json);

  @override
  final int index;
  @override
  final String message;

  @override
  String toString() {
    return 'LocationUpdate(index: $index, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateImplCopyWith<_$LocationUpdateImpl> get copyWith =>
      __$$LocationUpdateImplCopyWithImpl<_$LocationUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUpdateImplToJson(
      this,
    );
  }
}

abstract class _LocationUpdate implements LocationUpdate {
  const factory _LocationUpdate(
      {required final int index,
      required final String message}) = _$LocationUpdateImpl;

  factory _LocationUpdate.fromJson(Map<String, dynamic> json) =
      _$LocationUpdateImpl.fromJson;

  @override
  int get index;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LocationUpdateImplCopyWith<_$LocationUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetOrdersResponseData _$GetOrdersResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetOrdersResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetOrdersResponseData {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  Location get sourceLocation => throw _privateConstructorUsedError;
  Location get destinationLocation => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  AcceptedBy? get acceptedBy => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrdersResponseDataCopyWith<GetOrdersResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrdersResponseDataCopyWith<$Res> {
  factory $GetOrdersResponseDataCopyWith(GetOrdersResponseData value,
          $Res Function(GetOrdersResponseData) then) =
      _$GetOrdersResponseDataCopyWithImpl<$Res, GetOrdersResponseData>;
  @useResult
  $Res call(
      {String id,
      double price,
      double distance,
      Location sourceLocation,
      Location destinationLocation,
      String createdBy,
      AcceptedBy? acceptedBy,
      StatusType status,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  $LocationCopyWith<$Res> get sourceLocation;
  $LocationCopyWith<$Res> get destinationLocation;
  $AcceptedByCopyWith<$Res>? get acceptedBy;
}

/// @nodoc
class _$GetOrdersResponseDataCopyWithImpl<$Res,
        $Val extends GetOrdersResponseData>
    implements $GetOrdersResponseDataCopyWith<$Res> {
  _$GetOrdersResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? distance = null,
    Object? sourceLocation = null,
    Object? destinationLocation = null,
    Object? createdBy = null,
    Object? acceptedBy = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      sourceLocation: null == sourceLocation
          ? _value.sourceLocation
          : sourceLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as AcceptedBy?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get sourceLocation {
    return $LocationCopyWith<$Res>(_value.sourceLocation, (value) {
      return _then(_value.copyWith(sourceLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get destinationLocation {
    return $LocationCopyWith<$Res>(_value.destinationLocation, (value) {
      return _then(_value.copyWith(destinationLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AcceptedByCopyWith<$Res>? get acceptedBy {
    if (_value.acceptedBy == null) {
      return null;
    }

    return $AcceptedByCopyWith<$Res>(_value.acceptedBy!, (value) {
      return _then(_value.copyWith(acceptedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOrdersResponseDataImplCopyWith<$Res>
    implements $GetOrdersResponseDataCopyWith<$Res> {
  factory _$$GetOrdersResponseDataImplCopyWith(
          _$GetOrdersResponseDataImpl value,
          $Res Function(_$GetOrdersResponseDataImpl) then) =
      __$$GetOrdersResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double distance,
      Location sourceLocation,
      Location destinationLocation,
      String createdBy,
      AcceptedBy? acceptedBy,
      StatusType status,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  @override
  $LocationCopyWith<$Res> get sourceLocation;
  @override
  $LocationCopyWith<$Res> get destinationLocation;
  @override
  $AcceptedByCopyWith<$Res>? get acceptedBy;
}

/// @nodoc
class __$$GetOrdersResponseDataImplCopyWithImpl<$Res>
    extends _$GetOrdersResponseDataCopyWithImpl<$Res,
        _$GetOrdersResponseDataImpl>
    implements _$$GetOrdersResponseDataImplCopyWith<$Res> {
  __$$GetOrdersResponseDataImplCopyWithImpl(_$GetOrdersResponseDataImpl _value,
      $Res Function(_$GetOrdersResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? distance = null,
    Object? sourceLocation = null,
    Object? destinationLocation = null,
    Object? createdBy = null,
    Object? acceptedBy = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GetOrdersResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      sourceLocation: null == sourceLocation
          ? _value.sourceLocation
          : sourceLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as AcceptedBy?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrdersResponseDataImpl implements _GetOrdersResponseData {
  const _$GetOrdersResponseDataImpl(
      {required this.id,
      required this.price,
      required this.distance,
      required this.sourceLocation,
      required this.destinationLocation,
      required this.createdBy,
      required this.acceptedBy,
      required this.status,
      @DateTimeConvertor() required this.createdAt,
      @DateTimeConvertor() required this.updatedAt});

  factory _$GetOrdersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrdersResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final double price;
  @override
  final double distance;
  @override
  final Location sourceLocation;
  @override
  final Location destinationLocation;
  @override
  final String createdBy;
  @override
  final AcceptedBy? acceptedBy;
  @override
  final StatusType status;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;
  @override
  @DateTimeConvertor()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GetOrdersResponseData(id: $id, price: $price, distance: $distance, sourceLocation: $sourceLocation, destinationLocation: $destinationLocation, createdBy: $createdBy, acceptedBy: $acceptedBy, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.sourceLocation, sourceLocation) ||
                other.sourceLocation == sourceLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.acceptedBy, acceptedBy) ||
                other.acceptedBy == acceptedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      distance,
      sourceLocation,
      destinationLocation,
      createdBy,
      acceptedBy,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersResponseDataImplCopyWith<_$GetOrdersResponseDataImpl>
      get copyWith => __$$GetOrdersResponseDataImplCopyWithImpl<
          _$GetOrdersResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrdersResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetOrdersResponseData implements GetOrdersResponseData {
  const factory _GetOrdersResponseData(
          {required final String id,
          required final double price,
          required final double distance,
          required final Location sourceLocation,
          required final Location destinationLocation,
          required final String createdBy,
          required final AcceptedBy? acceptedBy,
          required final StatusType status,
          @DateTimeConvertor() required final DateTime createdAt,
          @DateTimeConvertor() required final DateTime updatedAt}) =
      _$GetOrdersResponseDataImpl;

  factory _GetOrdersResponseData.fromJson(Map<String, dynamic> json) =
      _$GetOrdersResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  double get distance;
  @override
  Location get sourceLocation;
  @override
  Location get destinationLocation;
  @override
  String get createdBy;
  @override
  AcceptedBy? get acceptedBy;
  @override
  StatusType get status;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @DateTimeConvertor()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$GetOrdersResponseDataImplCopyWith<_$GetOrdersResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetOrderResponse _$GetOrderResponseFromJson(Map<String, dynamic> json) {
  return _GetOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$GetOrderResponse {
  bool get success => throw _privateConstructorUsedError;
  GetOrderResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrderResponseCopyWith<GetOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrderResponseCopyWith<$Res> {
  factory $GetOrderResponseCopyWith(
          GetOrderResponse value, $Res Function(GetOrderResponse) then) =
      _$GetOrderResponseCopyWithImpl<$Res, GetOrderResponse>;
  @useResult
  $Res call({bool success, GetOrderResponseData data});

  $GetOrderResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetOrderResponseCopyWithImpl<$Res, $Val extends GetOrderResponse>
    implements $GetOrderResponseCopyWith<$Res> {
  _$GetOrderResponseCopyWithImpl(this._value, this._then);

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
              as GetOrderResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetOrderResponseDataCopyWith<$Res> get data {
    return $GetOrderResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOrderResponseImplCopyWith<$Res>
    implements $GetOrderResponseCopyWith<$Res> {
  factory _$$GetOrderResponseImplCopyWith(_$GetOrderResponseImpl value,
          $Res Function(_$GetOrderResponseImpl) then) =
      __$$GetOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetOrderResponseData data});

  @override
  $GetOrderResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetOrderResponseImplCopyWithImpl<$Res>
    extends _$GetOrderResponseCopyWithImpl<$Res, _$GetOrderResponseImpl>
    implements _$$GetOrderResponseImplCopyWith<$Res> {
  __$$GetOrderResponseImplCopyWithImpl(_$GetOrderResponseImpl _value,
      $Res Function(_$GetOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetOrderResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetOrderResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrderResponseImpl implements _GetOrderResponse {
  const _$GetOrderResponseImpl({required this.success, required this.data});

  factory _$GetOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetOrderResponseData data;

  @override
  String toString() {
    return 'GetOrderResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderResponseImplCopyWith<_$GetOrderResponseImpl> get copyWith =>
      __$$GetOrderResponseImplCopyWithImpl<_$GetOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _GetOrderResponse implements GetOrderResponse {
  const factory _GetOrderResponse(
      {required final bool success,
      required final GetOrderResponseData data}) = _$GetOrderResponseImpl;

  factory _GetOrderResponse.fromJson(Map<String, dynamic> json) =
      _$GetOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetOrderResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetOrderResponseImplCopyWith<_$GetOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetOrderResponseData _$GetOrderResponseDataFromJson(Map<String, dynamic> json) {
  return _GetOrderResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetOrderResponseData {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isPaymentDone => throw _privateConstructorUsedError;
  bool get isRatingDone => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get approxWeight => throw _privateConstructorUsedError;
  Location get sourceLocation => throw _privateConstructorUsedError;
  Location get destinationLocation => throw _privateConstructorUsedError;
  List<Hub> get hubs => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get typeOfGoods => throw _privateConstructorUsedError;
  String get deliveryNote => throw _privateConstructorUsedError;
  List<LocationUpdate> get locationUpdates =>
      throw _privateConstructorUsedError;
  CreatedBy get createdBy => throw _privateConstructorUsedError;
  AcceptedBy? get acceptedBy => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrderResponseDataCopyWith<GetOrderResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrderResponseDataCopyWith<$Res> {
  factory $GetOrderResponseDataCopyWith(GetOrderResponseData value,
          $Res Function(GetOrderResponseData) then) =
      _$GetOrderResponseDataCopyWithImpl<$Res, GetOrderResponseData>;
  @useResult
  $Res call(
      {String id,
      double price,
      bool isPaymentDone,
      bool isRatingDone,
      double distance,
      double approxWeight,
      Location sourceLocation,
      Location destinationLocation,
      List<Hub> hubs,
      String vehicleType,
      String typeOfGoods,
      String deliveryNote,
      List<LocationUpdate> locationUpdates,
      CreatedBy createdBy,
      AcceptedBy? acceptedBy,
      StatusType status,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  $LocationCopyWith<$Res> get sourceLocation;
  $LocationCopyWith<$Res> get destinationLocation;
  $CreatedByCopyWith<$Res> get createdBy;
  $AcceptedByCopyWith<$Res>? get acceptedBy;
}

/// @nodoc
class _$GetOrderResponseDataCopyWithImpl<$Res,
        $Val extends GetOrderResponseData>
    implements $GetOrderResponseDataCopyWith<$Res> {
  _$GetOrderResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isPaymentDone = null,
    Object? isRatingDone = null,
    Object? distance = null,
    Object? approxWeight = null,
    Object? sourceLocation = null,
    Object? destinationLocation = null,
    Object? hubs = null,
    Object? vehicleType = null,
    Object? typeOfGoods = null,
    Object? deliveryNote = null,
    Object? locationUpdates = null,
    Object? createdBy = null,
    Object? acceptedBy = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isPaymentDone: null == isPaymentDone
          ? _value.isPaymentDone
          : isPaymentDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatingDone: null == isRatingDone
          ? _value.isRatingDone
          : isRatingDone // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      approxWeight: null == approxWeight
          ? _value.approxWeight
          : approxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      sourceLocation: null == sourceLocation
          ? _value.sourceLocation
          : sourceLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      hubs: null == hubs
          ? _value.hubs
          : hubs // ignore: cast_nullable_to_non_nullable
              as List<Hub>,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfGoods: null == typeOfGoods
          ? _value.typeOfGoods
          : typeOfGoods // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNote: null == deliveryNote
          ? _value.deliveryNote
          : deliveryNote // ignore: cast_nullable_to_non_nullable
              as String,
      locationUpdates: null == locationUpdates
          ? _value.locationUpdates
          : locationUpdates // ignore: cast_nullable_to_non_nullable
              as List<LocationUpdate>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as AcceptedBy?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get sourceLocation {
    return $LocationCopyWith<$Res>(_value.sourceLocation, (value) {
      return _then(_value.copyWith(sourceLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get destinationLocation {
    return $LocationCopyWith<$Res>(_value.destinationLocation, (value) {
      return _then(_value.copyWith(destinationLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res> get createdBy {
    return $CreatedByCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AcceptedByCopyWith<$Res>? get acceptedBy {
    if (_value.acceptedBy == null) {
      return null;
    }

    return $AcceptedByCopyWith<$Res>(_value.acceptedBy!, (value) {
      return _then(_value.copyWith(acceptedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOrderResponseDataImplCopyWith<$Res>
    implements $GetOrderResponseDataCopyWith<$Res> {
  factory _$$GetOrderResponseDataImplCopyWith(_$GetOrderResponseDataImpl value,
          $Res Function(_$GetOrderResponseDataImpl) then) =
      __$$GetOrderResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      bool isPaymentDone,
      bool isRatingDone,
      double distance,
      double approxWeight,
      Location sourceLocation,
      Location destinationLocation,
      List<Hub> hubs,
      String vehicleType,
      String typeOfGoods,
      String deliveryNote,
      List<LocationUpdate> locationUpdates,
      CreatedBy createdBy,
      AcceptedBy? acceptedBy,
      StatusType status,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  @override
  $LocationCopyWith<$Res> get sourceLocation;
  @override
  $LocationCopyWith<$Res> get destinationLocation;
  @override
  $CreatedByCopyWith<$Res> get createdBy;
  @override
  $AcceptedByCopyWith<$Res>? get acceptedBy;
}

/// @nodoc
class __$$GetOrderResponseDataImplCopyWithImpl<$Res>
    extends _$GetOrderResponseDataCopyWithImpl<$Res, _$GetOrderResponseDataImpl>
    implements _$$GetOrderResponseDataImplCopyWith<$Res> {
  __$$GetOrderResponseDataImplCopyWithImpl(_$GetOrderResponseDataImpl _value,
      $Res Function(_$GetOrderResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isPaymentDone = null,
    Object? isRatingDone = null,
    Object? distance = null,
    Object? approxWeight = null,
    Object? sourceLocation = null,
    Object? destinationLocation = null,
    Object? hubs = null,
    Object? vehicleType = null,
    Object? typeOfGoods = null,
    Object? deliveryNote = null,
    Object? locationUpdates = null,
    Object? createdBy = null,
    Object? acceptedBy = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GetOrderResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isPaymentDone: null == isPaymentDone
          ? _value.isPaymentDone
          : isPaymentDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isRatingDone: null == isRatingDone
          ? _value.isRatingDone
          : isRatingDone // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      approxWeight: null == approxWeight
          ? _value.approxWeight
          : approxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      sourceLocation: null == sourceLocation
          ? _value.sourceLocation
          : sourceLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as Location,
      hubs: null == hubs
          ? _value._hubs
          : hubs // ignore: cast_nullable_to_non_nullable
              as List<Hub>,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfGoods: null == typeOfGoods
          ? _value.typeOfGoods
          : typeOfGoods // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNote: null == deliveryNote
          ? _value.deliveryNote
          : deliveryNote // ignore: cast_nullable_to_non_nullable
              as String,
      locationUpdates: null == locationUpdates
          ? _value._locationUpdates
          : locationUpdates // ignore: cast_nullable_to_non_nullable
              as List<LocationUpdate>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as AcceptedBy?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrderResponseDataImpl implements _GetOrderResponseData {
  const _$GetOrderResponseDataImpl(
      {required this.id,
      required this.price,
      required this.isPaymentDone,
      required this.isRatingDone,
      required this.distance,
      required this.approxWeight,
      required this.sourceLocation,
      required this.destinationLocation,
      required final List<Hub> hubs,
      required this.vehicleType,
      required this.typeOfGoods,
      required this.deliveryNote,
      required final List<LocationUpdate> locationUpdates,
      required this.createdBy,
      required this.acceptedBy,
      required this.status,
      @DateTimeConvertor() required this.createdAt,
      @DateTimeConvertor() required this.updatedAt})
      : _hubs = hubs,
        _locationUpdates = locationUpdates;

  factory _$GetOrderResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrderResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final double price;
  @override
  final bool isPaymentDone;
  @override
  final bool isRatingDone;
  @override
  final double distance;
  @override
  final double approxWeight;
  @override
  final Location sourceLocation;
  @override
  final Location destinationLocation;
  final List<Hub> _hubs;
  @override
  List<Hub> get hubs {
    if (_hubs is EqualUnmodifiableListView) return _hubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hubs);
  }

  @override
  final String vehicleType;
  @override
  final String typeOfGoods;
  @override
  final String deliveryNote;
  final List<LocationUpdate> _locationUpdates;
  @override
  List<LocationUpdate> get locationUpdates {
    if (_locationUpdates is EqualUnmodifiableListView) return _locationUpdates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationUpdates);
  }

  @override
  final CreatedBy createdBy;
  @override
  final AcceptedBy? acceptedBy;
  @override
  final StatusType status;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;
  @override
  @DateTimeConvertor()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GetOrderResponseData(id: $id, price: $price, isPaymentDone: $isPaymentDone, isRatingDone: $isRatingDone, distance: $distance, approxWeight: $approxWeight, sourceLocation: $sourceLocation, destinationLocation: $destinationLocation, hubs: $hubs, vehicleType: $vehicleType, typeOfGoods: $typeOfGoods, deliveryNote: $deliveryNote, locationUpdates: $locationUpdates, createdBy: $createdBy, acceptedBy: $acceptedBy, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isPaymentDone, isPaymentDone) ||
                other.isPaymentDone == isPaymentDone) &&
            (identical(other.isRatingDone, isRatingDone) ||
                other.isRatingDone == isRatingDone) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.approxWeight, approxWeight) ||
                other.approxWeight == approxWeight) &&
            (identical(other.sourceLocation, sourceLocation) ||
                other.sourceLocation == sourceLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            const DeepCollectionEquality().equals(other._hubs, _hubs) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.typeOfGoods, typeOfGoods) ||
                other.typeOfGoods == typeOfGoods) &&
            (identical(other.deliveryNote, deliveryNote) ||
                other.deliveryNote == deliveryNote) &&
            const DeepCollectionEquality()
                .equals(other._locationUpdates, _locationUpdates) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.acceptedBy, acceptedBy) ||
                other.acceptedBy == acceptedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      isPaymentDone,
      isRatingDone,
      distance,
      approxWeight,
      sourceLocation,
      destinationLocation,
      const DeepCollectionEquality().hash(_hubs),
      vehicleType,
      typeOfGoods,
      deliveryNote,
      const DeepCollectionEquality().hash(_locationUpdates),
      createdBy,
      acceptedBy,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderResponseDataImplCopyWith<_$GetOrderResponseDataImpl>
      get copyWith =>
          __$$GetOrderResponseDataImplCopyWithImpl<_$GetOrderResponseDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrderResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetOrderResponseData implements GetOrderResponseData {
  const factory _GetOrderResponseData(
          {required final String id,
          required final double price,
          required final bool isPaymentDone,
          required final bool isRatingDone,
          required final double distance,
          required final double approxWeight,
          required final Location sourceLocation,
          required final Location destinationLocation,
          required final List<Hub> hubs,
          required final String vehicleType,
          required final String typeOfGoods,
          required final String deliveryNote,
          required final List<LocationUpdate> locationUpdates,
          required final CreatedBy createdBy,
          required final AcceptedBy? acceptedBy,
          required final StatusType status,
          @DateTimeConvertor() required final DateTime createdAt,
          @DateTimeConvertor() required final DateTime updatedAt}) =
      _$GetOrderResponseDataImpl;

  factory _GetOrderResponseData.fromJson(Map<String, dynamic> json) =
      _$GetOrderResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  bool get isPaymentDone;
  @override
  bool get isRatingDone;
  @override
  double get distance;
  @override
  double get approxWeight;
  @override
  Location get sourceLocation;
  @override
  Location get destinationLocation;
  @override
  List<Hub> get hubs;
  @override
  String get vehicleType;
  @override
  String get typeOfGoods;
  @override
  String get deliveryNote;
  @override
  List<LocationUpdate> get locationUpdates;
  @override
  CreatedBy get createdBy;
  @override
  AcceptedBy? get acceptedBy;
  @override
  StatusType get status;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @DateTimeConvertor()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$GetOrderResponseDataImplCopyWith<_$GetOrderResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetOrderStatsResponse _$GetOrderStatsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetOrderStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetOrderStatsResponse {
  bool get success => throw _privateConstructorUsedError;
  GetOrderStatsResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrderStatsResponseCopyWith<GetOrderStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrderStatsResponseCopyWith<$Res> {
  factory $GetOrderStatsResponseCopyWith(GetOrderStatsResponse value,
          $Res Function(GetOrderStatsResponse) then) =
      _$GetOrderStatsResponseCopyWithImpl<$Res, GetOrderStatsResponse>;
  @useResult
  $Res call({bool success, GetOrderStatsResponseData data});

  $GetOrderStatsResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetOrderStatsResponseCopyWithImpl<$Res,
        $Val extends GetOrderStatsResponse>
    implements $GetOrderStatsResponseCopyWith<$Res> {
  _$GetOrderStatsResponseCopyWithImpl(this._value, this._then);

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
              as GetOrderStatsResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetOrderStatsResponseDataCopyWith<$Res> get data {
    return $GetOrderStatsResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOrderStatsResponseImplCopyWith<$Res>
    implements $GetOrderStatsResponseCopyWith<$Res> {
  factory _$$GetOrderStatsResponseImplCopyWith(
          _$GetOrderStatsResponseImpl value,
          $Res Function(_$GetOrderStatsResponseImpl) then) =
      __$$GetOrderStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetOrderStatsResponseData data});

  @override
  $GetOrderStatsResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetOrderStatsResponseImplCopyWithImpl<$Res>
    extends _$GetOrderStatsResponseCopyWithImpl<$Res,
        _$GetOrderStatsResponseImpl>
    implements _$$GetOrderStatsResponseImplCopyWith<$Res> {
  __$$GetOrderStatsResponseImplCopyWithImpl(_$GetOrderStatsResponseImpl _value,
      $Res Function(_$GetOrderStatsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetOrderStatsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetOrderStatsResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrderStatsResponseImpl implements _GetOrderStatsResponse {
  const _$GetOrderStatsResponseImpl(
      {required this.success, required this.data});

  factory _$GetOrderStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrderStatsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetOrderStatsResponseData data;

  @override
  String toString() {
    return 'GetOrderStatsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderStatsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderStatsResponseImplCopyWith<_$GetOrderStatsResponseImpl>
      get copyWith => __$$GetOrderStatsResponseImplCopyWithImpl<
          _$GetOrderStatsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrderStatsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetOrderStatsResponse implements GetOrderStatsResponse {
  const factory _GetOrderStatsResponse(
          {required final bool success,
          required final GetOrderStatsResponseData data}) =
      _$GetOrderStatsResponseImpl;

  factory _GetOrderStatsResponse.fromJson(Map<String, dynamic> json) =
      _$GetOrderStatsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetOrderStatsResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetOrderStatsResponseImplCopyWith<_$GetOrderStatsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetOrderStatsResponseData _$GetOrderStatsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetOrderStatsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetOrderStatsResponseData {
  double get averageRating => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  double get totalEarned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrderStatsResponseDataCopyWith<GetOrderStatsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrderStatsResponseDataCopyWith<$Res> {
  factory $GetOrderStatsResponseDataCopyWith(GetOrderStatsResponseData value,
          $Res Function(GetOrderStatsResponseData) then) =
      _$GetOrderStatsResponseDataCopyWithImpl<$Res, GetOrderStatsResponseData>;
  @useResult
  $Res call({double averageRating, int completedOrders, double totalEarned});
}

/// @nodoc
class _$GetOrderStatsResponseDataCopyWithImpl<$Res,
        $Val extends GetOrderStatsResponseData>
    implements $GetOrderStatsResponseDataCopyWith<$Res> {
  _$GetOrderStatsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = null,
    Object? completedOrders = null,
    Object? totalEarned = null,
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
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetOrderStatsResponseDataImplCopyWith<$Res>
    implements $GetOrderStatsResponseDataCopyWith<$Res> {
  factory _$$GetOrderStatsResponseDataImplCopyWith(
          _$GetOrderStatsResponseDataImpl value,
          $Res Function(_$GetOrderStatsResponseDataImpl) then) =
      __$$GetOrderStatsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double averageRating, int completedOrders, double totalEarned});
}

/// @nodoc
class __$$GetOrderStatsResponseDataImplCopyWithImpl<$Res>
    extends _$GetOrderStatsResponseDataCopyWithImpl<$Res,
        _$GetOrderStatsResponseDataImpl>
    implements _$$GetOrderStatsResponseDataImplCopyWith<$Res> {
  __$$GetOrderStatsResponseDataImplCopyWithImpl(
      _$GetOrderStatsResponseDataImpl _value,
      $Res Function(_$GetOrderStatsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = null,
    Object? completedOrders = null,
    Object? totalEarned = null,
  }) {
    return _then(_$GetOrderStatsResponseDataImpl(
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOrderStatsResponseDataImpl implements _GetOrderStatsResponseData {
  const _$GetOrderStatsResponseDataImpl(
      {required this.averageRating,
      required this.completedOrders,
      required this.totalEarned});

  factory _$GetOrderStatsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrderStatsResponseDataImplFromJson(json);

  @override
  final double averageRating;
  @override
  final int completedOrders;
  @override
  final double totalEarned;

  @override
  String toString() {
    return 'GetOrderStatsResponseData(averageRating: $averageRating, completedOrders: $completedOrders, totalEarned: $totalEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderStatsResponseDataImpl &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, averageRating, completedOrders, totalEarned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderStatsResponseDataImplCopyWith<_$GetOrderStatsResponseDataImpl>
      get copyWith => __$$GetOrderStatsResponseDataImplCopyWithImpl<
          _$GetOrderStatsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOrderStatsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetOrderStatsResponseData implements GetOrderStatsResponseData {
  const factory _GetOrderStatsResponseData(
      {required final double averageRating,
      required final int completedOrders,
      required final double totalEarned}) = _$GetOrderStatsResponseDataImpl;

  factory _GetOrderStatsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetOrderStatsResponseDataImpl.fromJson;

  @override
  double get averageRating;
  @override
  int get completedOrders;
  @override
  double get totalEarned;
  @override
  @JsonKey(ignore: true)
  _$$GetOrderStatsResponseDataImplCopyWith<_$GetOrderStatsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
