part of 'events_calendar_cubit.dart';

@freezed
class EventsCalendarState with _$EventsCalendarState {
  const factory EventsCalendarState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int clubId,
    required PubRepository pubRepository,
    PubEventsClubbedDto? pubEventsClubbed,
  }) = _EventsCalendarState;

  factory EventsCalendarState.initial({
    required int clubId,
    required String serverUrl,
  }) =>
      EventsCalendarState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        clubId: clubId,
        pubRepository: IPubRepository(
          serverUrl: serverUrl,
        ),
      );
}
