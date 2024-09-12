part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required int standardTicketCount,
    required int earlyBirdTicketCount,
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,

    required bool isCouponLoading,
    required bool isCouponFailed,
    required bool isCouponSuccess,

    required String couponCode,

    required bool noUse,
    required EventRepository eventRepository,
    EventDto? event,
    CouponDTO? coupon,
    required TextEditingController discountController,
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
        standardTicketCount: 0,
        earlyBirdTicketCount: 0,
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
        isCouponLoading: false,
        isCouponSuccess: false,
        discountController: TextEditingController(),
      );
}
