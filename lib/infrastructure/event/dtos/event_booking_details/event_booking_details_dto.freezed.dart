// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_booking_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventBookingDetailsDto _$EventBookingDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _EventBookingDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$EventBookingDetailsDto {
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  int get numberOfTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  List<EventTicketDetailDto> get eventTicketDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'event')
  EventDto get eventDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', defaultValue: 0)
  int get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpayOrderId', defaultValue: null)
  String? get razorpayOrderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventBookingDetailsDtoCopyWith<EventBookingDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventBookingDetailsDtoCopyWith<$Res> {
  factory $EventBookingDetailsDtoCopyWith(EventBookingDetailsDto value,
          $Res Function(EventBookingDetailsDto) then) =
      _$EventBookingDetailsDtoCopyWithImpl<$Res, EventBookingDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'numberOfTickets', defaultValue: 0) int numberOfTickets,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') EventDto eventDetails,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'id', defaultValue: 0) int bookingId,
      @JsonKey(name: 'razorpayOrderId', defaultValue: null)
      String? razorpayOrderId});

  $EventDtoCopyWith<$Res> get eventDetails;
}

/// @nodoc
class _$EventBookingDetailsDtoCopyWithImpl<$Res,
        $Val extends EventBookingDetailsDto>
    implements $EventBookingDetailsDtoCopyWith<$Res> {
  _$EventBookingDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfTickets = null,
    Object? eventTicketDetails = null,
    Object? eventDetails = null,
    Object? status = null,
    Object? bookingId = null,
    Object? razorpayOrderId = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      eventTicketDetails: null == eventTicketDetails
          ? _value.eventTicketDetails
          : eventTicketDetails // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDetailDto>,
      eventDetails: null == eventDetails
          ? _value.eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as EventDto,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      razorpayOrderId: freezed == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventDtoCopyWith<$Res> get eventDetails {
    return $EventDtoCopyWith<$Res>(_value.eventDetails, (value) {
      return _then(_value.copyWith(eventDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventBookingDetailsDtoImplCopyWith<$Res>
    implements $EventBookingDetailsDtoCopyWith<$Res> {
  factory _$$EventBookingDetailsDtoImplCopyWith(
          _$EventBookingDetailsDtoImpl value,
          $Res Function(_$EventBookingDetailsDtoImpl) then) =
      __$$EventBookingDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'numberOfTickets', defaultValue: 0) int numberOfTickets,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') EventDto eventDetails,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'id', defaultValue: 0) int bookingId,
      @JsonKey(name: 'razorpayOrderId', defaultValue: null)
      String? razorpayOrderId});

  @override
  $EventDtoCopyWith<$Res> get eventDetails;
}

/// @nodoc
class __$$EventBookingDetailsDtoImplCopyWithImpl<$Res>
    extends _$EventBookingDetailsDtoCopyWithImpl<$Res,
        _$EventBookingDetailsDtoImpl>
    implements _$$EventBookingDetailsDtoImplCopyWith<$Res> {
  __$$EventBookingDetailsDtoImplCopyWithImpl(
      _$EventBookingDetailsDtoImpl _value,
      $Res Function(_$EventBookingDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfTickets = null,
    Object? eventTicketDetails = null,
    Object? eventDetails = null,
    Object? status = null,
    Object? bookingId = null,
    Object? razorpayOrderId = freezed,
  }) {
    return _then(_$EventBookingDetailsDtoImpl(
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      eventTicketDetails: null == eventTicketDetails
          ? _value.eventTicketDetails
          : eventTicketDetails // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDetailDto>,
      eventDetails: null == eventDetails
          ? _value.eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as EventDto,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      razorpayOrderId: freezed == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventBookingDetailsDtoImpl implements _EventBookingDetailsDto {
  const _$EventBookingDetailsDtoImpl(
      {@JsonKey(name: 'numberOfTickets', defaultValue: 0)
      required this.numberOfTickets,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      required this.eventTicketDetails,
      @JsonKey(name: 'event') required this.eventDetails,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'id', defaultValue: 0) required this.bookingId,
      @JsonKey(name: 'razorpayOrderId', defaultValue: null)
      this.razorpayOrderId});

  factory _$EventBookingDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventBookingDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  final int numberOfTickets;
  @override
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  final List<EventTicketDetailDto> eventTicketDetails;
  @override
  @JsonKey(name: 'event')
  final EventDto eventDetails;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int bookingId;
  @override
  @JsonKey(name: 'razorpayOrderId', defaultValue: null)
  final String? razorpayOrderId;

  @override
  String toString() {
    return 'EventBookingDetailsDto(numberOfTickets: $numberOfTickets, eventTicketDetails: $eventTicketDetails, eventDetails: $eventDetails, status: $status, bookingId: $bookingId, razorpayOrderId: $razorpayOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventBookingDetailsDtoImpl &&
            (identical(other.numberOfTickets, numberOfTickets) ||
                other.numberOfTickets == numberOfTickets) &&
            const DeepCollectionEquality()
                .equals(other.eventTicketDetails, eventTicketDetails) &&
            (identical(other.eventDetails, eventDetails) ||
                other.eventDetails == eventDetails) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      numberOfTickets,
      const DeepCollectionEquality().hash(eventTicketDetails),
      eventDetails,
      status,
      bookingId,
      razorpayOrderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventBookingDetailsDtoImplCopyWith<_$EventBookingDetailsDtoImpl>
      get copyWith => __$$EventBookingDetailsDtoImplCopyWithImpl<
          _$EventBookingDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventBookingDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _EventBookingDetailsDto implements EventBookingDetailsDto {
  const factory _EventBookingDetailsDto(
      {@JsonKey(name: 'numberOfTickets', defaultValue: 0)
      required final int numberOfTickets,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      required final List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') required final EventDto eventDetails,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'id', defaultValue: 0) required final int bookingId,
      @JsonKey(name: 'razorpayOrderId', defaultValue: null)
      final String? razorpayOrderId}) = _$EventBookingDetailsDtoImpl;

  factory _EventBookingDetailsDto.fromJson(Map<String, dynamic> json) =
      _$EventBookingDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  int get numberOfTickets;
  @override
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  List<EventTicketDetailDto> get eventTicketDetails;
  @override
  @JsonKey(name: 'event')
  EventDto get eventDetails;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get bookingId;
  @override
  @JsonKey(name: 'razorpayOrderId', defaultValue: null)
  String? get razorpayOrderId;
  @override
  @JsonKey(ignore: true)
  _$$EventBookingDetailsDtoImplCopyWith<_$EventBookingDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
