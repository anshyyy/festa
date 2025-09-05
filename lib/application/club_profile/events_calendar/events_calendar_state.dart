part of 'events_calendar_cubit.dart';

@freezed
class EventsCalendarState with _$EventsCalendarState {
  const factory EventsCalendarState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int clubId,
    required List<Map<String, dynamic>> filter,
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
        filter: [
          {
            'id': 'all_events',
            'isSelected': false,
            'identifier': null,
            'svgIcon': null,
            'label': 'All Events',
          },
          {
            'id': 'calender',
            'isSelected': false,
            'identifier': null,
            'svgIcon': AssetConstants.calender,
            'label': 'Calender',
          }
        ],
        pubRepository: IPubRepository(
          serverUrl: serverUrl,
        ),
      );
}
