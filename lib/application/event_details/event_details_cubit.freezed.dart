// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  String get apiBaseUrl => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDetailsStateCopyWith<EventDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsStateCopyWith<$Res> {
  factory $EventDetailsStateCopyWith(
          EventDetailsState value, $Res Function(EventDetailsState) then) =
      _$EventDetailsStateCopyWithImpl<$Res, EventDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      String apiBaseUrl,
      EventRepository eventRepository,
      EventDto? event});

  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventDetailsStateCopyWithImpl<$Res, $Val extends EventDetailsState>
    implements $EventDetailsStateCopyWith<$Res> {
  _$EventDetailsStateCopyWithImpl(this._value, this._then);

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
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
    Object? event = freezed,
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
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
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
abstract class _$$EventDetailsStateImplCopyWith<$Res>
    implements $EventDetailsStateCopyWith<$Res> {
  factory _$$EventDetailsStateImplCopyWith(_$EventDetailsStateImpl value,
          $Res Function(_$EventDetailsStateImpl) then) =
      __$$EventDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      String apiBaseUrl,
      EventRepository eventRepository,
      EventDto? event});

  @override
  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$EventDetailsStateImplCopyWithImpl<$Res>
    extends _$EventDetailsStateCopyWithImpl<$Res, _$EventDetailsStateImpl>
    implements _$$EventDetailsStateImplCopyWith<$Res> {
  __$$EventDetailsStateImplCopyWithImpl(_$EventDetailsStateImpl _value,
      $Res Function(_$EventDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
    Object? event = freezed,
  }) {
    return _then(_$EventDetailsStateImpl(
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
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
    ));
  }
}

/// @nodoc

class _$EventDetailsStateImpl implements _EventDetailsState {
  const _$EventDetailsStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.apiBaseUrl,
      required this.eventRepository,
      required this.event});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final String apiBaseUrl;
  @override
  final EventRepository eventRepository;
  @override
  final EventDto? event;

  @override
  String toString() {
    return 'EventDetailsState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, apiBaseUrl: $apiBaseUrl, eventRepository: $eventRepository, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailure,
      apiBaseUrl, eventRepository, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      __$$EventDetailsStateImplCopyWithImpl<_$EventDetailsStateImpl>(
          this, _$identity);
}

abstract class _EventDetailsState implements EventDetailsState {
  const factory _EventDetailsState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final String apiBaseUrl,
      required final EventRepository eventRepository,
      required final EventDto? event}) = _$EventDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  String get apiBaseUrl;
  @override
  EventRepository get eventRepository;
  @override
  EventDto? get event;
  @override
  @JsonKey(ignore: true)
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
