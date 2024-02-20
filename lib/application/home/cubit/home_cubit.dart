import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/event/event_repository.dart';
import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';
import '../../../infrastructure/event/i_event_repository.dart';

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

  Future getEvents() async {
    String? sort;
    int? range;
    String? otherFilters;
    final filters = state.filters;
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
      range: range,
      otherFilters: otherFilters,
    );
    state.events.addAll(events);
    isFetching = false;
    emit(state.copyWith(
      noUse: !state.noUse,
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
        page: 1));
    getEvents();
  }

  void updateFilterApplied({required List<FilterDto> filters}) {
    final sortApplied =
        filters.firstWhere((element) => element.name == 'sort').isApplied;
    final categoryFilter =
        filters.firstWhere((element) => element.name == 'music');
    for (int i = 0; i < state.exploreList.length; i++) {
      if (state.exploreList[i]['id'] == 'sort') {
        state.exploreList[i] = {
          ...state.exploreList[i],
          'isSelected': sortApplied
        };
      }
    }
    emit(state.copyWith(
        noUse: !state.noUse,
        filters: filters,
        categoryFilter: categoryFilter,
        page: 1,
        events: [],
        hasMoreEvents: true));
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => getEvents());
  }

  void emitFromEveryWhere({required HomeState currentState}) {
    emit(currentState);
  }
}
