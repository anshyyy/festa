// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PubLocationDto _$PubLocationDtoFromJson(Map<String, dynamic> json) {
  return _PubLocationDto.fromJson(json);
}

/// @nodoc
mixin _$PubLocationDto {
  @JsonKey(name: 'lat', defaultValue: 0.0)
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lng', defaultValue: 0.0)
  double get lng => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinCode', defaultValue: '')
  String get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'city', defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'vicinity', defaultValue: '')
  String get vicinity => throw _privateConstructorUsedError;
  @JsonKey(name: 'state', defaultValue: '')
  String get state => throw _privateConstructorUsedError;

  /// Serializes this PubLocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PubLocationDtoCopyWith<PubLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubLocationDtoCopyWith<$Res> {
  factory $PubLocationDtoCopyWith(
          PubLocationDto value, $Res Function(PubLocationDto) then) =
      _$PubLocationDtoCopyWithImpl<$Res, PubLocationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lat', defaultValue: 0.0) double lat,
      @JsonKey(name: 'lng', defaultValue: 0.0) double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') String pinCode,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'state', defaultValue: '') String state});
}

/// @nodoc
class _$PubLocationDtoCopyWithImpl<$Res, $Val extends PubLocationDto>
    implements $PubLocationDtoCopyWith<$Res> {
  _$PubLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PubLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? pinCode = null,
    Object? city = null,
    Object? vicinity = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubLocationDtoImplCopyWith<$Res>
    implements $PubLocationDtoCopyWith<$Res> {
  factory _$$PubLocationDtoImplCopyWith(_$PubLocationDtoImpl value,
          $Res Function(_$PubLocationDtoImpl) then) =
      __$$PubLocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lat', defaultValue: 0.0) double lat,
      @JsonKey(name: 'lng', defaultValue: 0.0) double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') String pinCode,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'state', defaultValue: '') String state});
}

/// @nodoc
class __$$PubLocationDtoImplCopyWithImpl<$Res>
    extends _$PubLocationDtoCopyWithImpl<$Res, _$PubLocationDtoImpl>
    implements _$$PubLocationDtoImplCopyWith<$Res> {
  __$$PubLocationDtoImplCopyWithImpl(
      _$PubLocationDtoImpl _value, $Res Function(_$PubLocationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PubLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? pinCode = null,
    Object? city = null,
    Object? vicinity = null,
    Object? state = null,
  }) {
    return _then(_$PubLocationDtoImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubLocationDtoImpl implements _PubLocationDto {
  const _$PubLocationDtoImpl(
      {@JsonKey(name: 'lat', defaultValue: 0.0) required this.lat,
      @JsonKey(name: 'lng', defaultValue: 0.0) required this.lng,
      @JsonKey(name: 'pinCode', defaultValue: '') required this.pinCode,
      @JsonKey(name: 'city', defaultValue: '') required this.city,
      @JsonKey(name: 'vicinity', defaultValue: '') required this.vicinity,
      @JsonKey(name: 'state', defaultValue: '') required this.state});

  factory _$PubLocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubLocationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'lat', defaultValue: 0.0)
  final double lat;
  @override
  @JsonKey(name: 'lng', defaultValue: 0.0)
  final double lng;
  @override
  @JsonKey(name: 'pinCode', defaultValue: '')
  final String pinCode;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  final String city;
  @override
  @JsonKey(name: 'vicinity', defaultValue: '')
  final String vicinity;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  final String state;

  @override
  String toString() {
    return 'PubLocationDto(lat: $lat, lng: $lng, pinCode: $pinCode, city: $city, vicinity: $vicinity, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubLocationDtoImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, pinCode, city, vicinity, state);

  /// Create a copy of PubLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PubLocationDtoImplCopyWith<_$PubLocationDtoImpl> get copyWith =>
      __$$PubLocationDtoImplCopyWithImpl<_$PubLocationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubLocationDtoImplToJson(
      this,
    );
  }
}

abstract class _PubLocationDto implements PubLocationDto {
  const factory _PubLocationDto(
      {@JsonKey(name: 'lat', defaultValue: 0.0) required final double lat,
      @JsonKey(name: 'lng', defaultValue: 0.0) required final double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') required final String pinCode,
      @JsonKey(name: 'city', defaultValue: '') required final String city,
      @JsonKey(name: 'vicinity', defaultValue: '')
      required final String vicinity,
      @JsonKey(name: 'state', defaultValue: '')
      required final String state}) = _$PubLocationDtoImpl;

  factory _PubLocationDto.fromJson(Map<String, dynamic> json) =
      _$PubLocationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'lat', defaultValue: 0.0)
  double get lat;
  @override
  @JsonKey(name: 'lng', defaultValue: 0.0)
  double get lng;
  @override
  @JsonKey(name: 'pinCode', defaultValue: '')
  String get pinCode;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  String get city;
  @override
  @JsonKey(name: 'vicinity', defaultValue: '')
  String get vicinity;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  String get state;

  /// Create a copy of PubLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubLocationDtoImplCopyWith<_$PubLocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
