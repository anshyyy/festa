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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PubOpeningHours _$PubOpeningHoursFromJson(Map<String, dynamic> json) {
  return _PubOpeningHours.fromJson(json);
}

/// @nodoc
mixin _$PubOpeningHours {
  @JsonKey(name: 'periods')
  List<Period> get periods => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_now', defaultValue: false)
  bool get openNow => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText => throw _privateConstructorUsedError;

  /// Serializes this PubOpeningHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubOpeningHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PubOpeningHoursCopyWith<PubOpeningHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubOpeningHoursCopyWith<$Res> {
  factory $PubOpeningHoursCopyWith(
          PubOpeningHours value, $Res Function(PubOpeningHours) then) =
      _$PubOpeningHoursCopyWithImpl<$Res, PubOpeningHours>;
  @useResult
  $Res call(
      {@JsonKey(name: 'periods') List<Period> periods,
      @JsonKey(name: 'open_now', defaultValue: false) bool openNow,
      @JsonKey(name: 'weekday_text') List<String> weekdayText});
}

/// @nodoc
class _$PubOpeningHoursCopyWithImpl<$Res, $Val extends PubOpeningHours>
    implements $PubOpeningHoursCopyWith<$Res> {
  _$PubOpeningHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PubOpeningHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periods = null,
    Object? openNow = null,
    Object? weekdayText = null,
  }) {
    return _then(_value.copyWith(
      periods: null == periods
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<Period>,
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      weekdayText: null == weekdayText
          ? _value.weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $Res call(
      {@JsonKey(name: 'periods') List<Period> periods,
      @JsonKey(name: 'open_now', defaultValue: false) bool openNow,
      @JsonKey(name: 'weekday_text') List<String> weekdayText});
}

/// @nodoc
class __$$PubOpeningHoursImplCopyWithImpl<$Res>
    extends _$PubOpeningHoursCopyWithImpl<$Res, _$PubOpeningHoursImpl>
    implements _$$PubOpeningHoursImplCopyWith<$Res> {
  __$$PubOpeningHoursImplCopyWithImpl(
      _$PubOpeningHoursImpl _value, $Res Function(_$PubOpeningHoursImpl) _then)
      : super(_value, _then);

  /// Create a copy of PubOpeningHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periods = null,
    Object? openNow = null,
    Object? weekdayText = null,
  }) {
    return _then(_$PubOpeningHoursImpl(
      periods: null == periods
          ? _value._periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<Period>,
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      weekdayText: null == weekdayText
          ? _value._weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubOpeningHoursImpl implements _PubOpeningHours {
  const _$PubOpeningHoursImpl(
      {@JsonKey(name: 'periods') required final List<Period> periods,
      @JsonKey(name: 'open_now', defaultValue: false) required this.openNow,
      @JsonKey(name: 'weekday_text') required final List<String> weekdayText})
      : _periods = periods,
        _weekdayText = weekdayText;

  factory _$PubOpeningHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubOpeningHoursImplFromJson(json);

  final List<Period> _periods;
  @override
  @JsonKey(name: 'periods')
  List<Period> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  @override
  @JsonKey(name: 'open_now', defaultValue: false)
  final bool openNow;
  final List<String> _weekdayText;
  @override
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText {
    if (_weekdayText is EqualUnmodifiableListView) return _weekdayText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdayText);
  }

  @override
  String toString() {
    return 'PubOpeningHours(periods: $periods, openNow: $openNow, weekdayText: $weekdayText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubOpeningHoursImpl &&
            const DeepCollectionEquality().equals(other._periods, _periods) &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality()
                .equals(other._weekdayText, _weekdayText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_periods),
      openNow,
      const DeepCollectionEquality().hash(_weekdayText));

  /// Create a copy of PubOpeningHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: 'periods') required final List<Period> periods,
      @JsonKey(name: 'open_now', defaultValue: false)
      required final bool openNow,
      @JsonKey(name: 'weekday_text')
      required final List<String> weekdayText}) = _$PubOpeningHoursImpl;

  factory _PubOpeningHours.fromJson(Map<String, dynamic> json) =
      _$PubOpeningHoursImpl.fromJson;

  @override
  @JsonKey(name: 'periods')
  List<Period> get periods;
  @override
  @JsonKey(name: 'open_now', defaultValue: false)
  bool get openNow;
  @override
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText;

  /// Create a copy of PubOpeningHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubOpeningHoursImplCopyWith<_$PubOpeningHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
