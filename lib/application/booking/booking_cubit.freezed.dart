// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingState {
  int get standardTicketCount => throw _privateConstructorUsedError;
  int get earlyBirdTicketCount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call(
      {int standardTicketCount,
      int earlyBirdTicketCount,
      bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      EventRepository eventRepository,
      EventDto? event});

  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardTicketCount = null,
    Object? earlyBirdTicketCount = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventRepository = null,
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      standardTicketCount: null == standardTicketCount
          ? _value.standardTicketCount
          : standardTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
      earlyBirdTicketCount: null == earlyBirdTicketCount
          ? _value.earlyBirdTicketCount
          : earlyBirdTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$$BookingStateImplCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$$BookingStateImplCopyWith(
          _$$BookingStateImpl value, $Res Function(_$$BookingStateImpl) then) =
      __$$$BookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int standardTicketCount,
      int earlyBirdTicketCount,
      bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      EventRepository eventRepository,
      EventDto? event});

  @override
  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$$BookingStateImpl>
    implements _$$$BookingStateImplCopyWith<$Res> {
  __$$$BookingStateImplCopyWithImpl(
      _$$BookingStateImpl _value, $Res Function(_$$BookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardTicketCount = null,
    Object? earlyBirdTicketCount = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventRepository = null,
    Object? event = freezed,
  }) {
    return _then(_$$BookingStateImpl(
      standardTicketCount: null == standardTicketCount
          ? _value.standardTicketCount
          : standardTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
      earlyBirdTicketCount: null == earlyBirdTicketCount
          ? _value.earlyBirdTicketCount
          : earlyBirdTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$$BookingStateImpl implements $BookingState {
  const _$$BookingStateImpl(
      {required this.standardTicketCount,
      required this.earlyBirdTicketCount,
      required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.eventRepository,
      this.event});

  @override
  final int standardTicketCount;
  @override
  final int earlyBirdTicketCount;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final EventRepository eventRepository;
  @override
  final EventDto? event;

  @override
  String toString() {
    return 'BookingState(standardTicketCount: $standardTicketCount, earlyBirdTicketCount: $earlyBirdTicketCount, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, eventRepository: $eventRepository, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$BookingStateImpl &&
            (identical(other.standardTicketCount, standardTicketCount) ||
                other.standardTicketCount == standardTicketCount) &&
            (identical(other.earlyBirdTicketCount, earlyBirdTicketCount) ||
                other.earlyBirdTicketCount == earlyBirdTicketCount) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      standardTicketCount,
      earlyBirdTicketCount,
      isLoading,
      isSuccess,
      isFailure,
      noUse,
      eventRepository,
      event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$BookingStateImplCopyWith<_$$BookingStateImpl> get copyWith =>
      __$$$BookingStateImplCopyWithImpl<_$$BookingStateImpl>(this, _$identity);
}

abstract class $BookingState implements BookingState {
  const factory $BookingState(
      {required final int standardTicketCount,
      required final int earlyBirdTicketCount,
      required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final EventRepository eventRepository,
      final EventDto? event}) = _$$BookingStateImpl;

  @override
  int get standardTicketCount;
  @override
  int get earlyBirdTicketCount;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  EventRepository get eventRepository;
  @override
  EventDto? get event;
  @override
  @JsonKey(ignore: true)
  _$$$BookingStateImplCopyWith<_$$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
