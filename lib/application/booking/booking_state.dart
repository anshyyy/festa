part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required int standardTicketCount,
    required int earlyBirdTicketCount,
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required EventRepository eventRepository,
    EventDto? event,
    required double totalPrice,
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
        eventRepository: IEventRepository(serverUrl: serverUrl),
        totalPrice: 0,
        isBookingEnabled: false,
        isBookingFailure: false,
        isBookingSuccess: false,
      );
}
