// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_options_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventOptionsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventOptionsStateCopyWith<EventOptionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventOptionsStateCopyWith<$Res> {
  factory $EventOptionsStateCopyWith(
          EventOptionsState value, $Res Function(EventOptionsState) then) =
      _$EventOptionsStateCopyWithImpl<$Res, EventOptionsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      int eventId,
      EventDto? event,
      EventRepository eventRepository});

  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventOptionsStateCopyWithImpl<$Res, $Val extends EventOptionsState>
    implements $EventOptionsStateCopyWith<$Res> {
  _$EventOptionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventId = null,
    Object? event = freezed,
    Object? eventRepository = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventDtoCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventDtoCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventOptionsStateImplCopyWith<$Res>
    implements $EventOptionsStateCopyWith<$Res> {
  factory _$$EventOptionsStateImplCopyWith(_$EventOptionsStateImpl value,
          $Res Function(_$EventOptionsStateImpl) then) =
      __$$EventOptionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      int eventId,
      EventDto? event,
      EventRepository eventRepository});

  @override
  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$EventOptionsStateImplCopyWithImpl<$Res>
    extends _$EventOptionsStateCopyWithImpl<$Res, _$EventOptionsStateImpl>
    implements _$$EventOptionsStateImplCopyWith<$Res> {
  __$$EventOptionsStateImplCopyWithImpl(_$EventOptionsStateImpl _value,
      $Res Function(_$EventOptionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventId = null,
    Object? event = freezed,
    Object? eventRepository = null,
  }) {
    return _then(_$EventOptionsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
    ));
  }
}

/// @nodoc

class _$EventOptionsStateImpl implements _EventOptionsState {
  const _$EventOptionsStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.eventId,
      this.event,
      required this.eventRepository});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final int eventId;
  @override
  final EventDto? event;
  @override
  final EventRepository eventRepository;

  @override
  String toString() {
    return 'EventOptionsState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, eventId: $eventId, event: $event, eventRepository: $eventRepository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOptionsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailure,
      noUse, eventId, event, eventRepository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOptionsStateImplCopyWith<_$EventOptionsStateImpl> get copyWith =>
      __$$EventOptionsStateImplCopyWithImpl<_$EventOptionsStateImpl>(
          this, _$identity);
}

abstract class _EventOptionsState implements EventOptionsState {
  const factory _EventOptionsState(
          {required final bool isLoading,
          required final bool isSuccess,
          required final bool isFailure,
          required final bool noUse,
          required final int eventId,
          final EventDto? event,
          required final EventRepository eventRepository}) =
      _$EventOptionsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  int get eventId;
  @override
  EventDto? get event;
  @override
  EventRepository get eventRepository;
  @override
  @JsonKey(ignore: true)
  _$$EventOptionsStateImplCopyWith<_$EventOptionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
