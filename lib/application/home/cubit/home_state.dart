part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<String> imageList,
    required List<Map<String, String>> categoriesList,
    required List<Map<String, dynamic>> exploreList,
    required PageController pageController,
    required int selectedImageIndex,
    required bool openFilterSheet,
    required List<Map<String, dynamic>> filterList,
    required List<String> selectedFilters,
    required List<Map<String, dynamic>> filterOptions,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        pageController: PageController(),
        imageList: [
          AssetConstants.techno,
          AssetConstants.bollywood,
          AssetConstants.ladiesNight,
          AssetConstants.edm,
          AssetConstants.themeNights,
          AssetConstants.punjabi,
          AssetConstants.telugu
        ],
        categoriesList: [
          {
            'title': 'Techno',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Bollywood',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Ladies night',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'EDM',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Theme nights',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Punjabi',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Telugu',
            'image':
                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
        ],
        exploreList: [
          {
            'identifier': AppConstants.filterKey,
            'svgIcon': AssetConstants.filterIcon,
            'label': 'Filter',
          },
          {
            'identifier': AppConstants.otherKey,
            'label': 'Today',
          },
          {
            'identifier': AppConstants.otherKey,
            'label': 'This weekend',
          },
          {
            'identifier': AppConstants.otherKey,
            'svgIcon': AssetConstants.arrowDown,
            'label': 'Sort',
          },
          {
            'identifier': AppConstants.otherKey,
            'label': 'Date',
          },
          {
            'identifier': AppConstants.otherKey,
            'svgIcon': AssetConstants.heartOutlinedIcon,
          }
        ],
        selectedImageIndex: 0,
        openFilterSheet: false,
        filterList: const [
          {
            "displayName": "Sort",
            "name": "sort",
            "values": [
              {"name": "featured", "displayName": "Featured"},
              {"name": "distance", "displayName": "Distance", "value": "ASC"},
              {
                "name": "price_range_start",
                "displayName": "Cost:Low to High",
                "value": "ASC"
              },
              {
                "name": "price_range_start",
                "displayName": "Cost:High to Low",
                "value": "DESC"
              },
              {"name": "rating", "displayName": "Rating", "value": "DESC"}
            ]
          },
          {
            "displayName": "Location",
            "name": "range",
            "values": [
              {"name": "range", "displayName": "Within 1km", "value": 1000},
              {"name": "range", "displayName": "< 3km", "value": 3000},
              {"name": "range", "displayName": "< 5km", "value": 5000},
              {"name": "range", "displayName": "Anywhere", "value": 20000}
            ]
          },
          {
            "displayName": "Dancefloor",
            "name": "events.dance_floor",
            "values": [
              {
                "name": "events.dance_floor",
                "displayName": "Yes",
                "rule": "eq",
                "value": true
              },
              {
                "name": "events.dance_floor",
                "displayName": "No",
                "rule": "eq",
                "value": false
              },
              {"name": "events.dance_floor", "displayName": "Doesn't matter"}
            ]
          },
          {
            "displayName": "Capacity",
            "name": "events.capacity",
            "values": [
              {
                "name": "events.capacity",
                "displayName": "50",
                "rule": "lte",
                "value": 50
              },
              {
                "name": "events.capacity",
                "displayName": "100",
                "rule": "lte",
                "value": 100
              },
              {
                "name": "events.capacity",
                "displayName": "200",
                "rule": "lte",
                "value": 200
              },
              {
                "name": "events.capacity",
                "displayName": "500",
                "rule": "lte",
                "value": 500
              },
              {
                "name": "events.capacity",
                "displayName": "1000",
                "rule": "lte",
                "value": 1000
              },
              {"name": "events.capacity", "displayName": ">1000"}
            ]
          },
          {
            "displayName": "Genre/Music",
            "name": "music",
            "values": [
              {
                "displayName": "Themed Parties",
                "name": "event_category.id",
                "rule": "eq",
                "value": 1
              },
              {
                "displayName": "EDM",
                "name": "event_category.id",
                "rule": "eq",
                "value": 2
              },
              {
                "displayName": "Rave Party",
                "name": "event_category.id",
                "rule": "eq",
                "value": 3
              },
              {
                "displayName": "Live Music ",
                "name": "event_category.id",
                "rule": "eq",
                "value": 5
              },
              {
                "displayName": "Rock Music",
                "name": "event_category.id",
                "rule": "eq",
                "value": 4
              },
              {
                "displayName": "Bollywood Night",
                "name": "event_category.id",
                "rule": "eq",
                "value": 6
              },
              {
                "displayName": "DJ Sets ",
                "name": "event_category.id",
                "rule": "eq",
                "value": 7
              }
            ]
          }
        ],
        selectedFilters: [
          'sort'
        ],
        filterOptions:[
          
        ],
      );
}
