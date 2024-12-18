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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingState {
  int get standardTicketCount => throw _privateConstructorUsedError;
  int get earlyBirdTicketCount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  String get maxLimitMessage => throw _privateConstructorUsedError;
  bool get isCouponLoading => throw _privateConstructorUsedError;
  bool get isCouponFailed => throw _privateConstructorUsedError;
  int get tabsTobeCreated => throw _privateConstructorUsedError;
  bool get isCouponSuccess => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  TicketDto? get tickets => throw _privateConstructorUsedError;
  List<String> get tabNames => throw _privateConstructorUsedError;
  List<int> get nonEmptyIndexes => throw _privateConstructorUsedError;
  int get selectedTab => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;
  CouponDTO? get coupon => throw _privateConstructorUsedError;
  TextEditingController get discountController =>
      throw _privateConstructorUsedError;
  List<List<EventTicketDto>> get ticketLists =>
      throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get priceAfterCouponApplied => throw _privateConstructorUsedError;
  bool get isBookingEnabled => throw _privateConstructorUsedError;
  EventBookingDetailsDto? get bookingDetails =>
      throw _privateConstructorUsedError;
  bool get isBookingSuccess => throw _privateConstructorUsedError;
  bool get isBookingFailure => throw _privateConstructorUsedError;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String maxLimitMessage,
      bool isCouponLoading,
      bool isCouponFailed,
      int tabsTobeCreated,
      bool isCouponSuccess,
      String couponCode,
      bool noUse,
      TicketDto? tickets,
      List<String> tabNames,
      List<int> nonEmptyIndexes,
      int selectedTab,
      EventRepository eventRepository,
      EventDto? event,
      CouponDTO? coupon,
      TextEditingController discountController,
      List<List<EventTicketDto>> ticketLists,
      double totalPrice,
      double priceAfterCouponApplied,
      bool isBookingEnabled,
      EventBookingDetailsDto? bookingDetails,
      bool isBookingSuccess,
      bool isBookingFailure});

  $TicketDtoCopyWith<$Res>? get tickets;
  $EventDtoCopyWith<$Res>? get event;
  $CouponDTOCopyWith<$Res>? get coupon;
  $EventBookingDetailsDtoCopyWith<$Res>? get bookingDetails;
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardTicketCount = null,
    Object? earlyBirdTicketCount = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? maxLimitMessage = null,
    Object? isCouponLoading = null,
    Object? isCouponFailed = null,
    Object? tabsTobeCreated = null,
    Object? isCouponSuccess = null,
    Object? couponCode = null,
    Object? noUse = null,
    Object? tickets = freezed,
    Object? tabNames = null,
    Object? nonEmptyIndexes = null,
    Object? selectedTab = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? coupon = freezed,
    Object? discountController = null,
    Object? ticketLists = null,
    Object? totalPrice = null,
    Object? priceAfterCouponApplied = null,
    Object? isBookingEnabled = null,
    Object? bookingDetails = freezed,
    Object? isBookingSuccess = null,
    Object? isBookingFailure = null,
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
      maxLimitMessage: null == maxLimitMessage
          ? _value.maxLimitMessage
          : maxLimitMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isCouponLoading: null == isCouponLoading
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponFailed: null == isCouponFailed
          ? _value.isCouponFailed
          : isCouponFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      tabsTobeCreated: null == tabsTobeCreated
          ? _value.tabsTobeCreated
          : tabsTobeCreated // ignore: cast_nullable_to_non_nullable
              as int,
      isCouponSuccess: null == isCouponSuccess
          ? _value.isCouponSuccess
          : isCouponSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      tickets: freezed == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as TicketDto?,
      tabNames: null == tabNames
          ? _value.tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonEmptyIndexes: null == nonEmptyIndexes
          ? _value.nonEmptyIndexes
          : nonEmptyIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CouponDTO?,
      discountController: null == discountController
          ? _value.discountController
          : discountController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      ticketLists: null == ticketLists
          ? _value.ticketLists
          : ticketLists // ignore: cast_nullable_to_non_nullable
              as List<List<EventTicketDto>>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceAfterCouponApplied: null == priceAfterCouponApplied
          ? _value.priceAfterCouponApplied
          : priceAfterCouponApplied // ignore: cast_nullable_to_non_nullable
              as double,
      isBookingEnabled: null == isBookingEnabled
          ? _value.isBookingEnabled
          : isBookingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingDetails: freezed == bookingDetails
          ? _value.bookingDetails
          : bookingDetails // ignore: cast_nullable_to_non_nullable
              as EventBookingDetailsDto?,
      isBookingSuccess: null == isBookingSuccess
          ? _value.isBookingSuccess
          : isBookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookingFailure: null == isBookingFailure
          ? _value.isBookingFailure
          : isBookingFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketDtoCopyWith<$Res>? get tickets {
    if (_value.tickets == null) {
      return null;
    }

    return $TicketDtoCopyWith<$Res>(_value.tickets!, (value) {
      return _then(_value.copyWith(tickets: value) as $Val);
    });
  }

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponDTOCopyWith<$Res>? get coupon {
    if (_value.coupon == null) {
      return null;
    }

    return $CouponDTOCopyWith<$Res>(_value.coupon!, (value) {
      return _then(_value.copyWith(coupon: value) as $Val);
    });
  }

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventBookingDetailsDtoCopyWith<$Res>? get bookingDetails {
    if (_value.bookingDetails == null) {
      return null;
    }

    return $EventBookingDetailsDtoCopyWith<$Res>(_value.bookingDetails!,
        (value) {
      return _then(_value.copyWith(bookingDetails: value) as $Val);
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
      String maxLimitMessage,
      bool isCouponLoading,
      bool isCouponFailed,
      int tabsTobeCreated,
      bool isCouponSuccess,
      String couponCode,
      bool noUse,
      TicketDto? tickets,
      List<String> tabNames,
      List<int> nonEmptyIndexes,
      int selectedTab,
      EventRepository eventRepository,
      EventDto? event,
      CouponDTO? coupon,
      TextEditingController discountController,
      List<List<EventTicketDto>> ticketLists,
      double totalPrice,
      double priceAfterCouponApplied,
      bool isBookingEnabled,
      EventBookingDetailsDto? bookingDetails,
      bool isBookingSuccess,
      bool isBookingFailure});

  @override
  $TicketDtoCopyWith<$Res>? get tickets;
  @override
  $EventDtoCopyWith<$Res>? get event;
  @override
  $CouponDTOCopyWith<$Res>? get coupon;
  @override
  $EventBookingDetailsDtoCopyWith<$Res>? get bookingDetails;
}

