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
    required bool showLocationDialog,
    required List<Map<String, dynamic>> filterList,
    required List<String> selectedFilters,
    required List<Map<String, dynamic>> filterOptions,
    required List<Map<String, dynamic>> locationSuggestions,
    required String city,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        city: '',
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
                'https://images.unsplash.com/photo-1586156938613-769b0353c8fc?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Bollywood',
            'image':
                'https://images.unsplash.com/photo-1580194191675-f66754a68698?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Ladies night',
            'image':
                'https://plus.unsplash.com/premium_photo-1665413642520-ebe79e961a4a?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'EDM',
            'image':
                'https://images.unsplash.com/photo-1578946956088-940c3b502864?q=80&w=2823&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Theme nights',
            'image':
                'https://images.unsplash.com/photo-1609570394105-ac24231def46?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Punjabi',
            'image':
                'https://plus.unsplash.com/premium_photo-1684581969889-67d386781d37?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          },
          {
            'title': 'Telugu',
            'image':
                'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
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
    'id': 'today',
    'isSelected': false,
    'identifier': AppConstants.otherKey,
    'label': 'Today',
  },
  {
    'id': 'this_weekend',
    'isSelected': false,
    'identifier': AppConstants.otherKey,
    'label': 'This weekend',
  },
  {
    'id': 'sort',
    'isSelected': false,
    'identifier': AppConstants.otherKey,
    'svgIcon': AssetConstants.arrowDown,
    'label': 'Sort',
  },
  {
    'id': 'date',
    'isSelected': false,
    'identifier': AppConstants.otherKey,
    'label': 'Date',
  },
  {
    'id': 'heart',
    'isSelected': false,
    'identifier': AppConstants.otherKey,
    'svgIcon': AssetConstants.heartOutlinedIcon,
  }
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
        selectedFilters: [
          'sort'
        ],
        filterOptions:[],
        locationSuggestions:[
          {
            'name':'Mumbai',
            'image':'https://images.unsplash.com/photo-1529253355930-ddbe423a2ac7?q=80&w=2665&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            'name':'Delhi',
            'image':'https://images.unsplash.com/photo-1587474260584-136574528ed5?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },{
            'name':'Bangalore',
            'image':'https://images.unsplash.com/photo-1637540485660-93031d90b97b?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },{
            'name':'Japan',
            'image':'https://images.unsplash.com/photo-1544808208-727498b3df07?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },{
            'name':'Up',
            'image':'https://images.unsplash.com/photo-1701749740828-c068fa546d3e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
        ]
      );
}
