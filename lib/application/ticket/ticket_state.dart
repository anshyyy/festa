part of 'ticket_cubit.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required bool showTicketDetails,
    required bool showTicketHistory,
    required UserRepository userRepository,
    UserTicketsDto? userTickets,
    required int currentPage,
  }) = _TicketState;
  factory TicketState.initial({
    required String serverUrl,
  }) =>  TicketState(
    noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        showTicketDetails: false,
        showTicketHistory: false,
        userRepository: IUserRepository(serverUrl: serverUrl),
        currentPage: 0,
      );
}

