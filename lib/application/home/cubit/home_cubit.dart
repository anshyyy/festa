import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/analytics_service/analytics_service.dart';
import '../../../domain/event/event_repository.dart';
import '../../../domain/location/location_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';
import '../../../infrastructure/event/i_event_repository.dart';
import '../../../infrastructure/location/dtos/suggestion/suggestion_dto.dart';
import '../../../infrastructure/location/i_location_repository.dart';
import '../../../infrastructure/search/dtos/search results/search_results.dart';
import '../../../infrastructure/search/search_repository.dart';
import '../../../presentation/home/widgets/dropdown_panel.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final int limit = 10;
  bool isFetching = false;
  double lastScrollPos = 0.0;
  HomeCubit(super.initialState);

  void init() async {
    List<FilterDto> filters = await state.eventRepository.getFilter();
    emit(state.copyWith(
      isLoading: false,
      filters: filters,
      categoryFilter: filters.firstWhere((element) {
        return element.name == 'music';
      }),
    ));

    //write or call your logic
    //code will run when widget rendering complete

    state.scrollController.addListener(() {
      final double maxScroll = state.scrollController.position.maxScrollExtent;
      final double currentScroll = state.scrollController.position.pixels;
      lastScrollPos = state.scrollController.position.pixels;

      // Check if the scroll is at the top
      if (currentScroll <= 10) {
        emit(state.copyWith(isAtTop: true));
      } else {
        emit(state.copyWith(isAtTop: false));
      }

      const double delta = 50;
      if (maxScroll - currentScroll <= delta) {
        if (state.hasMoreEvents) {
          if (!isFetching) {
            isFetching = true;
            getEvents();
          }
        }
      }

      if (state.scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        emit(state.copyWith(isScrollingUp: true));
      }
      if (state.scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        emit(state.copyWith(isScrollingUp: false));
      }
    });

    state.appStateNotifier.addListener(() {
      if (state.appStateNotifier.menuIndex == 0) {
        if (state.appStateNotifier.goToTop) {
          state.scrollController.animateTo(0.0,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          Future.delayed(const Duration(milliseconds: 500), () {
            state.scrollController.animateTo(lastScrollPos,
                duration: const Duration(milliseconds: 100),
                curve: Curves.ease);
          });
        }
      }
    });

    getEvents();
  }

  Future onPullToRefresh() async {
    emit(state.copyWith(isLoading: true, events: [], page: 1, isRefresh: true));

    await getEvents();
    List<Map<String, dynamic>> updatedExploreList =
        state.exploreList.map((exploreItem) {
      if (['today', 'weekend', 'date'].contains(exploreItem['id'])) {
        return {...exploreItem, 'svgIcon': null, 'isSelected': false};
      }
      return exploreItem;
    }).toList();

    emit(state.copyWith(
        isLoading: false, isRefresh: false, exploreList: updatedExploreList));
  }

  Future getEvents({String? eventsFrom}) async {
    String? sort;
    int? range;
    String? otherFilters;
    final filters = state.filters;
    final searchQuery = state.searchController.text.trim();
    final sortFilter = filters.firstWhere((element) => element.name == 'sort');
    final sortApplied = sortFilter.isApplied;
    if (sortApplied) {
      FilterValueDto filterValue =
          sortFilter.values.firstWhere((element) => element.isApplied);
      if ((filterValue.value ?? '').toString().isNotEmpty) {
        sort = '${filterValue.name}:${filterValue.value}';
      }
    }
    final rangeFilter =
        filters.firstWhere((element) => element.name == 'range');
    final rangeApplied = rangeFilter.isApplied;
    if (rangeApplied) {
      FilterValueDto filterValue =
          rangeFilter.values.firstWhere((element) => element.isApplied);
      if (filterValue.value != 0) {
        range = filterValue.value;
      }
    }

    final appliedFiltersOther = filters
        .where((element) =>
            element.isApplied && !['sort', 'range'].contains(element.name))
        .toList();
    if (appliedFiltersOther.isNotEmpty) {
      otherFilters = '[';
      for (int i = 0; i < appliedFiltersOther.length; i++) {
        FilterValueDto filterValue = appliedFiltersOther[i]
            .values
            .firstWhere((element) => element.isApplied);
        if (appliedFiltersOther[i].name == 'music') {
          otherFilters =
              '$otherFilters${otherFilters != "[" ? ',' : ''}{"property":"${filterValue.name}","rule":"${filterValue.rule}","value":${filterValue.categoryId}}';
        } else if (filterValue.value != null) {
          otherFilters =
              '$otherFilters${otherFilters != "[" ? ',' : ''}{"property":"${filterValue.name}","rule":"${filterValue.rule}","value":${filterValue.value}}';
        }
      }
      otherFilters = '$otherFilters]';
    }

    final events = await state.eventRepository.getEvents(
      lat: state.location.latitude,
      long: state.location.longitude,
      limit: limit,
      page: state.page,
      sort: sort,
      search: searchQuery,
      range: range,
      otherFilters: otherFilters,
    );
    print(events);
    if(events.isEmpty){
        emit(state.copyWith(noEventsInTheLocation: true));
    } else{
              emit(state.copyWith(noEventsInTheLocation: false));
    }
    state.events.addAll(events);

    isFetching = false;
    emit(state.copyWith(
      noUse: !state.noUse,
      noFilteredEvents: eventsFrom == 'filters',
      page: state.page + 1,
      hasMoreEvents: events.length == limit,
    ));
  }

  void onChipChange({required String id}) {
    List<Map<String, dynamic>> temp = state.exploreList.map((e) {
      if (e['id'].toString().toLowerCase() == id.toString().toLowerCase()) {
        e['isSelected'] = true;
      } else {
        e['isSelected'] = false;
      }
      return e;
    }).toList();

    emit(state.copyWith(exploreList: temp, noUse: !state.noUse));
  }

  void toggleLocationDialog() {
    emit(state.copyWith(showLocationDialog: !state.showLocationDialog));
  }

  void updateLocation({required LocationDto location}) async {
    emit(state.copyWith(isLoading: true));
    List<FilterDto> filters = List.from(state.filters.map((e) => e.copyWith(
        isApplied: false,
        values: e.values
            .map((e) => e.copyWith(isApplied: false))
            .toList()))).map((e) => e as FilterDto).toList();
    emit(state.copyWith(
        location: location,
        showLocationDialog: !state.showLocationDialog,
        events: [],
        filters: filters,
        hasMoreEvents: true,
        exploreList: state.mainExploreList,
        page: 1));
    await getEvents(eventsFrom: 'location');
    emit(state.copyWith(isLoading: false));
  }

  void removeAppliedFilter({required String id}) {
    List<FilterDto> filters = List.from(state.filters.map((e) {
      //(e.name);
      if (e.name == id) {
        return e.copyWith(
            isApplied: false,
            values: e.values.map((e) => e.copyWith(isApplied: false)).toList());
      }
      return e;
    }));
    updateFilterApplied(filters: filters);
  }

  void updateFilterToToday() async {
    bool isTodaySelected = state.exploreList
        .any((item) => item['id'] == 'today' && item['isSelected'] == true);

    if (isTodaySelected) {
      await onPullToRefresh();
    } else {
      final now = DateTime.now().toLocal();
      final todayStart = DateTime.utc(now.year, now.month, now.day);
      final todayEnd = todayStart.add(const Duration(days: 1));

      final filteredEvents = state.events.where((event) {
        final startDate = DateTime.tryParse(event.startDate)?.toUtc();
        //('Event date: $startDate');
        if (startDate == null) return false;
        return startDate.isAtSameMomentAs(todayStart) ||
            (startDate.isAfter(todayStart) && startDate.isBefore(todayEnd));
      }).toList();

      filteredEvents.sort((a, b) {
        final aDate = DateTime.tryParse(a.startDate);
        final bDate = DateTime.tryParse(b.startDate);
        if (aDate == null || bDate == null) return 0;
        return aDate.compareTo(bDate);
      });
      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'weekend' || item['id'] == 'date') {
          return {
            ...item,
            'svgIcon': null,
            'isSelected': false,
          };
        }
        if (item['id'] == 'today') {
          return {
            ...item,
            'svgIcon': AssetConstants.closeIcon,
            'isSelected': true,
          };
        } else {
          return {
            ...item,
            'isSelected': false,
          };
        }
      }).toList();
      emit(state.copyWith(
        events: filteredEvents,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
      ));
    }
  }

  void updateFilterToThisWeekend() async {
    bool isWeekendSelected = state.exploreList
        .any((item) => item['id'] == 'weekend' && item['isSelected'] == true);

    List<Map<String, dynamic>> updatedExploreList =
        state.exploreList.map((exploreItem) {
      if (['today', 'date'].contains(exploreItem['id'])) {
        return {...exploreItem, 'svgIcon': null, 'isSelected': false};
      }
      return exploreItem;
    }).toList();
    emit(state.copyWith(exploreList: updatedExploreList));

    if (isWeekendSelected) {
      await onPullToRefresh();
    } else {
      final now = DateTime.now().toUtc();
      final today = DateTime.utc(now.year, now.month, now.day);

      // Find the next Friday (or today if it's already Friday)
      final daysUntilFriday = (DateTime.friday - today.weekday + 7) % 7;
      final thisWeekendStart = today
          .add(Duration(days: daysUntilFriday))
          .add(const Duration(hours: 17)); // Friday 5 PM

      // Find the end of the weekend (Sunday night)
      final thisWeekendEnd = thisWeekendStart
          .add(const Duration(days: 2, hours: 7)); // Sunday 11:59 PM

      final filteredEvents = state.events.where((event) {
        final startDate = DateTime.tryParse(event.startDate)?.toUtc();
        if (startDate == null) return false;
        return startDate.isAfter(thisWeekendStart) &&
            startDate.isBefore(thisWeekendEnd);
      }).toList();

      filteredEvents.sort((a, b) {
        final aDate = DateTime.tryParse(a.startDate);
        final bDate = DateTime.tryParse(b.startDate);
        if (aDate == null || bDate == null) return 0;
        return aDate.compareTo(bDate);
      });

      ('Filtered weekend events: ${filteredEvents.length}');

      // Update the exploreList to set 'weekend' as selected
      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'weekend') {
          item['svgIcon'] = AssetConstants.closeIcon;
          return {...item, 'isSelected': true};
        } else {
          return {...item, 'isSelected': false};
        }
      }).toList();

      emit(state.copyWith(
        events: filteredEvents,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
      ));
    }
  }

  void updateFilterApplied({required List<FilterDto> filters}) {
    final sortFilter = filters.firstWhere((element) => element.name == 'sort');

    final sortDisplayName = sortFilter.isApplied
        ? sortFilter.values
            .firstWhere((element) => element.isApplied)
            .displayName
        : 'Sort';

    final categoryFilter =
        filters.firstWhere((element) => element.name == 'music');

    AnalyticsService().logEvent(eventName: 'pick_experience', paras: {
      'category': categoryFilter.displayName,
    });

    final appliedFilter = filters.where(
        (element) => (element.isApplied == true && element.name != 'sort'));

    //(appliedFilter);

    final newFilters = appliedFilter.map(
      (e) {
        final option = e.values.firstWhere((element) => element.isApplied);
        return {
          'id': e.name,
          'isSelected': option.isApplied,
          'label': '${e.displayName}: ${option.displayName}',
        };
      },
    ).toList();
    // (appliedFilter);

    final tempExploreList = [...state.mainExploreList, ...newFilters];

    for (int i = 0; i < tempExploreList.length; i++) {
      if (tempExploreList[i]['id'] == 'sort') {
        tempExploreList[i] = {
          ...tempExploreList[i],
          'isSelected': sortFilter.isApplied,
        };
      }
    }
    emit(state.copyWith(
      noUse: !state.noUse,
      filters: filters,
      categoryFilter: categoryFilter,
      page: 1,
      events: [],
      hasMoreEvents: true,
      exploreList: tempExploreList,
      sortDisplayName: sortDisplayName,
    ));
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => getEvents(eventsFrom: 'filters'));
  }

  void updateFilterToSelectedDates(List<DateTime> selectedDates) async {
    bool isDateSelected = state.exploreList
        .any((item) => item['id'] == 'date' && item['isSelected'] == true);
    List<Map<String, dynamic>> updatedExploreList =
        state.exploreList.map((exploreItem) {
      if (['today', 'weekend'].contains(exploreItem['id'])) {
        return {...exploreItem, 'svgIcon': null, 'isSelected': false};
      }
      return exploreItem;
    }).toList();
    emit(state.copyWith(exploreList: updatedExploreList));

    if (isDateSelected) {
      await onPullToRefresh();
    } else {
      final dates = selectedDates;
      ('Selected dates: $dates');

      final filteredEvents = state.events.where((event) {
        final startDate = DateTime.tryParse(event.startDate)?.toUtc();
        if (startDate == null) return false;

        // Check if the event's start date falls on any of the selected dates
        return dates.any((date) =>
            startDate.year == date.year &&
            startDate.month == date.month &&
            startDate.day == date.day);
      }).toList();

      filteredEvents.sort((a, b) {
        final aDate = DateTime.tryParse(a.startDate);
        final bDate = DateTime.tryParse(b.startDate);
        if (aDate == null || bDate == null) return 0;
        return aDate.compareTo(bDate);
      });

      // Update the exploreList to set 'date' as selected
      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'date') {
          item['svgIcon'] = AssetConstants.closeIcon;
          return {...item, 'isSelected': true};
        } else {
          return {...item, 'isSelected': false};
        }
      }).toList();

      emit(state.copyWith(
        events: filteredEvents,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
      ));
    }
  }

  void emitFromEveryWhere({required HomeState currentState}) {
    emit(currentState);
  }

  void toggleSort({required bool flag}) {
    emit(state.copyWith(sortDropdownOpen: flag));
  }

  void getChipPosition(
      {required GlobalKey key, required OverlayState overlayState}) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    showOverlay(position.dx, position.dy, overlayState);
  }

  void showOverlay(double dx, double dy, OverlayState overlayState) {
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
            top: dy - .5,
            left: dx - .5,
            child: DropView(
              onBack: (String name, String? value) {
                final index = state.filters
                    .indexWhere((element) => element.name == 'sort');
                final valueIndex = state.filters[index].values.indexWhere(
                    (element) =>
                        element.name == name && element.value == value);
                for (int i = 0; i < state.filters[index].values.length; i++) {
                  state.filters[index].values[i] =
                      state.filters[index].values[i].copyWith(
                    isApplied: false,
                  );
                }
                //todo
                state.filters[index].values[valueIndex] = state
                    .filters[index].values[valueIndex]
                    .copyWith(isApplied: true);
                state.filters[index] =
                    state.filters[index].copyWith(isApplied: true);
                removeOverlay();
                updateFilterApplied(filters: state.filters);
              },
              filters: state.filters
                  .firstWhere((element) => element.name == 'sort')
                  .values,
            ));
      },
    );
    (overlayEntry);
    overlayState.insert(overlayEntry);
    toggleSort(flag: true);
    emit(state.copyWith(overlayEntry: overlayEntry));
  }

  void removeOverlay() {
    if (state.overlayEntry != null && state.overlayEntry!.mounted) {
      toggleSort(flag: false);
      state.overlayEntry!.remove();
      emit(state.copyWith(overlayEntry: null));
    }
  }

  void toggleSearch({required bool flag}) {
    emit(state.copyWith(isSearchOpen: flag));
  }

  void onSearchChange({bool isSearchOn = true}) async {
    emit(state.copyWith(page: 1, isLoading: true));
    if (isSearchOn) {
      AnalyticsService().logEvent(eventName: 'search_events', paras: {
        'search_term': state.searchController.text.trim(),
      });
      await getEvents();
    } else {
      if (state.searchController.text.trim().isEmpty) {
        toggleSearch(flag: false);
      } else {
        state.searchController.clear();
        toggleSearch(flag: false);
        await getEvents();
      }
    }
    emit(state.copyWith(isLoading: false));
  }

  void onLocationSearchChange({required String query}) async {
    emit(state.copyWith(isLocationSearchChanged: query.isNotEmpty));
    final locationSuggestions =
        await state.locationRepository.getLocationSuggestions(query: query);
    emit(state.copyWith(suggestions: locationSuggestions));
  }

  void onDetectMyLocation() async {
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(state.copyWith(showPermissionDialog: true));
      return;
    }

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      throw Error();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Either<dynamic, LocationDto> response = await state.locationRepository
        .getLocationByCoordinates(
            lat: position.latitude, lng: position.longitude);

    response.fold((l) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }, (r) {
      updateLocation(location: r);
    });
  }

  void onLocationChange(
      {required String placeId, required String locationName}) async {
    Either<dynamic, Map<String, dynamic>> response =
        await state.locationRepository.getLocationDetails(placeId: placeId);
    response.fold((l) => null, (r) {
      final updatedLocation = LocationDto(
          latitude: r['lat'] as double,
          longitude: r['lng'] as double,
          area: locationName,
          city: locationName,
          state: locationName,
          country: 'India',
          icon: '');
      updateLocation(location: updatedLocation);
    });
    emit(state.copyWith(suggestions: [], isLocationSearchChanged: false));
  }

  void onEventLiked({required int id, bool isLiked = true}) async {
    state.eventRepository.likeUnlikeEvent(eventId: id, isLiked: !isLiked);
    final List<EventDto> updatedEvents = state.events.map((event) {
      if (event.id == id) {
        return event.copyWith(isLiked: isLiked);
      }
      return event;
    }).toList();

    emit(state.copyWith(events: updatedEvents));
  }

  void toggleSound() {
    emit(state.copyWith(isVideoMute: !state.isVideoMute));
  }

  Future<void> onSearch(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(
          searchResults:
              const SearchResults(pubs: [], events: [], artists: [], users: []),
          searchLoading: false));
    }
    emit(state.copyWith(searchLoading: true));
    try {
      final SearchResults results =
          await state.searchRepository.getSearchResults(query);
      emit(state.copyWith(searchResults: results, searchLoading: false));
    } catch (e) {
      emit(state.copyWith(searchLoading: false));
      Fluttertoast.showToast(msg: 'Error fetching search results');
    }
  }

  void clearSearch() {
    emit(state.copyWith(
        searchResults:
            const SearchResults(pubs: [], events: [], artists: [], users: [])));
  }
}
