// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_cordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventCordinates _$EventCordinatesFromJson(Map<String, dynamic> json) {
  return _EventCordinates.fromJson(json);
}

/// @nodoc
mixin _$EventCordinates {
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  Cordinates get address => throw _privateConstructorUsedError;
  String get coverImagerUrl => throw _privateConstructorUsedError;

  /// Serializes this EventCordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCordinatesCopyWith<EventCordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCordinatesCopyWith<$Res> {
  factory $EventCordinatesCopyWith(
          EventCordinates value, $Res Function(EventCordinates) then) =
      _$EventCordinatesCopyWithImpl<$Res, EventCordinates>;
  @useResult
  $Res call(
      {int id, String fullName, Cordinates address, String coverImagerUrl});

  $CordinatesCopyWith<$Res> get address;
}

/// @nodoc
class _$EventCordinatesCopyWithImpl<$Res, $Val extends EventCordinates>
    implements $EventCordinatesCopyWith<$Res> {
  _$EventCordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? address = null,
    Object? coverImagerUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Cordinates,
      coverImagerUrl: null == coverImagerUrl
          ? _value.coverImagerUrl
          : coverImagerUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CordinatesCopyWith<$Res> get address {
    return $CordinatesCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventCordinatesImplCopyWith<$Res>
    implements $EventCordinatesCopyWith<$Res> {
  factory _$$EventCordinatesImplCopyWith(_$EventCordinatesImpl value,
          $Res Function(_$EventCordinatesImpl) then) =
      __$$EventCordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String fullName, Cordinates address, String coverImagerUrl});

  @override
  $CordinatesCopyWith<$Res> get address;
}

/// @nodoc
class __$$EventCordinatesImplCopyWithImpl<$Res>
    extends _$EventCordinatesCopyWithImpl<$Res, _$EventCordinatesImpl>
    implements _$$EventCordinatesImplCopyWith<$Res> {
  __$$EventCordinatesImplCopyWithImpl(
      _$EventCordinatesImpl _value, $Res Function(_$EventCordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? address = null,
    Object? coverImagerUrl = null,
  }) {
    return _then(_$EventCordinatesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Cordinates,
      coverImagerUrl: null == coverImagerUrl
          ? _value.coverImagerUrl
          : coverImagerUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCordinatesImpl implements _EventCordinates {
  _$EventCordinatesImpl(
      {required this.id,
      required this.fullName,
      required this.address,
      required this.coverImagerUrl});

  factory _$EventCordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCordinatesImplFromJson(json);

  @override
  final int id;
  @override
  final String fullName;
  @override
  final Cordinates address;
  @override
  final String coverImagerUrl;

  @override
  String toString() {
    return 'EventCordinates(id: $id, fullName: $fullName, address: $address, coverImagerUrl: $coverImagerUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCordinatesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.coverImagerUrl, coverImagerUrl) ||
                other.coverImagerUrl == coverImagerUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, address, coverImagerUrl);

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCordinatesImplCopyWith<_$EventCordinatesImpl> get copyWith =>
      __$$EventCordinatesImplCopyWithImpl<_$EventCordinatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCordinatesImplToJson(
      this,
    );
  }
}

abstract class _EventCordinates implements EventCordinates {
  factory _EventCordinates(
      {required final int id,
      required final String fullName,
      required final Cordinates address,
      required final String coverImagerUrl}) = _$EventCordinatesImpl;

  factory _EventCordinates.fromJson(Map<String, dynamic> json) =
      _$EventCordinatesImpl.fromJson;

  @override
  int get id;
  @override
  String get fullName;
  @override
  Cordinates get address;
  @override
  String get coverImagerUrl;

  /// Create a copy of EventCordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCordinatesImplCopyWith<_$EventCordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
