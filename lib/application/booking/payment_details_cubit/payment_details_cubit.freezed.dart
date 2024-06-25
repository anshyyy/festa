// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  EventBookingDetailsDto get eventBookingDetails =>
      throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;
  Razorpay get razorpay => throw _privateConstructorUsedError;
  String get razorPayApiKey => throw _privateConstructorUsedError;
  bool get isPaymentSuccess => throw _privateConstructorUsedError;
  bool get isPaymentFailure => throw _privateConstructorUsedError;
  bool get isPaymentPending => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentDetailsStateCopyWith<PaymentDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsStateCopyWith<$Res> {
  factory $PaymentDetailsStateCopyWith(
          PaymentDetailsState value, $Res Function(PaymentDetailsState) then) =
      _$PaymentDetailsStateCopyWithImpl<$Res, PaymentDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      EventBookingDetailsDto eventBookingDetails,
      EventRepository eventRepository,
      EventDto? event,
      Razorpay razorpay,
      String razorPayApiKey,
      bool isPaymentSuccess,
      bool isPaymentFailure,
      bool isPaymentPending,
      double totalAmount,
      UserDto? user});

  $EventBookingDetailsDtoCopyWith<$Res> get eventBookingDetails;
  $EventDtoCopyWith<$Res>? get event;
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$PaymentDetailsStateCopyWithImpl<$Res, $Val extends PaymentDetailsState>
    implements $PaymentDetailsStateCopyWith<$Res> {
  _$PaymentDetailsStateCopyWithImpl(this._value, this._then);

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
    Object? eventBookingDetails = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? razorpay = null,
    Object? razorPayApiKey = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentFailure = null,
    Object? isPaymentPending = null,
    Object? totalAmount = null,
    Object? user = freezed,
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
      eventBookingDetails: null == eventBookingDetails
          ? _value.eventBookingDetails
          : eventBookingDetails // ignore: cast_nullable_to_non_nullable
              as EventBookingDetailsDto,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      razorpay: null == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay,
      razorPayApiKey: null == razorPayApiKey
          ? _value.razorPayApiKey
          : razorPayApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentFailure: null == isPaymentFailure
          ? _value.isPaymentFailure
          : isPaymentFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentPending: null == isPaymentPending
          ? _value.isPaymentPending
          : isPaymentPending // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventBookingDetailsDtoCopyWith<$Res> get eventBookingDetails {
    return $EventBookingDetailsDtoCopyWith<$Res>(_value.eventBookingDetails,
        (value) {
      return _then(_value.copyWith(eventBookingDetails: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentDetailsStateImplCopyWith<$Res>
    implements $PaymentDetailsStateCopyWith<$Res> {
  factory _$$PaymentDetailsStateImplCopyWith(_$PaymentDetailsStateImpl value,
          $Res Function(_$PaymentDetailsStateImpl) then) =
      __$$PaymentDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      EventBookingDetailsDto eventBookingDetails,
      EventRepository eventRepository,
      EventDto? event,
      Razorpay razorpay,
      String razorPayApiKey,
      bool isPaymentSuccess,
      bool isPaymentFailure,
      bool isPaymentPending,
      double totalAmount,
      UserDto? user});

  @override
  $EventBookingDetailsDtoCopyWith<$Res> get eventBookingDetails;
  @override
  $EventDtoCopyWith<$Res>? get event;
  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PaymentDetailsStateImplCopyWithImpl<$Res>
    extends _$PaymentDetailsStateCopyWithImpl<$Res, _$PaymentDetailsStateImpl>
    implements _$$PaymentDetailsStateImplCopyWith<$Res> {
  __$$PaymentDetailsStateImplCopyWithImpl(_$PaymentDetailsStateImpl _value,
      $Res Function(_$PaymentDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? eventBookingDetails = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? razorpay = null,
    Object? razorPayApiKey = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentFailure = null,
    Object? isPaymentPending = null,
    Object? totalAmount = null,
    Object? user = freezed,
  }) {
    return _then(_$PaymentDetailsStateImpl(
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
      eventBookingDetails: null == eventBookingDetails
          ? _value.eventBookingDetails
          : eventBookingDetails // ignore: cast_nullable_to_non_nullable
              as EventBookingDetailsDto,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      razorpay: null == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay,
      razorPayApiKey: null == razorPayApiKey
          ? _value.razorPayApiKey
          : razorPayApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentFailure: null == isPaymentFailure
          ? _value.isPaymentFailure
          : isPaymentFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentPending: null == isPaymentPending
          ? _value.isPaymentPending
          : isPaymentPending // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$PaymentDetailsStateImpl implements _PaymentDetailsState {
  const _$PaymentDetailsStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.eventBookingDetails,
      required this.eventRepository,
      this.event,
      required this.razorpay,
      required this.razorPayApiKey,
      required this.isPaymentSuccess,
      required this.isPaymentFailure,
      required this.isPaymentPending,
      required this.totalAmount,
      this.user});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final EventBookingDetailsDto eventBookingDetails;
  @override
  final EventRepository eventRepository;
  @override
  final EventDto? event;
  @override
  final Razorpay razorpay;
  @override
  final String razorPayApiKey;
  @override
  final bool isPaymentSuccess;
  @override
  final bool isPaymentFailure;
  @override
  final bool isPaymentPending;
  @override
  final double totalAmount;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'PaymentDetailsState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, eventBookingDetails: $eventBookingDetails, eventRepository: $eventRepository, event: $event, razorpay: $razorpay, razorPayApiKey: $razorPayApiKey, isPaymentSuccess: $isPaymentSuccess, isPaymentFailure: $isPaymentFailure, isPaymentPending: $isPaymentPending, totalAmount: $totalAmount, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.eventBookingDetails, eventBookingDetails) ||
                other.eventBookingDetails == eventBookingDetails) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.razorpay, razorpay) ||
                other.razorpay == razorpay) &&
            (identical(other.razorPayApiKey, razorPayApiKey) ||
                other.razorPayApiKey == razorPayApiKey) &&
            (identical(other.isPaymentSuccess, isPaymentSuccess) ||
                other.isPaymentSuccess == isPaymentSuccess) &&
            (identical(other.isPaymentFailure, isPaymentFailure) ||
                other.isPaymentFailure == isPaymentFailure) &&
            (identical(other.isPaymentPending, isPaymentPending) ||
                other.isPaymentPending == isPaymentPending) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      noUse,
      eventBookingDetails,
      eventRepository,
      event,
      razorpay,
      razorPayApiKey,
      isPaymentSuccess,
      isPaymentFailure,
      isPaymentPending,
      totalAmount,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailsStateImplCopyWith<_$PaymentDetailsStateImpl> get copyWith =>
      __$$PaymentDetailsStateImplCopyWithImpl<_$PaymentDetailsStateImpl>(
          this, _$identity);
}

abstract class _PaymentDetailsState implements PaymentDetailsState {
  const factory _PaymentDetailsState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final EventBookingDetailsDto eventBookingDetails,
      required final EventRepository eventRepository,
      final EventDto? event,
      required final Razorpay razorpay,
      required final String razorPayApiKey,
      required final bool isPaymentSuccess,
      required final bool isPaymentFailure,
      required final bool isPaymentPending,
      required final double totalAmount,
      final UserDto? user}) = _$PaymentDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  EventBookingDetailsDto get eventBookingDetails;
  @override
  EventRepository get eventRepository;
  @override
  EventDto? get event;
  @override
  Razorpay get razorpay;
  @override
  String get razorPayApiKey;
  @override
  bool get isPaymentSuccess;
  @override
  bool get isPaymentFailure;
  @override
  bool get isPaymentPending;
  @override
  double get totalAmount;
  @override
  UserDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDetailsStateImplCopyWith<_$PaymentDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
