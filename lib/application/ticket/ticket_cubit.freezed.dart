// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get isCoverLoading => throw _privateConstructorUsedError;
  bool get isAddCoverLoading => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get showTicketDetails => throw _privateConstructorUsedError;
  bool get showTicketHistory => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  Razorpay get razorpay => throw _privateConstructorUsedError;
  String get razorPayApiKey => throw _privateConstructorUsedError;
  UserTicketsDto? get userTickets => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isPaymentSuccess => throw _privateConstructorUsedError;
  bool get isPaymentFailure => throw _privateConstructorUsedError;
  bool get isPaymentPending => throw _privateConstructorUsedError;
  WidgetsToImageController get widgetsToImageController =>
      throw _privateConstructorUsedError;
  bool get isShareEnabled => throw _privateConstructorUsedError;
  BookedTicketDetailsDto? get historyTicket =>
      throw _privateConstructorUsedError;
  bool get shoHistoryTicketDetails => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  CoverChargeDetails? get coverChargeDetails =>
      throw _privateConstructorUsedError;
  List<CoverBalanceHistoryDto> get coverHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketStateCopyWith<TicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
          TicketState value, $Res Function(TicketState) then) =
      _$TicketStateCopyWithImpl<$Res, TicketState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool isCoverLoading,
      bool isAddCoverLoading,
      bool noUse,
      bool showTicketDetails,
      bool showTicketHistory,
      UserRepository userRepository,
      Razorpay razorpay,
      String razorPayApiKey,
      UserTicketsDto? userTickets,
      int currentPage,
      bool isPaymentSuccess,
      bool isPaymentFailure,
      bool isPaymentPending,
      WidgetsToImageController widgetsToImageController,
      bool isShareEnabled,
      BookedTicketDetailsDto? historyTicket,
      bool shoHistoryTicketDetails,
      EventRepository eventRepository,
      CoverChargeDetails? coverChargeDetails,
      List<CoverBalanceHistoryDto> coverHistory});

  $UserTicketsDtoCopyWith<$Res>? get userTickets;
  $BookedTicketDetailsDtoCopyWith<$Res>? get historyTicket;
  $CoverChargeDetailsCopyWith<$Res>? get coverChargeDetails;
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

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
    Object? isCoverLoading = null,
    Object? isAddCoverLoading = null,
    Object? noUse = null,
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
    Object? userRepository = null,
    Object? razorpay = null,
    Object? razorPayApiKey = null,
    Object? userTickets = freezed,
    Object? currentPage = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentFailure = null,
    Object? isPaymentPending = null,
    Object? widgetsToImageController = null,
    Object? isShareEnabled = null,
    Object? historyTicket = freezed,
    Object? shoHistoryTicketDetails = null,
    Object? eventRepository = null,
    Object? coverChargeDetails = freezed,
    Object? coverHistory = null,
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
      isCoverLoading: null == isCoverLoading
          ? _value.isCoverLoading
          : isCoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddCoverLoading: null == isAddCoverLoading
          ? _value.isAddCoverLoading
          : isAddCoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      razorpay: null == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay,
      razorPayApiKey: null == razorPayApiKey
          ? _value.razorPayApiKey
          : razorPayApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      userTickets: freezed == userTickets
          ? _value.userTickets
          : userTickets // ignore: cast_nullable_to_non_nullable
              as UserTicketsDto?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
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
      widgetsToImageController: null == widgetsToImageController
          ? _value.widgetsToImageController
          : widgetsToImageController // ignore: cast_nullable_to_non_nullable
              as WidgetsToImageController,
      isShareEnabled: null == isShareEnabled
          ? _value.isShareEnabled
          : isShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      historyTicket: freezed == historyTicket
          ? _value.historyTicket
          : historyTicket // ignore: cast_nullable_to_non_nullable
              as BookedTicketDetailsDto?,
      shoHistoryTicketDetails: null == shoHistoryTicketDetails
          ? _value.shoHistoryTicketDetails
          : shoHistoryTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      coverChargeDetails: freezed == coverChargeDetails
          ? _value.coverChargeDetails
          : coverChargeDetails // ignore: cast_nullable_to_non_nullable
              as CoverChargeDetails?,
      coverHistory: null == coverHistory
          ? _value.coverHistory
          : coverHistory // ignore: cast_nullable_to_non_nullable
              as List<CoverBalanceHistoryDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTicketsDtoCopyWith<$Res>? get userTickets {
    if (_value.userTickets == null) {
      return null;
    }

    return $UserTicketsDtoCopyWith<$Res>(_value.userTickets!, (value) {
      return _then(_value.copyWith(userTickets: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BookedTicketDetailsDtoCopyWith<$Res>? get historyTicket {
    if (_value.historyTicket == null) {
      return null;
    }

    return $BookedTicketDetailsDtoCopyWith<$Res>(_value.historyTicket!,
        (value) {
      return _then(_value.copyWith(historyTicket: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CoverChargeDetailsCopyWith<$Res>? get coverChargeDetails {
    if (_value.coverChargeDetails == null) {
      return null;
    }

    return $CoverChargeDetailsCopyWith<$Res>(_value.coverChargeDetails!,
        (value) {
      return _then(_value.copyWith(coverChargeDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketStateImplCopyWith<$Res>
    implements $TicketStateCopyWith<$Res> {
  factory _$$TicketStateImplCopyWith(
          _$TicketStateImpl value, $Res Function(_$TicketStateImpl) then) =
      __$$TicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool isCoverLoading,
      bool isAddCoverLoading,
      bool noUse,
      bool showTicketDetails,
      bool showTicketHistory,
      UserRepository userRepository,
      Razorpay razorpay,
      String razorPayApiKey,
      UserTicketsDto? userTickets,
      int currentPage,
      bool isPaymentSuccess,
      bool isPaymentFailure,
      bool isPaymentPending,
      WidgetsToImageController widgetsToImageController,
      bool isShareEnabled,
      BookedTicketDetailsDto? historyTicket,
      bool shoHistoryTicketDetails,
      EventRepository eventRepository,
      CoverChargeDetails? coverChargeDetails,
      List<CoverBalanceHistoryDto> coverHistory});

  @override
  $UserTicketsDtoCopyWith<$Res>? get userTickets;
  @override
  $BookedTicketDetailsDtoCopyWith<$Res>? get historyTicket;
  @override
  $CoverChargeDetailsCopyWith<$Res>? get coverChargeDetails;
}

/// @nodoc
class __$$TicketStateImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateImpl>
    implements _$$TicketStateImplCopyWith<$Res> {
  __$$TicketStateImplCopyWithImpl(
      _$TicketStateImpl _value, $Res Function(_$TicketStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? isCoverLoading = null,
    Object? isAddCoverLoading = null,
    Object? noUse = null,
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
    Object? userRepository = null,
    Object? razorpay = null,
    Object? razorPayApiKey = null,
    Object? userTickets = freezed,
    Object? currentPage = null,
    Object? isPaymentSuccess = null,
    Object? isPaymentFailure = null,
    Object? isPaymentPending = null,
    Object? widgetsToImageController = null,
    Object? isShareEnabled = null,
    Object? historyTicket = freezed,
    Object? shoHistoryTicketDetails = null,
    Object? eventRepository = null,
    Object? coverChargeDetails = freezed,
    Object? coverHistory = null,
  }) {
    return _then(_$TicketStateImpl(
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
      isCoverLoading: null == isCoverLoading
          ? _value.isCoverLoading
          : isCoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddCoverLoading: null == isAddCoverLoading
          ? _value.isAddCoverLoading
          : isAddCoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      razorpay: null == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay,
      razorPayApiKey: null == razorPayApiKey
          ? _value.razorPayApiKey
          : razorPayApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      userTickets: freezed == userTickets
          ? _value.userTickets
          : userTickets // ignore: cast_nullable_to_non_nullable
              as UserTicketsDto?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
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
      widgetsToImageController: null == widgetsToImageController
          ? _value.widgetsToImageController
          : widgetsToImageController // ignore: cast_nullable_to_non_nullable
              as WidgetsToImageController,
      isShareEnabled: null == isShareEnabled
          ? _value.isShareEnabled
          : isShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      historyTicket: freezed == historyTicket
          ? _value.historyTicket
          : historyTicket // ignore: cast_nullable_to_non_nullable
              as BookedTicketDetailsDto?,
      shoHistoryTicketDetails: null == shoHistoryTicketDetails
          ? _value.shoHistoryTicketDetails
          : shoHistoryTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      coverChargeDetails: freezed == coverChargeDetails
          ? _value.coverChargeDetails
          : coverChargeDetails // ignore: cast_nullable_to_non_nullable
              as CoverChargeDetails?,
      coverHistory: null == coverHistory
          ? _value._coverHistory
          : coverHistory // ignore: cast_nullable_to_non_nullable
              as List<CoverBalanceHistoryDto>,
    ));
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.isCoverLoading,
      required this.isAddCoverLoading,
      required this.noUse,
      required this.showTicketDetails,
      required this.showTicketHistory,
      required this.userRepository,
      required this.razorpay,
      required this.razorPayApiKey,
      this.userTickets,
      required this.currentPage,
      required this.isPaymentSuccess,
      required this.isPaymentFailure,
      required this.isPaymentPending,
      required this.widgetsToImageController,
      required this.isShareEnabled,
      this.historyTicket,
      required this.shoHistoryTicketDetails,
      required this.eventRepository,
      this.coverChargeDetails,
      required final List<CoverBalanceHistoryDto> coverHistory})
      : _coverHistory = coverHistory;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool isCoverLoading;
  @override
  final bool isAddCoverLoading;
  @override
  final bool noUse;
  @override
  final bool showTicketDetails;
  @override
  final bool showTicketHistory;
  @override
  final UserRepository userRepository;
  @override
  final Razorpay razorpay;
  @override
  final String razorPayApiKey;
  @override
  final UserTicketsDto? userTickets;
  @override
  final int currentPage;
  @override
  final bool isPaymentSuccess;
  @override
  final bool isPaymentFailure;
  @override
  final bool isPaymentPending;
  @override
  final WidgetsToImageController widgetsToImageController;
  @override
  final bool isShareEnabled;
  @override
  final BookedTicketDetailsDto? historyTicket;
  @override
  final bool shoHistoryTicketDetails;
  @override
  final EventRepository eventRepository;
  @override
  final CoverChargeDetails? coverChargeDetails;
  final List<CoverBalanceHistoryDto> _coverHistory;
  @override
  List<CoverBalanceHistoryDto> get coverHistory {
    if (_coverHistory is EqualUnmodifiableListView) return _coverHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coverHistory);
  }

  @override
  String toString() {
    return 'TicketState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, isCoverLoading: $isCoverLoading, isAddCoverLoading: $isAddCoverLoading, noUse: $noUse, showTicketDetails: $showTicketDetails, showTicketHistory: $showTicketHistory, userRepository: $userRepository, razorpay: $razorpay, razorPayApiKey: $razorPayApiKey, userTickets: $userTickets, currentPage: $currentPage, isPaymentSuccess: $isPaymentSuccess, isPaymentFailure: $isPaymentFailure, isPaymentPending: $isPaymentPending, widgetsToImageController: $widgetsToImageController, isShareEnabled: $isShareEnabled, historyTicket: $historyTicket, shoHistoryTicketDetails: $shoHistoryTicketDetails, eventRepository: $eventRepository, coverChargeDetails: $coverChargeDetails, coverHistory: $coverHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.isCoverLoading, isCoverLoading) ||
                other.isCoverLoading == isCoverLoading) &&
            (identical(other.isAddCoverLoading, isAddCoverLoading) ||
                other.isAddCoverLoading == isAddCoverLoading) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.showTicketDetails, showTicketDetails) ||
                other.showTicketDetails == showTicketDetails) &&
            (identical(other.showTicketHistory, showTicketHistory) ||
                other.showTicketHistory == showTicketHistory) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.razorpay, razorpay) ||
                other.razorpay == razorpay) &&
            (identical(other.razorPayApiKey, razorPayApiKey) ||
                other.razorPayApiKey == razorPayApiKey) &&
            (identical(other.userTickets, userTickets) ||
                other.userTickets == userTickets) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isPaymentSuccess, isPaymentSuccess) ||
                other.isPaymentSuccess == isPaymentSuccess) &&
            (identical(other.isPaymentFailure, isPaymentFailure) ||
                other.isPaymentFailure == isPaymentFailure) &&
            (identical(other.isPaymentPending, isPaymentPending) ||
                other.isPaymentPending == isPaymentPending) &&
            (identical(
                    other.widgetsToImageController, widgetsToImageController) ||
                other.widgetsToImageController == widgetsToImageController) &&
            (identical(other.isShareEnabled, isShareEnabled) ||
                other.isShareEnabled == isShareEnabled) &&
            (identical(other.historyTicket, historyTicket) ||
                other.historyTicket == historyTicket) &&
            (identical(
                    other.shoHistoryTicketDetails, shoHistoryTicketDetails) ||
                other.shoHistoryTicketDetails == shoHistoryTicketDetails) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.coverChargeDetails, coverChargeDetails) ||
                other.coverChargeDetails == coverChargeDetails) &&
            const DeepCollectionEquality()
                .equals(other._coverHistory, _coverHistory));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isSuccess,
        isFailure,
        isCoverLoading,
        isAddCoverLoading,
        noUse,
        showTicketDetails,
        showTicketHistory,
        userRepository,
        razorpay,
        razorPayApiKey,
        userTickets,
        currentPage,
        isPaymentSuccess,
        isPaymentFailure,
        isPaymentPending,
        widgetsToImageController,
        isShareEnabled,
        historyTicket,
        shoHistoryTicketDetails,
        eventRepository,
        coverChargeDetails,
        const DeepCollectionEquality().hash(_coverHistory)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState(
          {required final bool isLoading,
          required final bool isSuccess,
          required final bool isFailure,
          required final bool isCoverLoading,
          required final bool isAddCoverLoading,
          required final bool noUse,
          required final bool showTicketDetails,
          required final bool showTicketHistory,
          required final UserRepository userRepository,
          required final Razorpay razorpay,
          required final String razorPayApiKey,
          final UserTicketsDto? userTickets,
          required final int currentPage,
          required final bool isPaymentSuccess,
          required final bool isPaymentFailure,
          required final bool isPaymentPending,
          required final WidgetsToImageController widgetsToImageController,
          required final bool isShareEnabled,
          final BookedTicketDetailsDto? historyTicket,
          required final bool shoHistoryTicketDetails,
          required final EventRepository eventRepository,
          final CoverChargeDetails? coverChargeDetails,
          required final List<CoverBalanceHistoryDto> coverHistory}) =
      _$TicketStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get isCoverLoading;
  @override
  bool get isAddCoverLoading;
  @override
  bool get noUse;
  @override
  bool get showTicketDetails;
  @override
  bool get showTicketHistory;
  @override
  UserRepository get userRepository;
  @override
  Razorpay get razorpay;
  @override
  String get razorPayApiKey;
  @override
  UserTicketsDto? get userTickets;
  @override
  int get currentPage;
  @override
  bool get isPaymentSuccess;
  @override
  bool get isPaymentFailure;
  @override
  bool get isPaymentPending;
  @override
  WidgetsToImageController get widgetsToImageController;
  @override
  bool get isShareEnabled;
  @override
  BookedTicketDetailsDto? get historyTicket;
  @override
  bool get shoHistoryTicketDetails;
  @override
  EventRepository get eventRepository;
  @override
  CoverChargeDetails? get coverChargeDetails;
  @override
  List<CoverBalanceHistoryDto> get coverHistory;
  @override
  @JsonKey(ignore: true)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
