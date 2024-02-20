part of 'event_details_cubit.dart';

@freezed
class EventDetailsState with _$EventDetailsState {
  const factory EventDetailsState({
    required String apiBaseUrl,
    required EventRepository eventRepository,
  }) = _EventDetailsState;

  factory EventDetailsState.initial({
    required String apiBaseUrl,
  }) =>
      EventDetailsState(
          apiBaseUrl: apiBaseUrl,
          eventRepository: IEventRepository(
            serverUrl: apiBaseUrl,
          ),);
}
