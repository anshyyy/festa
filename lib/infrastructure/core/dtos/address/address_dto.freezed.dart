// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) {
  return _AddressDto.fromJson(json);
}

/// @nodoc
mixin _$AddressDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat', defaultValue: 0)
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lng', defaultValue: 0)
  double get lng => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinCode', defaultValue: '')
  String get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'city', defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'vicinity', defaultValue: '')
  String get vicinity => throw _privateConstructorUsedError;
  @JsonKey(name: 'completeAddress', defaultValue: '')
  String get completeAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'state', defaultValue: '')
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDtoCopyWith<AddressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDtoCopyWith<$Res> {
  factory $AddressDtoCopyWith(
          AddressDto value, $Res Function(AddressDto) then) =
      _$AddressDtoCopyWithImpl<$Res, AddressDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'lat', defaultValue: 0) double lat,
      @JsonKey(name: 'lng', defaultValue: 0) double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') String pinCode,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'completeAddress', defaultValue: '')
      String completeAddress,
      @JsonKey(name: 'state', defaultValue: '') String state});
}

/// @nodoc
class _$AddressDtoCopyWithImpl<$Res, $Val extends AddressDto>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? pinCode = null,
    Object? city = null,
    Object? vicinity = null,
    Object? completeAddress = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      completeAddress: null == completeAddress
          ? _value.completeAddress
          : completeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDtoImplCopyWith<$Res>
    implements $AddressDtoCopyWith<$Res> {
  factory _$$AddressDtoImplCopyWith(
          _$AddressDtoImpl value, $Res Function(_$AddressDtoImpl) then) =
      __$$AddressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'lat', defaultValue: 0) double lat,
      @JsonKey(name: 'lng', defaultValue: 0) double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') String pinCode,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'completeAddress', defaultValue: '')
      String completeAddress,
      @JsonKey(name: 'state', defaultValue: '') String state});
}

/// @nodoc
class __$$AddressDtoImplCopyWithImpl<$Res>
    extends _$AddressDtoCopyWithImpl<$Res, _$AddressDtoImpl>
    implements _$$AddressDtoImplCopyWith<$Res> {
  __$$AddressDtoImplCopyWithImpl(
      _$AddressDtoImpl _value, $Res Function(_$AddressDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? pinCode = null,
    Object? city = null,
    Object? vicinity = null,
    Object? completeAddress = null,
    Object? state = null,
  }) {
    return _then(_$AddressDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      completeAddress: null == completeAddress
          ? _value.completeAddress
          : completeAddress // ignore: cast_nullable_to_non_nullable
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
class _$AddressDtoImpl implements _AddressDto {
  const _$AddressDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'lat', defaultValue: 0) required this.lat,
      @JsonKey(name: 'lng', defaultValue: 0) required this.lng,
      @JsonKey(name: 'pinCode', defaultValue: '') required this.pinCode,
      @JsonKey(name: 'city', defaultValue: '') required this.city,
      @JsonKey(name: 'vicinity', defaultValue: '') required this.vicinity,
      @JsonKey(name: 'completeAddress', defaultValue: '')
      required this.completeAddress,
      @JsonKey(name: 'state', defaultValue: '') required this.state});

  factory _$AddressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'lat', defaultValue: 0)
  final double lat;
  @override
  @JsonKey(name: 'lng', defaultValue: 0)
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
  @JsonKey(name: 'completeAddress', defaultValue: '')
  final String completeAddress;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  final String state;

  @override
  String toString() {
    return 'AddressDto(id: $id, lat: $lat, lng: $lng, pinCode: $pinCode, city: $city, vicinity: $vicinity, completeAddress: $completeAddress, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.completeAddress, completeAddress) ||
                other.completeAddress == completeAddress) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lat, lng, pinCode, city,
      vicinity, completeAddress, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDtoImplCopyWith<_$AddressDtoImpl> get copyWith =>
      __$$AddressDtoImplCopyWithImpl<_$AddressDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDtoImplToJson(
      this,
    );
  }
}

abstract class _AddressDto implements AddressDto {
  const factory _AddressDto(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'lat', defaultValue: 0) required final double lat,
      @JsonKey(name: 'lng', defaultValue: 0) required final double lng,
      @JsonKey(name: 'pinCode', defaultValue: '') required final String pinCode,
      @JsonKey(name: 'city', defaultValue: '') required final String city,
      @JsonKey(name: 'vicinity', defaultValue: '')
      required final String vicinity,
      @JsonKey(name: 'completeAddress', defaultValue: '')
      required final String completeAddress,
      @JsonKey(name: 'state', defaultValue: '')
      required final String state}) = _$AddressDtoImpl;

  factory _AddressDto.fromJson(Map<String, dynamic> json) =
      _$AddressDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'lat', defaultValue: 0)
  double get lat;
  @override
  @JsonKey(name: 'lng', defaultValue: 0)
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
  @JsonKey(name: 'completeAddress', defaultValue: '')
  String get completeAddress;
  @override
  @JsonKey(name: 'state', defaultValue: '')
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$AddressDtoImplCopyWith<_$AddressDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
