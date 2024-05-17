part of 'event_options_cubit.dart';

@freezed
class EventOptionsState with _$EventOptionsState {
  const factory EventOptionsState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required bool goToHome,
    required int eventId,
    EventDto? event,
    required EventRepository eventRepository,
    required UserRepository userRepository,
  }) = _EventOptionsState;

  factory EventOptionsState.initial({
    required int eventId,
    required String serverUrl,
  }) => EventOptionsState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        goToHome: false,
        eventId: eventId,
        userRepository: IUserRepository(serverUrl: serverUrl),
        eventRepository: IEventRepository(serverUrl: serverUrl),
      );
}
