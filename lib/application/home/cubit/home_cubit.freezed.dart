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
  PageController get pageController => throw _privateConstructorUsedError;
  int get selectedImageIndex => throw _privateConstructorUsedError;
  bool get showLocationDialog => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get filterList =>
      throw _privateConstructorUsedError;
  List<String> get selectedFilters => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get filterOptions =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get locationSuggestions =>
      throw _privateConstructorUsedError;
  LocationDto get location => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;

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
      PageController pageController,
      int selectedImageIndex,
      bool showLocationDialog,
      List<Map<String, dynamic>> filterList,
      List<String> selectedFilters,
      List<Map<String, dynamic>> filterOptions,
      List<Map<String, dynamic>> locationSuggestions,
      LocationDto location,
      EventRepository eventRepository});

  $FilterDtoCopyWith<$Res>? get categoryFilter;
  $LocationDtoCopyWith<$Res> get location;
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
    Object? pageController = null,
    Object? selectedImageIndex = null,
    Object? showLocationDialog = null,
    Object? filterList = null,
    Object? selectedFilters = null,
    Object? filterOptions = null,
    Object? locationSuggestions = null,
    Object? location = null,
    Object? eventRepository = null,
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
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      filterList: null == filterList
          ? _value.filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      selectedFilters: null == selectedFilters
          ? _value.selectedFilters
          : selectedFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      PageController pageController,
      int selectedImageIndex,
      bool showLocationDialog,
      List<Map<String, dynamic>> filterList,
      List<String> selectedFilters,
      List<Map<String, dynamic>> filterOptions,
      List<Map<String, dynamic>> locationSuggestions,
      LocationDto location,
      EventRepository eventRepository});

  @override
  $FilterDtoCopyWith<$Res>? get categoryFilter;
  @override
  $LocationDtoCopyWith<$Res> get location;
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
    Object? pageController = null,
    Object? selectedImageIndex = null,
    Object? showLocationDialog = null,
    Object? filterList = null,
    Object? selectedFilters = null,
    Object? filterOptions = null,
    Object? locationSuggestions = null,
    Object? location = null,
    Object? eventRepository = null,
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
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      filterList: null == filterList
          ? _value.filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      selectedFilters: null == selectedFilters
          ? _value.selectedFilters
          : selectedFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required this.pageController,
      required this.selectedImageIndex,
      required this.showLocationDialog,
      required this.filterList,
      required this.selectedFilters,
      required this.filterOptions,
      required this.locationSuggestions,
      required this.location,
      required this.eventRepository});

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
  final PageController pageController;
  @override
  final int selectedImageIndex;
  @override
  final bool showLocationDialog;
  @override
  final List<Map<String, dynamic>> filterList;
  @override
  final List<String> selectedFilters;
  @override
  final List<Map<String, dynamic>> filterOptions;
  @override
  final List<Map<String, dynamic>> locationSuggestions;
  @override
  final LocationDto location;
  @override
  final EventRepository eventRepository;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, hasMoreEvents: $hasMoreEvents, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, categoryFilter: $categoryFilter, page: $page, events: $events, filters: $filters, exploreList: $exploreList, pageController: $pageController, selectedImageIndex: $selectedImageIndex, showLocationDialog: $showLocationDialog, filterList: $filterList, selectedFilters: $selectedFilters, filterOptions: $filterOptions, locationSuggestions: $locationSuggestions, location: $location, eventRepository: $eventRepository)';
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
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.selectedImageIndex, selectedImageIndex) ||
                other.selectedImageIndex == selectedImageIndex) &&
            (identical(other.showLocationDialog, showLocationDialog) ||
                other.showLocationDialog == showLocationDialog) &&
            const DeepCollectionEquality()
                .equals(other.filterList, filterList) &&
            const DeepCollectionEquality()
                .equals(other.selectedFilters, selectedFilters) &&
            const DeepCollectionEquality()
                .equals(other.filterOptions, filterOptions) &&
            const DeepCollectionEquality()
                .equals(other.locationSuggestions, locationSuggestions) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository));
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
        pageController,
        selectedImageIndex,
        showLocationDialog,
        const DeepCollectionEquality().hash(filterList),
        const DeepCollectionEquality().hash(selectedFilters),
        const DeepCollectionEquality().hash(filterOptions),
        const DeepCollectionEquality().hash(locationSuggestions),
        location,
        eventRepository
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
      required final PageController pageController,
      required final int selectedImageIndex,
      required final bool showLocationDialog,
      required final List<Map<String, dynamic>> filterList,
      required final List<String> selectedFilters,
      required final List<Map<String, dynamic>> filterOptions,
      required final List<Map<String, dynamic>> locationSuggestions,
      required final LocationDto location,
      required final EventRepository eventRepository}) = _$HomeStateImpl;

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
  PageController get pageController;
  @override
  int get selectedImageIndex;
  @override
  bool get showLocationDialog;
  @override
  List<Map<String, dynamic>> get filterList;
  @override
  List<String> get selectedFilters;
  @override
  List<Map<String, dynamic>> get filterOptions;
  @override
  List<Map<String, dynamic>> get locationSuggestions;
  @override
  LocationDto get location;
  @override
  EventRepository get eventRepository;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
