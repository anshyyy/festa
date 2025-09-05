// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_close.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenClose _$OpenCloseFromJson(Map<String, dynamic> json) {
  return _OpenClose.fromJson(json);
}

/// @nodoc
mixin _$OpenClose {
  int get day => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  /// Serializes this OpenClose to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenClose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenCloseCopyWith<OpenClose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCloseCopyWith<$Res> {
  factory $OpenCloseCopyWith(OpenClose value, $Res Function(OpenClose) then) =
      _$OpenCloseCopyWithImpl<$Res, OpenClose>;
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class _$OpenCloseCopyWithImpl<$Res, $Val extends OpenClose>
    implements $OpenCloseCopyWith<$Res> {
  _$OpenCloseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenClose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenCloseImplCopyWith<$Res>
    implements $OpenCloseCopyWith<$Res> {
  factory _$$OpenCloseImplCopyWith(
          _$OpenCloseImpl value, $Res Function(_$OpenCloseImpl) then) =
      __$$OpenCloseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class __$$OpenCloseImplCopyWithImpl<$Res>
    extends _$OpenCloseCopyWithImpl<$Res, _$OpenCloseImpl>
    implements _$$OpenCloseImplCopyWith<$Res> {
  __$$OpenCloseImplCopyWithImpl(
      _$OpenCloseImpl _value, $Res Function(_$OpenCloseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenClose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$OpenCloseImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenCloseImpl implements _OpenClose {
  const _$OpenCloseImpl({required this.day, required this.time});

  factory _$OpenCloseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenCloseImplFromJson(json);

  @override
  final int day;
  @override
  final String time;

  @override
  String toString() {
    return 'OpenClose(day: $day, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenCloseImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, time);

  /// Create a copy of OpenClose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenCloseImplCopyWith<_$OpenCloseImpl> get copyWith =>
      __$$OpenCloseImplCopyWithImpl<_$OpenCloseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenCloseImplToJson(
      this,
    );
  }
}

abstract class _OpenClose implements OpenClose {
  const factory _OpenClose(
      {required final int day, required final String time}) = _$OpenCloseImpl;

  factory _OpenClose.fromJson(Map<String, dynamic> json) =
      _$OpenCloseImpl.fromJson;

  @override
  int get day;
  @override
  String get time;

  /// Create a copy of OpenClose
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenCloseImplCopyWith<_$OpenCloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
