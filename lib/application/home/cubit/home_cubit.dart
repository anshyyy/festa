import 'dart:async';

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
import '../../../domain/core/services/storage_service/location_storage_service.dart';
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
Timer? _scrollDebouncer;
  bool _isHandlingScroll = false;
  bool isFetching = false;
  double lastScrollPos = 0.0;
  final int limit = 10;
  HomeCubit(super.initialState);



void _initScrollController() {
    state.scrollController.addListener(() {
      if (_isHandlingScroll) return;
      lastScrollPos = state.scrollController.position.pixels;
      
      _scrollDebouncer?.cancel();
      _scrollDebouncer = Timer(const Duration(milliseconds: 100), () {
        _isHandlingScroll = true;
        
        try {
          final position = state.scrollController.position;
          final currentScroll = position.pixels;
          final maxScroll = position.maxScrollExtent;
          final isScrollingForward = position.userScrollDirection == ScrollDirection.forward;
          
          // Batch all scroll-based state updates into a single emit
          emit(state.copyWith(
            showSearchOnPick: isScrollingForward && currentScroll >= 42,
            isAtTop: currentScroll <= 10,
            isScrollingUp: isScrollingForward,
          ));

          // Handle pagination
          if (maxScroll - currentScroll <= 50 && 
              state.hasMoreEvents && 
              !isFetching) {
            isFetching = true;
            getEvents();
          }
        } finally {
          _isHandlingScroll = false;
        }
      });
    });
  }


  

  void init() async {
    var location = await state.locationStorage.getLocation();
    List<FilterDto> filters = await state.eventRepository.getFilter();
    emit(state.copyWith(
      filters: filters,
      categoryFilter: filters.firstWhere((element) {
        return element.name == 'music';
      }),
    ));
    if (location != null) {
      emit(state.copyWith(location: location, isLoading: false));
    }
    emit(state.copyWith(isLoading: false));

    state.scrollController.addListener(() {
      final double maxScroll = state.scrollController.position.maxScrollExtent;
      final double currentScroll = state.scrollController.position.pixels;
      lastScrollPos = state.scrollController.position.pixels;


      if (state.scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (state.scrollController.position.pixels >= 42) {
          emit(state.copyWith(showSearchOnPick: true));
        } else {
          emit(state.copyWith(showSearchOnPick: false));
        }
      }

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
    // List<Map<String, dynamic>> updatedExploreList =
    //     state.exploreList.map((exploreItem) {
    //   if (['today', 'weekend', 'date'].contains(exploreItem['id'])) {
    //     return {...exploreItem, 'svgIcon': null, 'isSelected': false};
    //   }
    //   return exploreItem;
    // }).toList();

    emit(state.copyWith(
      isLoading: false,
      isRefresh: false,
    ));
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
      List<String> filterStrings = [];
      for (final filter in appliedFiltersOther) {
        if (filter.name == 'date') {
          // Handle date filter separately
          for (final value in filter.values.where((v) => v.isApplied)) {
            filterStrings.add(
                '{"property":"events.${value.name}","rule":"${value.rule}","value":"${value.value}"}');
          }
        } else {
          // Handle other filters
          for (final value in filter.values.where((v) => v.isApplied)) {
            String filterString;
            if (filter.name == 'music') {
              filterString =
                  '{"property":"${value.name}","rule":"${value.rule}","value":${value.categoryId}}';
            } else if (value.value != null) {
              filterString =
                  '{"property":"${value.name}","rule":"${value.rule}","value":${value.value}}';
            } else {
              continue; // Skip this iteration if value is null
            }
            filterStrings.add(filterString);
          }
        }
      }
      otherFilters = '[${filterStrings.join(',')}]';
    }

 //   print("otherFilters $otherFilters");

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
    // print(events);
    if (events.isEmpty) {
      emit(state.copyWith(noEventsInTheLocation: true));
    } else {
      emit(state.copyWith(noEventsInTheLocation: false));
    }
    state.events.addAll(events);
  


    //check any filters are applied

    //checking for today filter
    // if (state.isTodayFilterApplied) {
    //   updateFilterToToday(apply: true);
    // } else if (state.isThisWeekendFilterApplied) {
    //   updateFilterToThisWeekend(apply: true);
    // } else if (state.isSpecificDateFilterApplied) {
    //   updateFilterToSelectedDates(apply: true);
    // }

    isFetching = false;
    emit(state.copyWith(
      isLoading: false,
      noUse: !state.noUse,
      noFilteredEvents: eventsFrom == 'filters',
      page: state.page + 1,
      hasMoreEvents: events.length == limit,
    ));
  }

  void onEventCategoryFilterChange(int index) {
    // Check if the clicked category filter is already applied
    if (state.categoryFilter!.values[index].isApplied) {
      // If it is applied, unselect (remove) it
      state.categoryFilter!.values[index] =
          state.categoryFilter!.values[index].copyWith(isApplied: false);

      // Update the corresponding filter in 'state.filters'
      final indexTemp =
          state.filters.indexWhere((element) => element.name == 'music');
      if (indexTemp != -1) {
        state.filters[indexTemp] =
            state.filters[indexTemp].copyWith(isApplied: false);
      }

      // Update the applied filters and emit the new state
      updateFilterApplied(filters: List.from(state.filters));
      return;
    }

    // If the category filter is not applied, apply it (add)
    state.categoryFilter!.values[index] =
        state.categoryFilter!.values[index].copyWith(isApplied: true);

    // Update the corresponding filter in 'state.filters'
    final indexTemp =
        state.filters.indexWhere((element) => element.name == 'music');
    if (indexTemp != -1) {
      state.filters[indexTemp] =
          state.filters[indexTemp].copyWith(isApplied: true);
    }

    // Update the applied filters and emit the new state
    updateFilterApplied(filters: List.from(state.filters));
  }
  List<EventDto> removeDuplicateEvents(List<EventDto> events) {
  return events.fold<Map<int, EventDto>>({}, (uniqueEvents, event) {
    uniqueEvents[event.id] = event; // Adds or overwrites event by id
    return uniqueEvents;
  }).values.toList(); // Returns unique EventDto objects as a list
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
    await state.locationStorage.saveLocation(location);
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

  void restoreEvents() {
    emit(state.copyWith(isLoading: true));
    List<Map<String, dynamic>> updatedExploreList =
        state.exploreList.map((exploreItem) {
      if (['today', 'weekend', 'date'].contains(exploreItem['id'])) {
        return {...exploreItem, 'svgIcon': null, 'isSelected': false};
      }
      return exploreItem;
    }).toList();

    List<EventDto> events = List.from(state.cachedEvents);
    events.sort((a, b) => a.distance.compareTo(b.distance));

    List<FilterDto> updatedFilters = state.filters.map((filter) {
      if (filter.name == 'date') {
        return filter.copyWith(
          isApplied: false,
          values: filter.values
              .map((value) => value.copyWith(isApplied: false))
              .toList(),
        );
      }
      return filter;
    }).toList();

    emit(state.copyWith(
        filters: updatedFilters,
        isTodayFilterApplied: false,
        isThisWeekendFilterApplied: false,
        isSpecificDateFilterApplied: false,
        isLoading: false,
        events: events,
        exploreList: updatedExploreList));
  }

  void updateFilterToToday({required bool apply}) async {
    bool isTodaySelected = state.exploreList
        .any((item) => item['id'] == 'today' && item['isSelected'] == true);

    // print("isTodaySelected $isTodaySelected");
    // print("apply $apply");
    // print("isTodayFilterApplied ${state.isTodayFilterApplied}");

    if (!apply) {
      emit(state.copyWith(isTodayFilterApplied: false));
      restoreEvents();
    } else {
      final now = DateTime.now();
      final todayStart = DateTime.utc(now.year, now.month, now.day);
      final todayEnd = todayStart.add(const Duration(days: 1));

      if (state.isThisWeekendFilterApplied ||
          state.isSpecificDateFilterApplied) {
        emit(state.copyWith(events: state.cachedEvents));
      }

      final filteredEvents = state.events.where((event) {
        final startDate = DateTime.tryParse(event.startDate)?.toUtc();
        // print('Event date: $startDate today date: $todayStart $todayEnd');
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
    //  print("this is filteredEvents ${filteredEvents.length}");
      emit(state.copyWith(
          cachedEvents: state.events,
          events: filteredEvents,
          exploreList: updatedExploreList,
          noFilteredEvents: true,
          isThisWeekendFilterApplied: false,
          isSpecificDateFilterApplied: false,
          isTodayFilterApplied: true));
    }
  }

  void updateFilterToTodayBackend({required bool apply}) async {
    if (!apply) {
      emit(state.copyWith(isTodayFilterApplied: false));
      restoreEvents();
    } else {
      final now = DateTime.now();
      final todayStart = DateTime.utc(now.year, now.month, now.day);
      final todayEnd = todayStart.add(const Duration(days: 1));

      List<FilterDto> updatedFilters = List.from(state.filters);
      int dateFilterIndex =
          updatedFilters.indexWhere((filter) => filter.name == 'date');

      try {
        if (dateFilterIndex == -1) {
          updatedFilters.add(FilterDto(
            name: 'date',
            displayName: 'Date',
            isApplied: true,
            values: [],
          ));
          dateFilterIndex = updatedFilters.length - 1;
        }

        updatedFilters[dateFilterIndex] =
            updatedFilters[dateFilterIndex].copyWith(
          isApplied: true,
          values: [
            FilterValueDto(
              icon: '',
              name: 'start_date',
              displayName: 'Today',
              isApplied: true,
              value: "'$todayStart'",
              rule: 'gte',
            ),
            FilterValueDto(
              icon: '',
              name: 'end_date',
              displayName: 'Today',
              isApplied: true,
              value: "'$todayEnd'",
              rule: 'lte',
            ),
          ],
        );
      } catch (e) {
     //   print("error $e");
      }

      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'today') {
          return {
            ...item,
            'svgIcon': AssetConstants.closeIcon,
            'isSelected': true,
          };
        } else if (['weekend', 'date'].contains(item['id'])) {
          return {
            ...item,
            'svgIcon': null,
            'isSelected': false,
          };
        } else {
          return item;
        }
      }).toList();

      emit(state.copyWith(
        cachedEvents: state.events,
        events: [],
        page: 1,
        filters: updatedFilters,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
        hasMoreEvents: true,
        isTodayFilterApplied: true,
        isThisWeekendFilterApplied: false,
        isSpecificDateFilterApplied: false,
      ));
      await getEvents(eventsFrom: 'filters');
    }
  }

  void updateFilterToThisWeekendBackend({required bool apply}) async {
    if (!apply) {
      emit(state.copyWith(isThisWeekendFilterApplied: false));
      restoreEvents();
    } else {
      final now = DateTime.now().toUtc();
      final today = DateTime.utc(now.year, now.month, now.day);

      final daysUntilFriday = (DateTime.friday - today.weekday + 7) % 7;
      final thisWeekendStart = today
          .add(Duration(days: daysUntilFriday))
          .add(const Duration(hours: 17));

      final thisWeekendEnd =
          thisWeekendStart.add(const Duration(days: 2, hours: 7));

      List<FilterDto> updatedFilters = List.from(state.filters);
      int dateFilterIndex =
          updatedFilters.indexWhere((filter) => filter.name == 'date');

      try {
        if (dateFilterIndex == -1) {
          updatedFilters.add(FilterDto(
            name: 'date',
            displayName: 'Date',
            isApplied: true,
            values: [],
          ));
          dateFilterIndex = updatedFilters.length - 1;
        }

        updatedFilters[dateFilterIndex] =
            updatedFilters[dateFilterIndex].copyWith(
          isApplied: true,
          values: [
            FilterValueDto(
              icon: '',
              name: 'start_date',
              displayName: 'Weekend Start',
              isApplied: true,
              value: "'$thisWeekendStart'",
              rule: 'gte',
            ),
            FilterValueDto(
              icon: '',
              name: 'end_date',
              displayName: 'Weekend End',
              isApplied: true,
              value: "'$thisWeekendEnd'",
              rule: 'lte',
            ),
          ],
        );
      } catch (e) {
    //    print("error $e");
      }

      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'weekend') {
          return {
            ...item,
            'svgIcon': AssetConstants.closeIcon,
            'isSelected': true,
          };
        } else if (['today', 'date'].contains(item['id'])) {
          return {
            ...item,
            'svgIcon': null,
            'isSelected': false,
          };
        } else {
          return item;
        }
      }).toList();

      emit(state.copyWith(
        cachedEvents: state.events,
        events: [],
        page: 1,
        filters: updatedFilters,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
        hasMoreEvents: true,
        isThisWeekendFilterApplied: true,
        isTodayFilterApplied: false,
        isSpecificDateFilterApplied: false,
      ));
      await getEvents(eventsFrom: 'filters');
    }
  }

  void updateFilterToSelectedDatesBackend({required bool apply}) async {
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

    if (!apply) {
      emit(state.copyWith(isSpecificDateFilterApplied: false));
      restoreEvents();
    } else {
      final dates = state.selectedDates;
    //  print('Selected dates: $dates');

      if (state.isThisWeekendFilterApplied || state.isTodayFilterApplied) {
        emit(state.copyWith(events: state.cachedEvents));
      }

      List<FilterDto> updatedFilters = List.from(state.filters);
      int dateFilterIndex =
          updatedFilters.indexWhere((filter) => filter.name == 'date');

      try {
        if (dateFilterIndex == -1) {
          // If date filter doesn't exist, create it
          updatedFilters.add(const FilterDto(
            name: 'date',
            displayName: 'Date',
            isApplied: true,
            values: [],
          ));
          dateFilterIndex = updatedFilters.length - 1;
        }

        List<FilterValueDto> dateFilters = [];
        for (DateTime date in dates) {
          DateTime startOfDay = DateTime(date.year, date.month, date.day);
          DateTime endOfDay = startOfDay
              .add(const Duration(days: 1))
              .subtract(const Duration(seconds: 1));

          dateFilters.add(FilterValueDto(
            icon: '',
            name: 'start_date',
            displayName: 'Start Date',
            isApplied: true,
            value: "'${startOfDay}'",
            rule: 'gte',
          ));
          dateFilters.add(FilterValueDto(
            icon: '',
            name: 'end_date',
            displayName: 'End Date',
            isApplied: true,
            value: "'${endOfDay}'",
            rule: 'lte',
          ));
        }

        updatedFilters[dateFilterIndex] =
            updatedFilters[dateFilterIndex].copyWith(
          isApplied: true,
          values: dateFilters,
        );
      } catch (e) {
    //    print("Error updating date filter: $e");
      }

      // Update the exploreList to set 'date' as selected
      final updatedExploreList = state.exploreList.map((item) {
        if (item['id'] == 'date') {
          return {
            ...item,
            'svgIcon': AssetConstants.closeIcon,
            'isSelected': true,
          };
        } else {
          return {...item, 'isSelected': false};
        }
      }).toList();

      emit(state.copyWith(
        cachedEvents: state.events,
        events: [],
        page: 1,
        filters: updatedFilters,
        hasMoreEvents: true,
        exploreList: updatedExploreList,
        noFilteredEvents: true,
        isTodayFilterApplied: false,
        isThisWeekendFilterApplied: false,
        isSpecificDateFilterApplied: true,
      ));
      await getEvents(eventsFrom: 'filters');
    }
  }

  void updateFilterToThisWeekend({required bool apply}) async {
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

    if (!apply) {
      emit(state.copyWith(isThisWeekendFilterApplied: false));
      restoreEvents();
      // await onPullToRefresh();
    } else {
      if (state.isTodayFilterApplied || state.isSpecificDateFilterApplied) {
        emit(state.copyWith(events: state.cachedEvents));
      }
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

    //  print("$daysUntilFriday $thisWeekendStart  $thisWeekendEnd");

      final filteredEvents = state.events
          .where((event) {
            final startDate = DateTime.tryParse(event.startDate);
            if (startDate == null) return false;
            return startDate.isAfter(thisWeekendStart) &&
                startDate.isBefore(thisWeekendEnd);
          })
          .toSet()
          .toList();

      //  print(filteredEvents.length);

      // filteredEvents.sort((a, b) {
      //   final aDate = DateTime.tryParse(a.startDate);
      //   final bDate = DateTime.tryParse(b.startDate);
      //   if (aDate == null || bDate == null) return 0;
      //   return aDate.compareTo(bDate);
      // });

      //print('Filtered weekend events: ${filteredEvents.length}');

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
          cachedEvents: state.events,
          isTodayFilterApplied: false,
          isSpecificDateFilterApplied: false,
          isThisWeekendFilterApplied: true));
    }
  }

  void updateFilterApplied({required List<FilterDto> filters}) {
    final sortFilter = filters.firstWhere((element) => element.name == 'sort');
    final sortDisplayName = sortFilter.isApplied
        ? sortFilter.values
            .firstWhere((element) => element.isApplied)
            .displayName
        : 'Sort';

    final categoryFilterIndex =
        filters.indexWhere((element) => element.name == 'music');

    AnalyticsService().logEvent(eventName: 'pick_experience', paras: {
      'category': filters[categoryFilterIndex].displayName,
    });

    final appliedFilter = filters.where(
        (element) => (element.isApplied == true && element.name != 'sort'));

    final newFilters = appliedFilter
        .map(
          (e) {
            if (e.name != 'date') {
              final option =
                  e.values.firstWhere((element) => element.isApplied);
              return {
                'id': e.name,
                'isSelected': option.isApplied,
                'label': e.name == 'music'
                    ? '${e.displayName}'
                    : '${e.displayName}: ${option.displayName}',
                'svgIcon': AssetConstants.closeIcon,
              };
            }
            return null;
          },
        )
        .where((filter) => filter != null)
        .cast<Map<String, dynamic>>()
        .toList();

    final preservedFilters = state.exploreList.where((item) =>
        ['today', 'weekend', 'date'].contains(item['id']) &&
        item['isSelected']);

    final updatedMainExploreList = state.mainExploreList
        .where((item) =>
            !['today', 'weekend', 'date'].contains(item['id']) ||
            !preservedFilters.any((pf) => pf['id'] == item['id']))
        .toList();

    final tempExploreList = [
      ...newFilters,
      ...preservedFilters,
      ...updatedMainExploreList
    ];

    for (int i = 0; i < tempExploreList.length; i++) {
      if (tempExploreList[i]['id'] == 'sort') {
        tempExploreList[i] = {
          ...tempExploreList[i],
          'isSelected': sortFilter.isApplied,
        };
      }
    }

    // Sort the category filter values at the end
    if (categoryFilterIndex != -1) {
      final sortedCategoryValues = List<FilterValueDto>.from(
          filters[categoryFilterIndex].values)
        ..sort(
            (a, b) => b.isApplied == a.isApplied ? 0 : (b.isApplied ? 1 : -1));

      filters[categoryFilterIndex] =
          filters[categoryFilterIndex].copyWith(values: sortedCategoryValues);
    }

    emit(state.copyWith(
      noUse: !state.noUse,
      filters: filters,
      categoryFilter: filters[categoryFilterIndex],
      page: 1,
      events: [],
      hasMoreEvents: true,
      exploreList: tempExploreList,
      sortDisplayName: sortDisplayName,
    ));

    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => getEvents(eventsFrom: 'filters'));
  }

  void updateFilterToSelectedDates({required bool apply}) async {
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

    if (!apply) {
      emit(state.copyWith(isSpecificDateFilterApplied: false));
      restoreEvents();
      //  await onPullToRefresh();
    } else {
      final dates = state.selectedDates;
     // print('Selected dates: $dates');

      if (state.isThisWeekendFilterApplied || state.isTodayFilterApplied) {
        emit(state.copyWith(events: state.cachedEvents));
      }

      final filteredEvents = state.events.where((event) {
        final startDate = DateTime.tryParse(event.startDate);
        if (startDate == null) return false;
     //   print(startDate);

        // Check if the event's start date falls on any of the selected dates
        return dates.any((date) =>
            startDate.year == date.year &&
            startDate.month == date.month &&
            startDate.day == date.day);
      }).toList();
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
          cachedEvents: state.events,
          exploreList: updatedExploreList,
          noFilteredEvents: true,
          isTodayFilterApplied: false,
          isThisWeekendFilterApplied: false,
          isSpecificDateFilterApplied: true));
    }
  }

  void updateSelectedDates(List<DateTime> selectedDates) {
    emit(state.copyWith(selectedDates: selectedDates));
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

  void onMute() {
    emit(state.copyWith(isVideoMute: !state.isVideoMute));
  }
}
