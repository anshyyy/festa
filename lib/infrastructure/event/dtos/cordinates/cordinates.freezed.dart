// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cordinates _$CordinatesFromJson(Map<String, dynamic> json) {
  return _Cordinates.fromJson(json);
}

/// @nodoc
mixin _$Cordinates {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this Cordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CordinatesCopyWith<Cordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CordinatesCopyWith<$Res> {
  factory $CordinatesCopyWith(
          Cordinates value, $Res Function(Cordinates) then) =
      _$CordinatesCopyWithImpl<$Res, Cordinates>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$CordinatesCopyWithImpl<$Res, $Val extends Cordinates>
    implements $CordinatesCopyWith<$Res> {
  _$CordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CordinatesImplCopyWith<$Res>
    implements $CordinatesCopyWith<$Res> {
  factory _$$CordinatesImplCopyWith(
          _$CordinatesImpl value, $Res Function(_$CordinatesImpl) then) =
      __$$CordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$CordinatesImplCopyWithImpl<$Res>
    extends _$CordinatesCopyWithImpl<$Res, _$CordinatesImpl>
    implements _$$CordinatesImplCopyWith<$Res> {
  __$$CordinatesImplCopyWithImpl(
      _$CordinatesImpl _value, $Res Function(_$CordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$CordinatesImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CordinatesImpl implements _Cordinates {
  _$CordinatesImpl({required this.lat, required this.lng});

  factory _$CordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CordinatesImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'Cordinates(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of Cordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CordinatesImplCopyWith<_$CordinatesImpl> get copyWith =>
      __$$CordinatesImplCopyWithImpl<_$CordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CordinatesImplToJson(
      this,
    );
  }
}

abstract class _Cordinates implements Cordinates {
  factory _Cordinates({required final double lat, required final double lng}) =
      _$CordinatesImpl;

  factory _Cordinates.fromJson(Map<String, dynamic> json) =
      _$CordinatesImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of Cordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CordinatesImplCopyWith<_$CordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
