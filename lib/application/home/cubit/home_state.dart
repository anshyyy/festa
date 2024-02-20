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
    required PageController pageController,
    required int selectedImageIndex,
    required bool showLocationDialog,
    required List<Map<String, dynamic>> filterList,
    required List<String> selectedFilters,
    required List<Map<String, dynamic>> filterOptions,
    required List<Map<String, dynamic>> locationSuggestions,
    required LocationDto location,
    required EventRepository eventRepository,
  }) = _HomeState;

  factory HomeState.initial({required String serverUrl}) => HomeState(
      page: 1,
      noUse: false,
      hasMoreEvents: true,
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
      selectedImageIndex: 0,
      showLocationDialog: false,
      filterList: const [
        {
          'displayName': 'Sort',
          'name': 'sort',
          'values': [
            {'name': 'featured', 'displayName': 'Featured'},
            {'name': 'distance', 'displayName': 'Distance', 'value': 'ASC'},
            {
              'name': 'price_range_start',
              'displayName': 'Cost:Low to High',
              'value': 'ASC'
            },
            {
              'name': 'price_range_start',
              'displayName': 'Cost:High to Low',
              'value': 'DESC'
            },
            {'name': 'rating', 'displayName': 'Rating', 'value': 'DESC'}
          ]
        },
        {
          'displayName': 'Location',
          'name': 'range',
          'values': [
            {'name': 'range', 'displayName': 'Within 1km', 'value': 1000},
            {'name': 'range', 'displayName': '< 3km', 'value': 3000},
            {'name': 'range', 'displayName': '< 5km', 'value': 5000},
            {'name': 'range', 'displayName': 'Anywhere', 'value': 20000}
          ]
        },
        {
          'displayName': 'Dancefloor',
          'name': 'events.dance_floor',
          'values': [
            {
              'name': 'events.dance_floor',
              'displayName': 'Yes',
              'rule': 'eq',
              'value': true
            },
            {
              'name': 'events.dance_floor',
              'displayName': 'No',
              'rule': 'eq',
              'value': false
            },
            {'name': 'events.dance_floor', 'displayName': "Doesn't matter"}
          ]
        },
        {
          'displayName': 'Capacity',
          'name': 'events.capacity',
          'values': [
            {
              'name': 'events.capacity',
              'displayName': '50',
              'rule': 'lte',
              'value': 50
            },
            {
              'name': 'events.capacity',
              'displayName': '100',
              'rule': 'lte',
              'value': 100
            },
            {
              'name': 'events.capacity',
              'displayName': '200',
              'rule': 'lte',
              'value': 200
            },
            {
              'name': 'events.capacity',
              'displayName': '500',
              'rule': 'lte',
              'value': 500
            },
            {
              'name': 'events.capacity',
              'displayName': '1000',
              'rule': 'lte',
              'value': 1000
            },
            {'name': 'events.capacity', 'displayName': '>1000'}
          ]
        },
        {
          'displayName': 'Genre/Music',
          'name': 'music',
          'values': [
            {
              'displayName': 'Themed Parties',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 1
            },
            {
              'displayName': 'EDM',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 2
            },
            {
              'displayName': 'Rave Party',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 3
            },
            {
              'displayName': 'Live Music ',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 5
            },
            {
              'displayName': 'Rock Music',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 4
            },
            {
              'displayName': 'Bollywood Night',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 6
            },
            {
              'displayName': 'DJ Sets ',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 7
            }
          ]
        }
      ],
      selectedFilters: ['sort'],
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
      ]);
}
