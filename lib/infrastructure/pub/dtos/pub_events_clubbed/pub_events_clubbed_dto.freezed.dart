// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_events_clubbed_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PubEventsClubbedDto _$PubEventsClubbedDtoFromJson(Map<String, dynamic> json) {
  return _PubEventsClubbedDto.fromJson(json);
}

/// @nodoc
mixin _$PubEventsClubbedDto {
  @JsonKey(name: 'eventMonths')
  List<int> get eventMonths => throw _privateConstructorUsedError;
  @JsonKey(name: 'events', defaultValue: [])
  List<PubEventDto> get events => throw _privateConstructorUsedError;

  /// Serializes this PubEventsClubbedDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubEventsClubbedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PubEventsClubbedDtoCopyWith<PubEventsClubbedDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubEventsClubbedDtoCopyWith<$Res> {
  factory $PubEventsClubbedDtoCopyWith(
          PubEventsClubbedDto value, $Res Function(PubEventsClubbedDto) then) =
      _$PubEventsClubbedDtoCopyWithImpl<$Res, PubEventsClubbedDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'eventMonths') List<int> eventMonths,
      @JsonKey(name: 'events', defaultValue: []) List<PubEventDto> events});
}

/// @nodoc
class _$PubEventsClubbedDtoCopyWithImpl<$Res, $Val extends PubEventsClubbedDto>
    implements $PubEventsClubbedDtoCopyWith<$Res> {
  _$PubEventsClubbedDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PubEventsClubbedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventMonths = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      eventMonths: null == eventMonths
          ? _value.eventMonths
          : eventMonths // ignore: cast_nullable_to_non_nullable
              as List<int>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<PubEventDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubEventsClubbedDtoImplCopyWith<$Res>
    implements $PubEventsClubbedDtoCopyWith<$Res> {
  factory _$$PubEventsClubbedDtoImplCopyWith(_$PubEventsClubbedDtoImpl value,
          $Res Function(_$PubEventsClubbedDtoImpl) then) =
      __$$PubEventsClubbedDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'eventMonths') List<int> eventMonths,
      @JsonKey(name: 'events', defaultValue: []) List<PubEventDto> events});
}

/// @nodoc
class __$$PubEventsClubbedDtoImplCopyWithImpl<$Res>
    extends _$PubEventsClubbedDtoCopyWithImpl<$Res, _$PubEventsClubbedDtoImpl>
    implements _$$PubEventsClubbedDtoImplCopyWith<$Res> {
  __$$PubEventsClubbedDtoImplCopyWithImpl(_$PubEventsClubbedDtoImpl _value,
      $Res Function(_$PubEventsClubbedDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PubEventsClubbedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventMonths = null,
    Object? events = null,
  }) {
    return _then(_$PubEventsClubbedDtoImpl(
      eventMonths: null == eventMonths
          ? _value.eventMonths
          : eventMonths // ignore: cast_nullable_to_non_nullable
              as List<int>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<PubEventDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubEventsClubbedDtoImpl implements _PubEventsClubbedDto {
  const _$PubEventsClubbedDtoImpl(
      {@JsonKey(name: 'eventMonths') required this.eventMonths,
      @JsonKey(name: 'events', defaultValue: []) required this.events});

  factory _$PubEventsClubbedDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubEventsClubbedDtoImplFromJson(json);

  @override
  @JsonKey(name: 'eventMonths')
  final List<int> eventMonths;
  @override
  @JsonKey(name: 'events', defaultValue: [])
  final List<PubEventDto> events;

  @override
  String toString() {
    return 'PubEventsClubbedDto(eventMonths: $eventMonths, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubEventsClubbedDtoImpl &&
            const DeepCollectionEquality()
                .equals(other.eventMonths, eventMonths) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventMonths),
      const DeepCollectionEquality().hash(events));

  /// Create a copy of PubEventsClubbedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PubEventsClubbedDtoImplCopyWith<_$PubEventsClubbedDtoImpl> get copyWith =>
      __$$PubEventsClubbedDtoImplCopyWithImpl<_$PubEventsClubbedDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubEventsClubbedDtoImplToJson(
      this,
    );
  }
}

abstract class _PubEventsClubbedDto implements PubEventsClubbedDto {
  const factory _PubEventsClubbedDto(
      {@JsonKey(name: 'eventMonths') required final List<int> eventMonths,
      @JsonKey(name: 'events', defaultValue: [])
      required final List<PubEventDto> events}) = _$PubEventsClubbedDtoImpl;

  factory _PubEventsClubbedDto.fromJson(Map<String, dynamic> json) =
      _$PubEventsClubbedDtoImpl.fromJson;

  @override
  @JsonKey(name: 'eventMonths')
  List<int> get eventMonths;
  @override
  @JsonKey(name: 'events', defaultValue: [])
  List<PubEventDto> get events;

  /// Create a copy of PubEventsClubbedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubEventsClubbedDtoImplCopyWith<_$PubEventsClubbedDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
