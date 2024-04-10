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
  String get type => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<int> get coordinates => throw _privateConstructorUsedError;

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
  $Res call({String type, String address, List<int> coordinates});
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
    Object? type = null,
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
  $Res call({String type, String address, List<int> coordinates});
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
    Object? type = null,
    Object? address = null,
    Object? coordinates = null,
  }) {
    return _then(_$LocationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.type,
      required this.address,
      required final List<int> coordinates})
      : _coordinates = coordinates;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String type;
  @override
  final String address;
  final List<int> _coordinates;
  @override
  List<int> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'Location(type: $type, address: $address, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, address,
      const DeepCollectionEquality().hash(_coordinates));

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
      {required final String type,
      required final String address,
      required final List<int> coordinates}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get type;
  @override
  String get address;
  @override
  List<int> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetOrdersResponseData _$GetOrdersResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetOrdersResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetOrdersResponseData {
  String get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  Location get sourceLocation => throw _privateConstructorUsedError;
  Location get destinationLocation => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get acceptedBy => throw _privateConstructorUsedError;
  StatusType get type => throw _privateConstructorUsedError;
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
      int price,
      int distance,
      Location sourceLocation,
      Location destinationLocation,
      String createdBy,
      String acceptedBy,
      StatusType type,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  $LocationCopyWith<$Res> get sourceLocation;
  $LocationCopyWith<$Res> get destinationLocation;
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
    Object? acceptedBy = null,
    Object? type = null,
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
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
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
      acceptedBy: null == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
      int price,
      int distance,
      Location sourceLocation,
      Location destinationLocation,
      String createdBy,
      String acceptedBy,
      StatusType type,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  @override
  $LocationCopyWith<$Res> get sourceLocation;
  @override
  $LocationCopyWith<$Res> get destinationLocation;
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
    Object? acceptedBy = null,
    Object? type = null,
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
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
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
      acceptedBy: null == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
      required this.type,
      @DateTimeConvertor() required this.createdAt,
      @DateTimeConvertor() required this.updatedAt});

  factory _$GetOrdersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOrdersResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final int price;
  @override
  final int distance;
  @override
  final Location sourceLocation;
  @override
  final Location destinationLocation;
  @override
  final String createdBy;
  @override
  final String acceptedBy;
  @override
  final StatusType type;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;
  @override
  @DateTimeConvertor()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GetOrdersResponseData(id: $id, price: $price, distance: $distance, sourceLocation: $sourceLocation, destinationLocation: $destinationLocation, createdBy: $createdBy, acceptedBy: $acceptedBy, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.type, type) || other.type == type) &&
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
      type,
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
          required final int price,
          required final int distance,
          required final Location sourceLocation,
          required final Location destinationLocation,
          required final String createdBy,
          required final String acceptedBy,
          required final StatusType type,
          @DateTimeConvertor() required final DateTime createdAt,
          @DateTimeConvertor() required final DateTime updatedAt}) =
      _$GetOrdersResponseDataImpl;

  factory _GetOrdersResponseData.fromJson(Map<String, dynamic> json) =
      _$GetOrdersResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  int get price;
  @override
  int get distance;
  @override
  Location get sourceLocation;
  @override
  Location get destinationLocation;
  @override
  String get createdBy;
  @override
  String get acceptedBy;
  @override
  StatusType get type;
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
