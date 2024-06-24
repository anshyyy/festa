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
    required String eventDistance,
    required bool lsdExpanded,
    required bool ambExpanded,
    required bool fnbExpanded,
    required bool faqExpanded,
    required bool isEventLiked,
    required bool isOpenMapModal,
    required List<AvailableMap> mapsOptions,
    Coords? eventLocation,
  }) = _EventDetailsState;

  factory EventDetailsState.initial({
    required String apiBaseUrl,
    required String eventDistance,
  }) =>
      EventDetailsState(
        isLoading: false,
        mapsOptions: [],
        isOpenMapModal: false,
        isSuccess: false,
        isFailure: false,
        apiBaseUrl: apiBaseUrl,
        eventRepository: IEventRepository(
          serverUrl: apiBaseUrl,
        ),
        event: null,
        eventDistance: eventDistance,
        lsdExpanded: false,
        ambExpanded: false,
        fnbExpanded: false,
        faqExpanded: false,
        isEventLiked: false,
      );
}
