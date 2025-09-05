part of 'payment_status_cubit.dart';

@freezed
class PaymentStatusState with _$PaymentStatusState {
   const factory PaymentStatusState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required int eventId,
    required int numberOfTickets,
    required bool isPaymentSuccess,
    required bool isPaymentPending,
    required EventRepository eventRepository,
    required double totalAmount,
    double? coverAmount,
    EventDto? event,
  }) = _PaymentStatusState;

  factory PaymentStatusState.initial({
    required String serverUrl,
    required int eventId,
    required int numberOfTickets,
    required bool isPaymentSuccess,
    required double totalAmount,
    required bool isPaymentPending,
    double? coverAmount,
  }) =>  PaymentStatusState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        eventId: eventId,
        coverAmount: coverAmount,
        eventRepository: IEventRepository(serverUrl: serverUrl),
        isPaymentSuccess: isPaymentSuccess,
        numberOfTickets: numberOfTickets,
        totalAmount: totalAmount,
        isPaymentPending:isPaymentPending,
      );
}
