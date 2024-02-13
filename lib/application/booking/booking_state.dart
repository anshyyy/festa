part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required int standardTicketCount,
    required int earlyBirdTicketCount,
  })= $BookingState;
  
  factory BookingState.initial() => const BookingState(standardTicketCount: 0, earlyBirdTicketCount: 0);
}
