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
import '../../../infrastructure/event/i_event_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final int limit = 2;
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
    getEvents();
  }

  Future getEvents() async {
    final events = await state.eventRepository.getEvents(
        lat: state.location.latitude,
        long: state.location.longitude,
        limit: limit,
        page: state.page);
    emit(state.copyWith(
        events: events, hasMoreEvents: state.events.length == limit));
  }

  void onCarouselChange({required int index}) {
    emit(state.copyWith(selectedImageIndex: index));
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

  void updateLocation({required String city}) {
    // emit(state.copyWith(city: city));
  }

  void emitFromEveryWhere({required HomeState currentState}) {
    emit(currentState);
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
        noUse: !state.noUse, filters: filters, categoryFilter: categoryFilter));
  }
}
