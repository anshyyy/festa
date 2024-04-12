import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
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
import '../../../presentation/home/widgets/dropdown_panel.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final int limit = 10;
  bool isFetching = false;
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
    state.scrollController.addListener(() {
      final double maxScroll = state.scrollController.position.maxScrollExtent;
      final double currentScroll = state.scrollController.position.pixels;
      const double delta = 50;
      if (maxScroll - currentScroll <= delta) {
        if (state.hasMoreEvents) {
          if (!isFetching) {
            isFetching = true;
            getEvents();
          }
        }
      }
    });
    getEvents();
  }

  Future onPullToRefresh() async {
    emit(state.copyWith(isLoading: true));

  await  getEvents();

    emit(state.copyWith(isLoading: false));

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

  void updateLocation({required LocationDto location}) {
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
    getEvents(eventsFrom: 'location');
  }

  void removeAppliedFilter({required String id}) {
    List<FilterDto> filters = List.from(state.filters.map((e) {
      if (e.name == id) {
        return e.copyWith(
            isApplied: false,
            values: e.values.map((e) => e.copyWith(isApplied: false)).toList());
      }
      return e;
    }));
    updateFilterApplied(filters: filters);
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

    final appliedFilter = filters.where(
        (element) => (element.isApplied == true && element.name != 'sort'));

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

  void onSearchChange({bool isSearchOn = true}) {
    emit(state.copyWith(page: 1));
    if (isSearchOn) {
      getEvents();
    } else {
      state.searchController.clear();
      toggleSearch(flag: false);
      getEvents();
    }
  }

  void onLocationSearchChange({required String query}) async {
    emit(state.copyWith(isLocationSearchChanged: query.isNotEmpty));
    final locationSuggestions =
        await state.locationRepository.getLocationSuggestions(query: query);
    emit(state.copyWith(suggestions: locationSuggestions));
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
}
