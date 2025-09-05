part of 'ticket_cubit.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool isCoverLoading,
    required bool isAddCoverLoading,
    required bool noUse,
    required bool showTicketDetails,
    required bool showTicketHistory,
    required UserRepository userRepository,
    required Razorpay razorpay,
    required String razorPayApiKey,
    UserTicketsDto? userTickets,
    required int currentPage,
    required bool isPaymentSuccess,
    required bool isPaymentFailure,
    required bool isPaymentPending,
    required WidgetsToImageController widgetsToImageController,
    required bool isShareEnabled,
    BookedTicketDetailsDto? historyTicket,
    required bool shoHistoryTicketDetails,
    required EventRepository eventRepository,
    CoverChargeDetails? coverChargeDetails,
    required List<CoverBalanceHistoryDto> coverHistory,
  }) = _TicketState;
  factory TicketState.initial({
    required String serverUrl,
    required String razorPayApiKey,
  }) =>
      TicketState(
          noUse: false,
          isLoading: false,
          isFailure: false,
          isAddCoverLoading: false,
          isCoverLoading: false,
          isSuccess: false,
          showTicketDetails: false,
          showTicketHistory: false,
          razorpay: Razorpay(),
          razorPayApiKey: razorPayApiKey,
          userRepository: IUserRepository(serverUrl: serverUrl),
          currentPage: 0,
          widgetsToImageController: WidgetsToImageController(),
          isShareEnabled: true,
          isPaymentFailure: false,
          isPaymentSuccess: false,
          isPaymentPending: false,
          shoHistoryTicketDetails: false,
          eventRepository: IEventRepository(serverUrl: serverUrl),
          coverHistory: []);
}
