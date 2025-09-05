part of 'payment_details_cubit.dart';

@freezed
class PaymentDetailsState with _$PaymentDetailsState {
  const factory PaymentDetailsState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required EventBookingDetailsDto eventBookingDetails,
    required EventRepository eventRepository,
    EventDto? event,
    required Razorpay razorpay,
    required String razorPayApiKey,
    required bool isPaymentSuccess,
    required bool isPaymentFailure,
    required bool isPaymentPending,
    required double totalAmount,
    PaletteGenerator? palette,
    UserDto? user,
  }) = _PaymentDetailsState;

  factory PaymentDetailsState.initial({
    required EventBookingDetailsDto eventBookingDetails,
    required String serverUrl,
    required String razorPayApiKey,
    required UserDto user,
  }) => PaymentDetailsState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        eventBookingDetails: eventBookingDetails,
        eventRepository: IEventRepository(serverUrl: serverUrl),
        razorpay: Razorpay(),
        razorPayApiKey: razorPayApiKey,
        isPaymentFailure: false,
        isPaymentSuccess: false,
        isPaymentPending: false,
        totalAmount:0,
        user: user,
      );
}