/// @nodoc
class __$$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$$BookingStateImpl>
    implements _$$$BookingStateImplCopyWith<$Res> {
  __$$$BookingStateImplCopyWithImpl(
      _$$BookingStateImpl _value, $Res Function(_$$BookingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardTicketCount = null,
    Object? earlyBirdTicketCount = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? maxLimitMessage = null,
    Object? isCouponLoading = null,
    Object? isCouponFailed = null,
    Object? tabsTobeCreated = null,
    Object? isCouponSuccess = null,
    Object? couponCode = null,
    Object? noUse = null,
    Object? tickets = freezed,
    Object? tabNames = null,
    Object? nonEmptyIndexes = null,
    Object? selectedTab = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? coupon = freezed,
    Object? discountController = null,
    Object? ticketLists = null,
    Object? totalPrice = null,
    Object? priceAfterCouponApplied = null,
    Object? isBookingEnabled = null,
    Object? bookingDetails = freezed,
    Object? isBookingSuccess = null,
    Object? isBookingFailure = null,
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
      maxLimitMessage: null == maxLimitMessage
          ? _value.maxLimitMessage
          : maxLimitMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isCouponLoading: null == isCouponLoading
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponFailed: null == isCouponFailed
          ? _value.isCouponFailed
          : isCouponFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      tabsTobeCreated: null == tabsTobeCreated
          ? _value.tabsTobeCreated
          : tabsTobeCreated // ignore: cast_nullable_to_non_nullable
              as int,
      isCouponSuccess: null == isCouponSuccess
          ? _value.isCouponSuccess
          : isCouponSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      tickets: freezed == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as TicketDto?,
      tabNames: null == tabNames
          ? _value._tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonEmptyIndexes: null == nonEmptyIndexes
          ? _value._nonEmptyIndexes
          : nonEmptyIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CouponDTO?,
      discountController: null == discountController
          ? _value.discountController
          : discountController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      ticketLists: null == ticketLists
          ? _value._ticketLists
          : ticketLists // ignore: cast_nullable_to_non_nullable
              as List<List<EventTicketDto>>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceAfterCouponApplied: null == priceAfterCouponApplied
          ? _value.priceAfterCouponApplied
          : priceAfterCouponApplied // ignore: cast_nullable_to_non_nullable
              as double,
      isBookingEnabled: null == isBookingEnabled
          ? _value.isBookingEnabled
          : isBookingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingDetails: freezed == bookingDetails
          ? _value.bookingDetails
          : bookingDetails // ignore: cast_nullable_to_non_nullable
              as EventBookingDetailsDto?,
      isBookingSuccess: null == isBookingSuccess
          ? _value.isBookingSuccess
          : isBookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookingFailure: null == isBookingFailure
          ? _value.isBookingFailure
          : isBookingFailure // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.maxLimitMessage,
      required this.isCouponLoading,
      required this.isCouponFailed,
      required this.tabsTobeCreated,
      required this.isCouponSuccess,
      required this.couponCode,
      required this.noUse,
      this.tickets,
      required final List<String> tabNames,
      required final List<int> nonEmptyIndexes,
      required this.selectedTab,
      required this.eventRepository,
      this.event,
      this.coupon,
      required this.discountController,
      required final List<List<EventTicketDto>> ticketLists,
      required this.totalPrice,
      required this.priceAfterCouponApplied,
      required this.isBookingEnabled,
      this.bookingDetails,
      required this.isBookingSuccess,
      required this.isBookingFailure})
      : _tabNames = tabNames,
        _nonEmptyIndexes = nonEmptyIndexes,
        _ticketLists = ticketLists;

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
  final String maxLimitMessage;
  @override
  final bool isCouponLoading;
  @override
  final bool isCouponFailed;
  @override
  final int tabsTobeCreated;
  @override
  final bool isCouponSuccess;
  @override
  final String couponCode;
  @override
  final bool noUse;
  @override
  final TicketDto? tickets;
  final List<String> _tabNames;
  @override
  List<String> get tabNames {
    if (_tabNames is EqualUnmodifiableListView) return _tabNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabNames);
  }

  final List<int> _nonEmptyIndexes;
  @override
  List<int> get nonEmptyIndexes {
    if (_nonEmptyIndexes is EqualUnmodifiableListView) return _nonEmptyIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonEmptyIndexes);
  }

  @override
  final int selectedTab;
  @override
  final EventRepository eventRepository;
  @override
  final EventDto? event;
  @override
  final CouponDTO? coupon;
  @override
  final TextEditingController discountController;
  final List<List<EventTicketDto>> _ticketLists;
  @override
  List<List<EventTicketDto>> get ticketLists {
    if (_ticketLists is EqualUnmodifiableListView) return _ticketLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ticketLists);
  }

  @override
  final double totalPrice;
  @override
  final double priceAfterCouponApplied;
  @override
  final bool isBookingEnabled;
  @override
  final EventBookingDetailsDto? bookingDetails;
  @override
  final bool isBookingSuccess;
  @override
  final bool isBookingFailure;

  @override
  String toString() {
    return 'BookingState(standardTicketCount: $standardTicketCount, earlyBirdTicketCount: $earlyBirdTicketCount, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, maxLimitMessage: $maxLimitMessage, isCouponLoading: $isCouponLoading, isCouponFailed: $isCouponFailed, tabsTobeCreated: $tabsTobeCreated, isCouponSuccess: $isCouponSuccess, couponCode: $couponCode, noUse: $noUse, tickets: $tickets, tabNames: $tabNames, nonEmptyIndexes: $nonEmptyIndexes, selectedTab: $selectedTab, eventRepository: $eventRepository, event: $event, coupon: $coupon, discountController: $discountController, ticketLists: $ticketLists, totalPrice: $totalPrice, priceAfterCouponApplied: $priceAfterCouponApplied, isBookingEnabled: $isBookingEnabled, bookingDetails: $bookingDetails, isBookingSuccess: $isBookingSuccess, isBookingFailure: $isBookingFailure)';
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
            (identical(other.maxLimitMessage, maxLimitMessage) ||
                other.maxLimitMessage == maxLimitMessage) &&
            (identical(other.isCouponLoading, isCouponLoading) ||
                other.isCouponLoading == isCouponLoading) &&
            (identical(other.isCouponFailed, isCouponFailed) ||
                other.isCouponFailed == isCouponFailed) &&
            (identical(other.tabsTobeCreated, tabsTobeCreated) ||
                other.tabsTobeCreated == tabsTobeCreated) &&
            (identical(other.isCouponSuccess, isCouponSuccess) ||
                other.isCouponSuccess == isCouponSuccess) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.tickets, tickets) || other.tickets == tickets) &&
            const DeepCollectionEquality().equals(other._tabNames, _tabNames) &&
            const DeepCollectionEquality()
                .equals(other._nonEmptyIndexes, _nonEmptyIndexes) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.discountController, discountController) ||
                other.discountController == discountController) &&
            const DeepCollectionEquality()
                .equals(other._ticketLists, _ticketLists) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(
                    other.priceAfterCouponApplied, priceAfterCouponApplied) ||
                other.priceAfterCouponApplied == priceAfterCouponApplied) &&
            (identical(other.isBookingEnabled, isBookingEnabled) ||
                other.isBookingEnabled == isBookingEnabled) &&
            (identical(other.bookingDetails, bookingDetails) ||
                other.bookingDetails == bookingDetails) &&
            (identical(other.isBookingSuccess, isBookingSuccess) ||
                other.isBookingSuccess == isBookingSuccess) &&
            (identical(other.isBookingFailure, isBookingFailure) ||
                other.isBookingFailure == isBookingFailure));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        standardTicketCount,
        earlyBirdTicketCount,
        isLoading,
        isSuccess,
        isFailure,
        maxLimitMessage,
        isCouponLoading,
        isCouponFailed,
        tabsTobeCreated,
        isCouponSuccess,
        couponCode,
        noUse,
        tickets,
        const DeepCollectionEquality().hash(_tabNames),
        const DeepCollectionEquality().hash(_nonEmptyIndexes),
        selectedTab,
        eventRepository,
        event,
        coupon,
        discountController,
        const DeepCollectionEquality().hash(_ticketLists),
        totalPrice,
        priceAfterCouponApplied,
        isBookingEnabled,
        bookingDetails,
        isBookingSuccess,
        isBookingFailure
      ]);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final String maxLimitMessage,
      required final bool isCouponLoading,
      required final bool isCouponFailed,
      required final int tabsTobeCreated,
      required final bool isCouponSuccess,
      required final String couponCode,
      required final bool noUse,
      final TicketDto? tickets,
      required final List<String> tabNames,
      required final List<int> nonEmptyIndexes,
      required final int selectedTab,
      required final EventRepository eventRepository,
      final EventDto? event,
      final CouponDTO? coupon,
      required final TextEditingController discountController,
      required final List<List<EventTicketDto>> ticketLists,
      required final double totalPrice,
      required final double priceAfterCouponApplied,
      required final bool isBookingEnabled,
      final EventBookingDetailsDto? bookingDetails,
      required final bool isBookingSuccess,
      required final bool isBookingFailure}) = _$$BookingStateImpl;

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
  String get maxLimitMessage;
  @override
  bool get isCouponLoading;
  @override
  bool get isCouponFailed;
  @override
  int get tabsTobeCreated;
  @override
  bool get isCouponSuccess;
  @override
  String get couponCode;
  @override
  bool get noUse;
  @override
  TicketDto? get tickets;
  @override
  List<String> get tabNames;
  @override
  List<int> get nonEmptyIndexes;
  @override
  int get selectedTab;
  @override
  EventRepository get eventRepository;
  @override
  EventDto? get event;
  @override
  CouponDTO? get coupon;
  @override
  TextEditingController get discountController;
  @override
  List<List<EventTicketDto>> get ticketLists;
  @override
  double get totalPrice;
  @override
  double get priceAfterCouponApplied;
  @override
  bool get isBookingEnabled;
  @override
  EventBookingDetailsDto? get bookingDetails;
  @override
  bool get isBookingSuccess;
  @override
  bool get isBookingFailure;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$BookingStateImplCopyWith<_$$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
