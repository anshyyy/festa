part of 'event_options_cubit.dart';

@freezed
class EventOptionsState with _$EventOptionsState {
  const factory EventOptionsState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required int eventId,
    EventDto? event,
    required EventRepository eventRepository,
  }) = _EventOptionsState;

  factory EventOptionsState.initial({
    required int eventId,
    required String serverUrl,
  }) => EventOptionsState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        eventId: eventId,
        eventRepository: IEventRepository(serverUrl: serverUrl),
      );
}
