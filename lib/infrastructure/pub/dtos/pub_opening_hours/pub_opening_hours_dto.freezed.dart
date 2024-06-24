// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_opening_hours_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubOpeningHours _$PubOpeningHoursFromJson(Map<String, dynamic> json) {
  return _PubOpeningHours.fromJson(json);
}

/// @nodoc
mixin _$PubOpeningHours {
  @JsonKey(name: 'open_now', defaultValue: false)
  bool get openNow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubOpeningHoursCopyWith<PubOpeningHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubOpeningHoursCopyWith<$Res> {
  factory $PubOpeningHoursCopyWith(
          PubOpeningHours value, $Res Function(PubOpeningHours) then) =
      _$PubOpeningHoursCopyWithImpl<$Res, PubOpeningHours>;
  @useResult
  $Res call({@JsonKey(name: 'open_now', defaultValue: false) bool openNow});
}

/// @nodoc
class _$PubOpeningHoursCopyWithImpl<$Res, $Val extends PubOpeningHours>
    implements $PubOpeningHoursCopyWith<$Res> {
  _$PubOpeningHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
  }) {
    return _then(_value.copyWith(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubOpeningHoursImplCopyWith<$Res>
    implements $PubOpeningHoursCopyWith<$Res> {
  factory _$$PubOpeningHoursImplCopyWith(_$PubOpeningHoursImpl value,
          $Res Function(_$PubOpeningHoursImpl) then) =
      __$$PubOpeningHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'open_now', defaultValue: false) bool openNow});
}

/// @nodoc
class __$$PubOpeningHoursImplCopyWithImpl<$Res>
    extends _$PubOpeningHoursCopyWithImpl<$Res, _$PubOpeningHoursImpl>
    implements _$$PubOpeningHoursImplCopyWith<$Res> {
  __$$PubOpeningHoursImplCopyWithImpl(
      _$PubOpeningHoursImpl _value, $Res Function(_$PubOpeningHoursImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
  }) {
    return _then(_$PubOpeningHoursImpl(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubOpeningHoursImpl implements _PubOpeningHours {
  const _$PubOpeningHoursImpl(
      {@JsonKey(name: 'open_now', defaultValue: false) required this.openNow});

  factory _$PubOpeningHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubOpeningHoursImplFromJson(json);

  @override
  @JsonKey(name: 'open_now', defaultValue: false)
  final bool openNow;

  @override
  String toString() {
    return 'PubOpeningHours(openNow: $openNow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubOpeningHoursImpl &&
            (identical(other.openNow, openNow) || other.openNow == openNow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, openNow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubOpeningHoursImplCopyWith<_$PubOpeningHoursImpl> get copyWith =>
      __$$PubOpeningHoursImplCopyWithImpl<_$PubOpeningHoursImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubOpeningHoursImplToJson(
      this,
    );
  }
}

abstract class _PubOpeningHours implements PubOpeningHours {
  const factory _PubOpeningHours(
      {@JsonKey(name: 'open_now', defaultValue: false)
      required final bool openNow}) = _$PubOpeningHoursImpl;

  factory _PubOpeningHours.fromJson(Map<String, dynamic> json) =
      _$PubOpeningHoursImpl.fromJson;

  @override
  @JsonKey(name: 'open_now', defaultValue: false)
  bool get openNow;
  @override
  @JsonKey(ignore: true)
  _$$PubOpeningHoursImplCopyWith<_$PubOpeningHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
