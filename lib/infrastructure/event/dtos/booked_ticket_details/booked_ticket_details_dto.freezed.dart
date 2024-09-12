// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booked_ticket_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookedTicketDetailsDto _$BookedTicketDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _BookedTicketDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$BookedTicketDetailsDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  int get numberOfTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'remainingAmount', defaultValue: 0)
  double get remainingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  List<EventTicketDetailDto> get eventTicketDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'event')
  EventDto get eventDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionId', defaultValue: '')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingReference', defaultValue: '')
  String get bookingReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  String get paymentAmount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get showTicketDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookedTicketDetailsDtoCopyWith<BookedTicketDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedTicketDetailsDtoCopyWith<$Res> {
  factory $BookedTicketDetailsDtoCopyWith(BookedTicketDetailsDto value,
          $Res Function(BookedTicketDetailsDto) then) =
      _$BookedTicketDetailsDtoCopyWithImpl<$Res, BookedTicketDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'numberOfTickets', defaultValue: 0) int numberOfTickets,
      @JsonKey(name: 'remainingAmount', defaultValue: 0) double remainingAmount,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') EventDto eventDetails,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'transactionId', defaultValue: '') String transactionId,
      @JsonKey(name: 'bookingReference', defaultValue: '')
      String bookingReference,
      @JsonKey(name: 'paymentAmount', defaultValue: '') String paymentAmount,
      @JsonKey(defaultValue: false) bool showTicketDetails});

  $EventDtoCopyWith<$Res> get eventDetails;
}

/// @nodoc
class _$BookedTicketDetailsDtoCopyWithImpl<$Res,
        $Val extends BookedTicketDetailsDto>
    implements $BookedTicketDetailsDtoCopyWith<$Res> {
  _$BookedTicketDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numberOfTickets = null,
    Object? remainingAmount = null,
    Object? eventTicketDetails = null,
    Object? eventDetails = null,
    Object? paymentMethod = null,
    Object? transactionId = null,
    Object? bookingReference = null,
    Object? paymentAmount = null,
    Object? showTicketDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      eventTicketDetails: null == eventTicketDetails
          ? _value.eventTicketDetails
          : eventTicketDetails // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDetailDto>,
      eventDetails: null == eventDetails
          ? _value.eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as EventDto,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as String,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$BookedTicketDetailsDtoImplCopyWith<$Res>
    implements $BookedTicketDetailsDtoCopyWith<$Res> {
  factory _$$BookedTicketDetailsDtoImplCopyWith(
          _$BookedTicketDetailsDtoImpl value,
          $Res Function(_$BookedTicketDetailsDtoImpl) then) =
      __$$BookedTicketDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'numberOfTickets', defaultValue: 0) int numberOfTickets,
      @JsonKey(name: 'remainingAmount', defaultValue: 0) double remainingAmount,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') EventDto eventDetails,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'transactionId', defaultValue: '') String transactionId,
      @JsonKey(name: 'bookingReference', defaultValue: '')
      String bookingReference,
      @JsonKey(name: 'paymentAmount', defaultValue: '') String paymentAmount,
      @JsonKey(defaultValue: false) bool showTicketDetails});

  @override
  $EventDtoCopyWith<$Res> get eventDetails;
}

