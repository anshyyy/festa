part of 'home_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool hasMoreEvents,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    FilterDto? categoryFilter,
    required int page,
    required List<EventDto> events,
    required List<FilterDto> filters,
    required List<Map<String, dynamic>> exploreList,
    required List<Map<String, dynamic>> mainExploreList,
    required PageController pageController,
    required bool showLocationDialog,
    required List<Map<String, dynamic>> filterOptions,
    required List<Map<String, dynamic>> locationSuggestions,
    required LocationDto location,
    required EventRepository eventRepository,
    required ScrollController scrollController,
    required String sortDisplayName,
    required bool sortDropdownOpen,
    required GlobalKey sortKey,
    required Offset chipPosition,
    OverlayEntry? overlayEntry,
    required bool isSearchOpen,
    required bool isSearchChanged,
    required bool isLocationSearchChanged,
    required bool noFilteredEvents,
    required bool noLocatedEvents,
    required LocationRepository locationRepository,
    required List<SuggestionDto> suggestions,
    required AppStateNotifier appStateNotifier,
  }) = _HomeState;

  factory HomeState.initial(
          {required AppStateNotifier appStateNotifier ,required String serverUrl, required String mapsApiKey}) =>
      HomeState(
        page: 1,
        noUse: false,
        hasMoreEvents: true,
        scrollController: ScrollController(),
        filters: [],
        events: [],
        eventRepository: IEventRepository(
          serverUrl: serverUrl,
        ),
        isLoading: true,
        isFailed: false,
        isSuccessful: false,
        location: OtherConstants.defaultLocation,
        pageController: PageController(),
        mainExploreList: [
          {
            'id': 'filter',
            'isSelected': false,
            'identifier': AppConstants.filterKey,
            'svgIcon': AssetConstants.filterIcon,
            'label': 'Filter',
          },
          {
            'id': 'sort',
            'isSelected': false,
            'identifier': AppConstants.otherKey,
            'svgIcon': AssetConstants.arrowDown,
            'label': 'Sort',
          },
        ],
        exploreList: [
          {
            'id': 'filter',
            'isSelected': false,
            'identifier': AppConstants.filterKey,
            'svgIcon': AssetConstants.filterIcon,
            'label': 'Filter',
          },
          {
            'id': 'sort',
            'isSelected': false,
            'identifier': AppConstants.otherKey,
            'svgIcon': AssetConstants.arrowDown,
            'label': 'Sort',
          },
        ],
        showLocationDialog: false,
        filterOptions: [],
        locationSuggestions: [
          {
            'name': 'Mumbai',
            'image':
                'https://images.unsplash.com/photo-1529253355930-ddbe423a2ac7?q=80&w=2665&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            'name': 'Delhi',
            'image':
                'https://images.unsplash.com/photo-1587474260584-136574528ed5?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            'name': 'Bangalore',
            'image':
                'https://images.unsplash.com/photo-1637540485660-93031d90b97b?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            'name': 'Japan',
            'image':
                'https://images.unsplash.com/photo-1544808208-727498b3df07?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            'name': 'Up',
            'image':
                'https://images.unsplash.com/photo-1701749740828-c068fa546d3e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
        ],
        sortDisplayName: 'Sort',
        sortDropdownOpen: false,
        sortKey: GlobalKey(),
        chipPosition: Offset.zero,
        isSearchOpen: false,
        isSearchChanged: false,
        isLocationSearchChanged: false,
        noFilteredEvents: false,
        noLocatedEvents: false,
        locationRepository: ILocationRepository(
          mapsApiKey: mapsApiKey,
        ),
        suggestions: [],
        appStateNotifier: appStateNotifier,
      );
}
