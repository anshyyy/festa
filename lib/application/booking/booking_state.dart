part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required int standardTicketCount,
    required int earlyBirdTicketCount,
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required String maxLimitMessage,
    required bool isCouponLoading,
    required bool isCouponFailed,
    required int tabsTobeCreated,
    required bool isCouponSuccess,
    required String couponCode,
    required bool noUse,
    TicketDto? tickets,
    required List<String>tabNames,
    required List<int> nonEmptyIndexes,
    required int selectedTab,
    required EventRepository eventRepository,
    EventDto? event,
    CouponDTO? coupon,
    required TextEditingController discountController,
    required List<List<EventTicketDto>> ticketLists,
    required double totalPrice,
    required double priceAfterCouponApplied,
    required bool isBookingEnabled,
    EventBookingDetailsDto? bookingDetails,
    required bool isBookingSuccess,
    required bool isBookingFailure,
   
  }) = $BookingState;

  factory BookingState.initial({
    required String serverUrl,
  }) =>
      BookingState(
        tabNames: ['Entry', 'Cover', 'Entry+Cover'],
        ticketLists: [],
        nonEmptyIndexes: [],
        standardTicketCount: 0,
        selectedTab: 0,
        earlyBirdTicketCount: 0,
        tabsTobeCreated:0,
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        couponCode: '',
        eventRepository: IEventRepository(serverUrl: serverUrl),
        totalPrice: 0,
        priceAfterCouponApplied: 0,
        isBookingEnabled: false,
        isBookingFailure: false,
        isBookingSuccess: false,
        isCouponFailed: false,
        maxLimitMessage: '',
        isCouponLoading: false,
        isCouponSuccess: false,
        discountController: TextEditingController(),
      );
}