/// @nodoc
class __$$BookedTicketDetailsDtoImplCopyWithImpl<$Res>
    extends _$BookedTicketDetailsDtoCopyWithImpl<$Res,
        _$BookedTicketDetailsDtoImpl>
    implements _$$BookedTicketDetailsDtoImplCopyWith<$Res> {
  __$$BookedTicketDetailsDtoImplCopyWithImpl(
      _$BookedTicketDetailsDtoImpl _value,
      $Res Function(_$BookedTicketDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numberOfTickets = null,
    Object? remainingAmount = null,
    Object? eventTicketDetails = null,
    Object? eventDetails = null,
    Object? paymentMethod = null,
    Object? transactionId = null,
    Object? bookingReference = null,
    Object? paymentAmount = null,
    Object? showTicketDetails = null,
  }) {
    return _then(_$BookedTicketDetailsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfTickets: null == numberOfTickets
          ? _value.numberOfTickets
          : numberOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      eventTicketDetails: null == eventTicketDetails
          ? _value.eventTicketDetails
          : eventTicketDetails // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDetailDto>,
      eventDetails: null == eventDetails
          ? _value.eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as EventDto,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as String,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookedTicketDetailsDtoImpl implements _BookedTicketDetailsDto {
  const _$BookedTicketDetailsDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'numberOfTickets', defaultValue: 0)
      required this.numberOfTickets,
      @JsonKey(name: 'remainingAmount', defaultValue: 0)
      required this.remainingAmount,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      required this.eventTicketDetails,
      @JsonKey(name: 'event') required this.eventDetails,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required this.paymentMethod,
      @JsonKey(name: 'transactionId', defaultValue: '')
      required this.transactionId,
      @JsonKey(name: 'bookingReference', defaultValue: '')
      required this.bookingReference,
      @JsonKey(name: 'paymentAmount', defaultValue: '')
      required this.paymentAmount,
      @JsonKey(defaultValue: false) required this.showTicketDetails});

  factory _$BookedTicketDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookedTicketDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  final int numberOfTickets;
  @override
  @JsonKey(name: 'remainingAmount', defaultValue: 0)
  final double remainingAmount;
  @override
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  final List<EventTicketDetailDto> eventTicketDetails;
  @override
  @JsonKey(name: 'event')
  final EventDto eventDetails;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  final String paymentMethod;
  @override
  @JsonKey(name: 'transactionId', defaultValue: '')
  final String transactionId;
  @override
  @JsonKey(name: 'bookingReference', defaultValue: '')
  final String bookingReference;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  final String paymentAmount;
  @override
  @JsonKey(defaultValue: false)
  final bool showTicketDetails;

  @override
  String toString() {
    return 'BookedTicketDetailsDto(id: $id, numberOfTickets: $numberOfTickets, remainingAmount: $remainingAmount, eventTicketDetails: $eventTicketDetails, eventDetails: $eventDetails, paymentMethod: $paymentMethod, transactionId: $transactionId, bookingReference: $bookingReference, paymentAmount: $paymentAmount, showTicketDetails: $showTicketDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookedTicketDetailsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numberOfTickets, numberOfTickets) ||
                other.numberOfTickets == numberOfTickets) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            const DeepCollectionEquality()
                .equals(other.eventTicketDetails, eventTicketDetails) &&
            (identical(other.eventDetails, eventDetails) ||
                other.eventDetails == eventDetails) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.showTicketDetails, showTicketDetails) ||
                other.showTicketDetails == showTicketDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      numberOfTickets,
      remainingAmount,
      const DeepCollectionEquality().hash(eventTicketDetails),
      eventDetails,
      paymentMethod,
      transactionId,
      bookingReference,
      paymentAmount,
      showTicketDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookedTicketDetailsDtoImplCopyWith<_$BookedTicketDetailsDtoImpl>
      get copyWith => __$$BookedTicketDetailsDtoImplCopyWithImpl<
          _$BookedTicketDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookedTicketDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _BookedTicketDetailsDto implements BookedTicketDetailsDto {
  const factory _BookedTicketDetailsDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'numberOfTickets', defaultValue: 0)
      required final int numberOfTickets,
      @JsonKey(name: 'remainingAmount', defaultValue: 0)
      required final double remainingAmount,
      @JsonKey(name: 'ticketDetails', defaultValue: [])
      required final List<EventTicketDetailDto> eventTicketDetails,
      @JsonKey(name: 'event') required final EventDto eventDetails,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required final String paymentMethod,
      @JsonKey(name: 'transactionId', defaultValue: '')
      required final String transactionId,
      @JsonKey(name: 'bookingReference', defaultValue: '')
      required final String bookingReference,
      @JsonKey(name: 'paymentAmount', defaultValue: '')
      required final String paymentAmount,
      @JsonKey(defaultValue: false)
      required final bool showTicketDetails}) = _$BookedTicketDetailsDtoImpl;

  factory _BookedTicketDetailsDto.fromJson(Map<String, dynamic> json) =
      _$BookedTicketDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'numberOfTickets', defaultValue: 0)
  int get numberOfTickets;
  @override
  @JsonKey(name: 'remainingAmount', defaultValue: 0)
  double get remainingAmount;
  @override
  @JsonKey(name: 'ticketDetails', defaultValue: [])
  List<EventTicketDetailDto> get eventTicketDetails;
  @override
  @JsonKey(name: 'event')
  EventDto get eventDetails;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod;
  @override
  @JsonKey(name: 'transactionId', defaultValue: '')
  String get transactionId;
  @override
  @JsonKey(name: 'bookingReference', defaultValue: '')
  String get bookingReference;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  String get paymentAmount;
  @override
  @JsonKey(defaultValue: false)
  bool get showTicketDetails;
  @override
  @JsonKey(ignore: true)
  _$$BookedTicketDetailsDtoImplCopyWith<_$BookedTicketDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
