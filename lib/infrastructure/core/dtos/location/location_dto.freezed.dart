// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  return _LocationDto.fromJson(json);
}

/// @nodoc
mixin _$LocationDto {
  @JsonKey(name: 'latitude', defaultValue: 0.0)
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude', defaultValue: 0.0)
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'area', defaultValue: '')
  String get area => throw _privateConstructorUsedError;
  @JsonKey(name: 'city', defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state', defaultValue: '')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'country', defaultValue: '')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDtoCopyWith<LocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDtoCopyWith<$Res> {
  factory $LocationDtoCopyWith(
          LocationDto value, $Res Function(LocationDto) then) =
      _$LocationDtoCopyWithImpl<$Res, LocationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'latitude', defaultValue: 0.0) double latitude,
      @JsonKey(name: 'longitude', defaultValue: 0.0) double longitude,
      @JsonKey(name: 'area', defaultValue: '') String area,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'state', defaultValue: '') String state,
      @JsonKey(name: 'country', defaultValue: '') String country,
      @JsonKey(name: 'icon', defaultValue: '') String icon});
}

/// @nodoc
class _$LocationDtoCopyWithImpl<$Res, $Val extends LocationDto>
    implements $LocationDtoCopyWith<$Res> {
  _$LocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? area = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDtoImplCopyWith<$Res>
    implements $LocationDtoCopyWith<$Res> {
  factory _$$LocationDtoImplCopyWith(
          _$LocationDtoImpl value, $Res Function(_$LocationDtoImpl) then) =
      __$$LocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'latitude', defaultValue: 0.0) double latitude,
      @JsonKey(name: 'longitude', defaultValue: 0.0) double longitude,
      @JsonKey(name: 'area', defaultValue: '') String area,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'state', defaultValue: '') String state,
      @JsonKey(name: 'country', defaultValue: '') String country,
      @JsonKey(name: 'icon', defaultValue: '') String icon});
}

/// @nodoc
class __$$LocationDtoImplCopyWithImpl<$Res>
    extends _$LocationDtoCopyWithImpl<$Res, _$LocationDtoImpl>
    implements _$$LocationDtoImplCopyWith<$Res> {
  __$$LocationDtoImplCopyWithImpl(
      _$LocationDtoImpl _value, $Res Function(_$LocationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? area = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? icon = null,
  }) {
    return _then(_$LocationDtoImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDtoImpl implements _LocationDto {
  const _$LocationDtoImpl(
      {@JsonKey(name: 'latitude', defaultValue: 0.0) required this.latitude,
      @JsonKey(name: 'longitude', defaultValue: 0.0) required this.longitude,
      @JsonKey(name: 'area', defaultValue: '') required this.area,
      @JsonKey(name: 'city', defaultValue: '') required this.city,
      @JsonKey(name: 'state', defaultValue: '') required this.state,
      @JsonKey(name: 'country', defaultValue: '') required this.country,
      @JsonKey(name: 'icon', defaultValue: '') required this.icon});

  factory _$LocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'latitude', defaultValue: 0.0)
  final double latitude;
  @override
  @JsonKey(name: 'longitude', defaultValue: 0.0)
  final double longitude;
  @override
  @JsonKey(name: 'area', defaultValue: '')
  final String area;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  final String city;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  final String state;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  final String country;
  @override
  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;

  @override
  String toString() {
    return 'LocationDto(latitude: $latitude, longitude: $longitude, area: $area, city: $city, state: $state, country: $country, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDtoImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longitude, area, city, state, country, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      __$$LocationDtoImplCopyWithImpl<_$LocationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDtoImplToJson(
      this,
    );
  }
}

abstract class _LocationDto implements LocationDto {
  const factory _LocationDto(
      {@JsonKey(name: 'latitude', defaultValue: 0.0)
      required final double latitude,
      @JsonKey(name: 'longitude', defaultValue: 0.0)
      required final double longitude,
      @JsonKey(name: 'area', defaultValue: '') required final String area,
      @JsonKey(name: 'city', defaultValue: '') required final String city,
      @JsonKey(name: 'state', defaultValue: '') required final String state,
      @JsonKey(name: 'country', defaultValue: '') required final String country,
      @JsonKey(name: 'icon', defaultValue: '')
      required final String icon}) = _$LocationDtoImpl;

  factory _LocationDto.fromJson(Map<String, dynamic> json) =
      _$LocationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'latitude', defaultValue: 0.0)
  double get latitude;
  @override
  @JsonKey(name: 'longitude', defaultValue: 0.0)
  double get longitude;
  @override
  @JsonKey(name: 'area', defaultValue: '')
  String get area;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  String get city;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  String get state;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  String get country;
  @override
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
