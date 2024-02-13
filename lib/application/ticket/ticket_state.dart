part of 'ticket_cubit.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    required bool showTicketDetails,
    required bool showTicketHistory,
  }) = _TicketState;
  factory TicketState.initial() => const TicketState(
        showTicketDetails: false,
        showTicketHistory: false,
      );
}
