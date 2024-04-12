// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMoreEvents => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  FilterDto? get categoryFilter => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<EventDto> get events => throw _privateConstructorUsedError;
  List<FilterDto> get filters => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get exploreList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get mainExploreList =>
      throw _privateConstructorUsedError;
  PageController get pageController => throw _privateConstructorUsedError;
  bool get showLocationDialog => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get filterOptions =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get locationSuggestions =>
      throw _privateConstructorUsedError;
  LocationDto get location => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  String get sortDisplayName => throw _privateConstructorUsedError;
  bool get sortDropdownOpen => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>> get sortKey =>
      throw _privateConstructorUsedError;
  Offset get chipPosition => throw _privateConstructorUsedError;
  OverlayEntry? get overlayEntry => throw _privateConstructorUsedError;
  bool get isSearchOpen => throw _privateConstructorUsedError;
  bool get isSearchChanged => throw _privateConstructorUsedError;
  bool get isLocationSearchChanged => throw _privateConstructorUsedError;
  bool get noFilteredEvents => throw _privateConstructorUsedError;
  bool get noLocatedEvents => throw _privateConstructorUsedError;
  LocationRepository get locationRepository =>
      throw _privateConstructorUsedError;
  List<SuggestionDto> get suggestions => throw _privateConstructorUsedError;
  TextEditingController get searchController =>
      throw _privateConstructorUsedError;
  AppStateNotifier get appStateNotifier => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>> get homeKey =>
      throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasMoreEvents,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      FilterDto? categoryFilter,
      int page,
      List<EventDto> events,
      List<FilterDto> filters,
      List<Map<String, dynamic>> exploreList,
      List<Map<String, dynamic>> mainExploreList,
      PageController pageController,
      bool showLocationDialog,
      List<Map<String, dynamic>> filterOptions,
      List<Map<String, dynamic>> locationSuggestions,
      LocationDto location,
      EventRepository eventRepository,
      ScrollController scrollController,
      String sortDisplayName,
      bool sortDropdownOpen,
      GlobalKey<State<StatefulWidget>> sortKey,
      Offset chipPosition,
      OverlayEntry? overlayEntry,
      bool isSearchOpen,
      bool isSearchChanged,
      bool isLocationSearchChanged,
      bool noFilteredEvents,
      bool noLocatedEvents,
      LocationRepository locationRepository,
      List<SuggestionDto> suggestions,
      TextEditingController searchController,
      AppStateNotifier appStateNotifier,
      GlobalKey<State<StatefulWidget>> homeKey,
      UserDto? user});

  $FilterDtoCopyWith<$Res>? get categoryFilter;
  $LocationDtoCopyWith<$Res> get location;
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasMoreEvents = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? categoryFilter = freezed,
    Object? page = null,
    Object? events = null,
    Object? filters = null,
    Object? exploreList = null,
    Object? mainExploreList = null,
    Object? pageController = null,
    Object? showLocationDialog = null,
    Object? filterOptions = null,
    Object? locationSuggestions = null,
    Object? location = null,
    Object? eventRepository = null,
    Object? scrollController = null,
    Object? sortDisplayName = null,
    Object? sortDropdownOpen = null,
    Object? sortKey = null,
    Object? chipPosition = null,
    Object? overlayEntry = freezed,
    Object? isSearchOpen = null,
    Object? isSearchChanged = null,
    Object? isLocationSearchChanged = null,
    Object? noFilteredEvents = null,
    Object? noLocatedEvents = null,
    Object? locationRepository = null,
    Object? suggestions = null,
    Object? searchController = null,
    Object? appStateNotifier = null,
    Object? homeKey = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreEvents: null == hasMoreEvents
          ? _value.hasMoreEvents
          : hasMoreEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryFilter: freezed == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as FilterDto?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<FilterDto>,
      exploreList: null == exploreList
          ? _value.exploreList
          : exploreList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      mainExploreList: null == mainExploreList
          ? _value.mainExploreList
          : mainExploreList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      filterOptions: null == filterOptions
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      locationSuggestions: null == locationSuggestions
          ? _value.locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      sortDisplayName: null == sortDisplayName
          ? _value.sortDisplayName
          : sortDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      sortDropdownOpen: null == sortDropdownOpen
          ? _value.sortDropdownOpen
          : sortDropdownOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      chipPosition: null == chipPosition
          ? _value.chipPosition
          : chipPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      overlayEntry: freezed == overlayEntry
          ? _value.overlayEntry
          : overlayEntry // ignore: cast_nullable_to_non_nullable
              as OverlayEntry?,
      isSearchOpen: null == isSearchOpen
          ? _value.isSearchOpen
          : isSearchOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchChanged: null == isSearchChanged
          ? _value.isSearchChanged
          : isSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationSearchChanged: null == isLocationSearchChanged
          ? _value.isLocationSearchChanged
          : isLocationSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      noFilteredEvents: null == noFilteredEvents
          ? _value.noFilteredEvents
          : noFilteredEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      noLocatedEvents: null == noLocatedEvents
          ? _value.noLocatedEvents
          : noLocatedEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      locationRepository: null == locationRepository
          ? _value.locationRepository
          : locationRepository // ignore: cast_nullable_to_non_nullable
              as LocationRepository,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<SuggestionDto>,
      searchController: null == searchController
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      homeKey: null == homeKey
          ? _value.homeKey
          : homeKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterDtoCopyWith<$Res>? get categoryFilter {
    if (_value.categoryFilter == null) {
      return null;
    }

    return $FilterDtoCopyWith<$Res>(_value.categoryFilter!, (value) {
      return _then(_value.copyWith(categoryFilter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res> get location {
    return $LocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasMoreEvents,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      FilterDto? categoryFilter,
      int page,
      List<EventDto> events,
      List<FilterDto> filters,
      List<Map<String, dynamic>> exploreList,
      List<Map<String, dynamic>> mainExploreList,
      PageController pageController,
      bool showLocationDialog,
      List<Map<String, dynamic>> filterOptions,
      List<Map<String, dynamic>> locationSuggestions,
      LocationDto location,
      EventRepository eventRepository,
      ScrollController scrollController,
      String sortDisplayName,
      bool sortDropdownOpen,
      GlobalKey<State<StatefulWidget>> sortKey,
      Offset chipPosition,
      OverlayEntry? overlayEntry,
      bool isSearchOpen,
      bool isSearchChanged,
      bool isLocationSearchChanged,
      bool noFilteredEvents,
      bool noLocatedEvents,
      LocationRepository locationRepository,
      List<SuggestionDto> suggestions,
      TextEditingController searchController,
      AppStateNotifier appStateNotifier,
      GlobalKey<State<StatefulWidget>> homeKey,
      UserDto? user});

  @override
  $FilterDtoCopyWith<$Res>? get categoryFilter;
  @override
  $LocationDtoCopyWith<$Res> get location;
  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasMoreEvents = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? categoryFilter = freezed,
    Object? page = null,
    Object? events = null,
    Object? filters = null,
    Object? exploreList = null,
    Object? mainExploreList = null,
    Object? pageController = null,
    Object? showLocationDialog = null,
    Object? filterOptions = null,
    Object? locationSuggestions = null,
    Object? location = null,
    Object? eventRepository = null,
    Object? scrollController = null,
    Object? sortDisplayName = null,
    Object? sortDropdownOpen = null,
    Object? sortKey = null,
    Object? chipPosition = null,
    Object? overlayEntry = freezed,
    Object? isSearchOpen = null,
    Object? isSearchChanged = null,
    Object? isLocationSearchChanged = null,
    Object? noFilteredEvents = null,
    Object? noLocatedEvents = null,
    Object? locationRepository = null,
    Object? suggestions = null,
    Object? searchController = null,
    Object? appStateNotifier = null,
    Object? homeKey = null,
    Object? user = freezed,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreEvents: null == hasMoreEvents
          ? _value.hasMoreEvents
          : hasMoreEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryFilter: freezed == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as FilterDto?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<FilterDto>,
      exploreList: null == exploreList
          ? _value.exploreList
          : exploreList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      mainExploreList: null == mainExploreList
          ? _value.mainExploreList
          : mainExploreList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      filterOptions: null == filterOptions
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      locationSuggestions: null == locationSuggestions
          ? _value.locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      sortDisplayName: null == sortDisplayName
          ? _value.sortDisplayName
          : sortDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      sortDropdownOpen: null == sortDropdownOpen
          ? _value.sortDropdownOpen
          : sortDropdownOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      chipPosition: null == chipPosition
          ? _value.chipPosition
          : chipPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      overlayEntry: freezed == overlayEntry
          ? _value.overlayEntry
          : overlayEntry // ignore: cast_nullable_to_non_nullable
              as OverlayEntry?,
      isSearchOpen: null == isSearchOpen
          ? _value.isSearchOpen
          : isSearchOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchChanged: null == isSearchChanged
          ? _value.isSearchChanged
          : isSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationSearchChanged: null == isLocationSearchChanged
          ? _value.isLocationSearchChanged
          : isLocationSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      noFilteredEvents: null == noFilteredEvents
          ? _value.noFilteredEvents
          : noFilteredEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      noLocatedEvents: null == noLocatedEvents
          ? _value.noLocatedEvents
          : noLocatedEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      locationRepository: null == locationRepository
          ? _value.locationRepository
          : locationRepository // ignore: cast_nullable_to_non_nullable
              as LocationRepository,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<SuggestionDto>,
      searchController: null == searchController
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      homeKey: null == homeKey
          ? _value.homeKey
          : homeKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.isLoading,
      required this.hasMoreEvents,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      this.categoryFilter,
      required this.page,
      required this.events,
      required this.filters,
      required this.exploreList,
      required this.mainExploreList,
      required this.pageController,
      required this.showLocationDialog,
      required this.filterOptions,
      required this.locationSuggestions,
      required this.location,
      required this.eventRepository,
      required this.scrollController,
      required this.sortDisplayName,
      required this.sortDropdownOpen,
      required this.sortKey,
      required this.chipPosition,
      this.overlayEntry,
      required this.isSearchOpen,
      required this.isSearchChanged,
      required this.isLocationSearchChanged,
      required this.noFilteredEvents,
      required this.noLocatedEvents,
      required this.locationRepository,
      required this.suggestions,
      required this.searchController,
      required this.appStateNotifier,
      required this.homeKey,
      this.user});

  @override
  final bool isLoading;
  @override
  final bool hasMoreEvents;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  @override
  final FilterDto? categoryFilter;
  @override
  final int page;
  @override
  final List<EventDto> events;
  @override
  final List<FilterDto> filters;
  @override
  final List<Map<String, dynamic>> exploreList;
  @override
  final List<Map<String, dynamic>> mainExploreList;
  @override
  final PageController pageController;
  @override
  final bool showLocationDialog;
  @override
  final List<Map<String, dynamic>> filterOptions;
  @override
  final List<Map<String, dynamic>> locationSuggestions;
  @override
  final LocationDto location;
  @override
  final EventRepository eventRepository;
  @override
  final ScrollController scrollController;
  @override
  final String sortDisplayName;
  @override
  final bool sortDropdownOpen;
  @override
  final GlobalKey<State<StatefulWidget>> sortKey;
  @override
  final Offset chipPosition;
  @override
  final OverlayEntry? overlayEntry;
  @override
  final bool isSearchOpen;
  @override
  final bool isSearchChanged;
  @override
  final bool isLocationSearchChanged;
  @override
  final bool noFilteredEvents;
  @override
  final bool noLocatedEvents;
  @override
  final LocationRepository locationRepository;
  @override
  final List<SuggestionDto> suggestions;
  @override
  final TextEditingController searchController;
  @override
  final AppStateNotifier appStateNotifier;
  @override
  final GlobalKey<State<StatefulWidget>> homeKey;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, hasMoreEvents: $hasMoreEvents, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, categoryFilter: $categoryFilter, page: $page, events: $events, filters: $filters, exploreList: $exploreList, mainExploreList: $mainExploreList, pageController: $pageController, showLocationDialog: $showLocationDialog, filterOptions: $filterOptions, locationSuggestions: $locationSuggestions, location: $location, eventRepository: $eventRepository, scrollController: $scrollController, sortDisplayName: $sortDisplayName, sortDropdownOpen: $sortDropdownOpen, sortKey: $sortKey, chipPosition: $chipPosition, overlayEntry: $overlayEntry, isSearchOpen: $isSearchOpen, isSearchChanged: $isSearchChanged, isLocationSearchChanged: $isLocationSearchChanged, noFilteredEvents: $noFilteredEvents, noLocatedEvents: $noLocatedEvents, locationRepository: $locationRepository, suggestions: $suggestions, searchController: $searchController, appStateNotifier: $appStateNotifier, homeKey: $homeKey, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasMoreEvents, hasMoreEvents) ||
                other.hasMoreEvents == hasMoreEvents) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.categoryFilter, categoryFilter) ||
                other.categoryFilter == categoryFilter) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.events, events) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            const DeepCollectionEquality()
                .equals(other.exploreList, exploreList) &&
            const DeepCollectionEquality()
                .equals(other.mainExploreList, mainExploreList) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.showLocationDialog, showLocationDialog) ||
                other.showLocationDialog == showLocationDialog) &&
            const DeepCollectionEquality()
                .equals(other.filterOptions, filterOptions) &&
            const DeepCollectionEquality()
                .equals(other.locationSuggestions, locationSuggestions) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.sortDisplayName, sortDisplayName) ||
                other.sortDisplayName == sortDisplayName) &&
            (identical(other.sortDropdownOpen, sortDropdownOpen) ||
                other.sortDropdownOpen == sortDropdownOpen) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.chipPosition, chipPosition) ||
                other.chipPosition == chipPosition) &&
            (identical(other.overlayEntry, overlayEntry) ||
                other.overlayEntry == overlayEntry) &&
            (identical(other.isSearchOpen, isSearchOpen) ||
                other.isSearchOpen == isSearchOpen) &&
            (identical(other.isSearchChanged, isSearchChanged) ||
                other.isSearchChanged == isSearchChanged) &&
            (identical(
                    other.isLocationSearchChanged, isLocationSearchChanged) ||
                other.isLocationSearchChanged == isLocationSearchChanged) &&
            (identical(other.noFilteredEvents, noFilteredEvents) ||
                other.noFilteredEvents == noFilteredEvents) &&
            (identical(other.noLocatedEvents, noLocatedEvents) ||
                other.noLocatedEvents == noLocatedEvents) &&
            (identical(other.locationRepository, locationRepository) ||
                other.locationRepository == locationRepository) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions) &&
            (identical(other.searchController, searchController) ||
                other.searchController == searchController) &&
            (identical(other.appStateNotifier, appStateNotifier) ||
                other.appStateNotifier == appStateNotifier) &&
            (identical(other.homeKey, homeKey) || other.homeKey == homeKey) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        hasMoreEvents,
        isSuccessful,
        isFailed,
        noUse,
        categoryFilter,
        page,
        const DeepCollectionEquality().hash(events),
        const DeepCollectionEquality().hash(filters),
        const DeepCollectionEquality().hash(exploreList),
        const DeepCollectionEquality().hash(mainExploreList),
        pageController,
        showLocationDialog,
        const DeepCollectionEquality().hash(filterOptions),
        const DeepCollectionEquality().hash(locationSuggestions),
        location,
        eventRepository,
        scrollController,
        sortDisplayName,
        sortDropdownOpen,
        sortKey,
        chipPosition,
        overlayEntry,
        isSearchOpen,
        isSearchChanged,
        isLocationSearchChanged,
        noFilteredEvents,
        noLocatedEvents,
        locationRepository,
        const DeepCollectionEquality().hash(suggestions),
        searchController,
        appStateNotifier,
        homeKey,
        user
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool isLoading,
      required final bool hasMoreEvents,
      required final bool isSuccessful,
      required final bool isFailed,
      required final bool noUse,
      final FilterDto? categoryFilter,
      required final int page,
      required final List<EventDto> events,
      required final List<FilterDto> filters,
      required final List<Map<String, dynamic>> exploreList,
      required final List<Map<String, dynamic>> mainExploreList,
      required final PageController pageController,
      required final bool showLocationDialog,
      required final List<Map<String, dynamic>> filterOptions,
      required final List<Map<String, dynamic>> locationSuggestions,
      required final LocationDto location,
      required final EventRepository eventRepository,
      required final ScrollController scrollController,
      required final String sortDisplayName,
      required final bool sortDropdownOpen,
      required final GlobalKey<State<StatefulWidget>> sortKey,
      required final Offset chipPosition,
      final OverlayEntry? overlayEntry,
      required final bool isSearchOpen,
      required final bool isSearchChanged,
      required final bool isLocationSearchChanged,
      required final bool noFilteredEvents,
      required final bool noLocatedEvents,
      required final LocationRepository locationRepository,
      required final List<SuggestionDto> suggestions,
      required final TextEditingController searchController,
      required final AppStateNotifier appStateNotifier,
      required final GlobalKey<State<StatefulWidget>> homeKey,
      final UserDto? user}) = _$HomeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasMoreEvents;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  FilterDto? get categoryFilter;
  @override
  int get page;
  @override
  List<EventDto> get events;
  @override
  List<FilterDto> get filters;
  @override
  List<Map<String, dynamic>> get exploreList;
  @override
  List<Map<String, dynamic>> get mainExploreList;
  @override
  PageController get pageController;
  @override
  bool get showLocationDialog;
  @override
  List<Map<String, dynamic>> get filterOptions;
  @override
  List<Map<String, dynamic>> get locationSuggestions;
  @override
  LocationDto get location;
  @override
  EventRepository get eventRepository;
  @override
  ScrollController get scrollController;
  @override
  String get sortDisplayName;
  @override
  bool get sortDropdownOpen;
  @override
  GlobalKey<State<StatefulWidget>> get sortKey;
  @override
  Offset get chipPosition;
  @override
  OverlayEntry? get overlayEntry;
  @override
  bool get isSearchOpen;
  @override
  bool get isSearchChanged;
  @override
  bool get isLocationSearchChanged;
  @override
  bool get noFilteredEvents;
  @override
  bool get noLocatedEvents;
  @override
  LocationRepository get locationRepository;
  @override
  List<SuggestionDto> get suggestions;
  @override
  TextEditingController get searchController;
  @override
  AppStateNotifier get appStateNotifier;
  @override
  GlobalKey<State<StatefulWidget>> get homeKey;
  @override
  UserDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
