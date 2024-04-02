// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentStatusState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  int get numberOfTickets => throw _privateConstructorUsedError;
  bool get isPaymentSuccess => throw _privateConstructorUsedError;
  bool get isPaymentPending => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStatusStateCopyWith<PaymentStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusStateCopyWith<$Res> {
  factory $PaymentStatusStateCopyWith(
          PaymentStatusState value, $Res Function(PaymentStatusState) then) =
      _$PaymentStatusStateCopyWithImpl<$Res, PaymentStatusState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      int eventId,
      int numberOfTickets,
      bool isPaymentSuccess,
      bool isPaymentPending,
      EventRepository eventRepository,
      double totalAmount,
      EventDto? event});

  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class _$PaymentStatusStateCopyWithImpl<$Res, $Val extends PaymentStatusState>
    implements $PaymentStatusStateCopyWith<$Res> {
  _$PaymentStatusStateCopyWithImpl(this._value, this._then);

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
    Object? numberOfTickets = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentPending = null,
    Object? eventRepository = null,
    Object? totalAmount = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentPending: null == isPaymentPending
          ? _value.isPaymentPending
          : isPaymentPending // ignore: cast_nullable_to_non_nullable
              as bool,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$PaymentStatusStateImplCopyWith<$Res>
    implements $PaymentStatusStateCopyWith<$Res> {
  factory _$$PaymentStatusStateImplCopyWith(_$PaymentStatusStateImpl value,
          $Res Function(_$PaymentStatusStateImpl) then) =
      __$$PaymentStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      int eventId,
      int numberOfTickets,
      bool isPaymentSuccess,
      bool isPaymentPending,
      EventRepository eventRepository,
      double totalAmount,
      EventDto? event});

  @override
  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$PaymentStatusStateImplCopyWithImpl<$Res>
    extends _$PaymentStatusStateCopyWithImpl<$Res, _$PaymentStatusStateImpl>
    implements _$$PaymentStatusStateImplCopyWith<$Res> {
  __$$PaymentStatusStateImplCopyWithImpl(_$PaymentStatusStateImpl _value,
      $Res Function(_$PaymentStatusStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventId = null,
    Object? numberOfTickets = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentPending = null,
    Object? eventRepository = null,
    Object? totalAmount = null,
    Object? event = freezed,
  }) {
    return _then(_$PaymentStatusStateImpl(
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
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentPending: null == isPaymentPending
          ? _value.isPaymentPending
          : isPaymentPending // ignore: cast_nullable_to_non_nullable
              as bool,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
    ));
  }
}

/// @nodoc

class _$PaymentStatusStateImpl implements _PaymentStatusState {
  const _$PaymentStatusStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.eventId,
      required this.numberOfTickets,
      required this.isPaymentSuccess,
      required this.isPaymentPending,
      required this.eventRepository,
      required this.totalAmount,
      this.event});

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
  final int numberOfTickets;
  @override
  final bool isPaymentSuccess;
  @override
  final bool isPaymentPending;
  @override
  final EventRepository eventRepository;
  @override
  final double totalAmount;
  @override
  final EventDto? event;

  @override
  String toString() {
    return 'PaymentStatusState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, eventId: $eventId, numberOfTickets: $numberOfTickets, isPaymentSuccess: $isPaymentSuccess, isPaymentPending: $isPaymentPending, eventRepository: $eventRepository, totalAmount: $totalAmount, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStatusStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.numberOfTickets, numberOfTickets) ||
                other.numberOfTickets == numberOfTickets) &&
            (identical(other.isPaymentSuccess, isPaymentSuccess) ||
                other.isPaymentSuccess == isPaymentSuccess) &&
            (identical(other.isPaymentPending, isPaymentPending) ||
                other.isPaymentPending == isPaymentPending) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      noUse,
      eventId,
      numberOfTickets,
      isPaymentSuccess,
      isPaymentPending,
      eventRepository,
      totalAmount,
      event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStatusStateImplCopyWith<_$PaymentStatusStateImpl> get copyWith =>
      __$$PaymentStatusStateImplCopyWithImpl<_$PaymentStatusStateImpl>(
          this, _$identity);
}

abstract class _PaymentStatusState implements PaymentStatusState {
  const factory _PaymentStatusState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final int eventId,
      required final int numberOfTickets,
      required final bool isPaymentSuccess,
      required final bool isPaymentPending,
      required final EventRepository eventRepository,
      required final double totalAmount,
      final EventDto? event}) = _$PaymentStatusStateImpl;

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
  int get numberOfTickets;
  @override
  bool get isPaymentSuccess;
  @override
  bool get isPaymentPending;
  @override
  EventRepository get eventRepository;
  @override
  double get totalAmount;
  @override
  EventDto? get event;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStatusStateImplCopyWith<_$PaymentStatusStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
