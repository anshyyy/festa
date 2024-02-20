part of 'event_details_cubit.dart';

@freezed
class EventDetailsState with _$EventDetailsState {
  const factory EventDetailsState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required String apiBaseUrl,
    required EventRepository eventRepository,
    required EventDto? event,
  }) = _EventDetailsState;

  factory EventDetailsState.initial({
    required String apiBaseUrl,
  }) =>
      EventDetailsState(
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        apiBaseUrl: apiBaseUrl,
        eventRepository: IEventRepository(
          serverUrl: apiBaseUrl,
        ),
        event: null,
      );
}
