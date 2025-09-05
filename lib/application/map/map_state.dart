part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState(
      {UserDto? user,
      required bool isLoading,
      required bool isSuccess,
      required bool isFailed,
      required LocationStorageService locationStorageService,
      required TextEditingController searchController,
      required MapController mapController,
      required EventRepository eventRepository,
      required List<EventCordinates> events,
      required LocationDto savedLocation,
      required List<Marker>eventMarkers,
      LatLng? selectedLocation}) = _MapState;
  factory MapState.initial(
          {required AppStateNotifier appStateNotifier,
          required String serverUrl,
          required String mapsApiKey}) =>
      MapState(
        isLoading: false,
        events: [],
        eventMarkers: [],
        eventRepository: IEventRepository(
          serverUrl: serverUrl,
        ),
        savedLocation:LocationDto(latitude: 17.40636, longitude: 78.46875, area: 'Hyderabad', city: 'Hyderabad', state: 'Hyderabad', country: 'India', icon: 'assets/vectors/hyderabad-icon.svg') ,
        locationStorageService: LocationStorageService(),
        searchController: TextEditingController(),
        mapController: MapController(),
        isFailed: false,
        isSuccess: false,
      );
}
