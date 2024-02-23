import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(super.initialState);

  void onFilterChanged({required String filterValue}) {
    final filter = state.filters
        .firstWhere((filter) => filter.name == filterValue.toLowerCase());
    emit(state.copyWith(
        isLoading: false,
        filterValues: filter.values,
        currentActive: filterValue));
  }

  void onOptionChange({required String optionId}) {
    final indexOfOption = state.filterValues
        .indexWhere((filterValue) => filterValue.displayName == optionId);
    for (int i = 0; i < state.filterValues.length; i++) {
      if (indexOfOption == i) {
        state.filterValues[i] = state.filterValues[i].copyWith(isApplied: true);
        continue;
      }
      state.filterValues[i] = state.filterValues[i].copyWith(isApplied: false);
    }
    final index = state.filters.indexWhere(
        (filter) => filter.name == state.currentActive.toLowerCase());
    state.filters[index] = state.filters[index].copyWith(isApplied: true);
    emit(state.copyWith(noUse: !state.noUse));
  }

  void emitFromEveryWhere({required FilterState currentState}) {
    emit(currentState);
  }

  
  void clearFilters() {
    emit(state.copyWith(isClearFilters: true));
    List<FilterDto> filters = List.from(state.filters.map((e) => e.copyWith(
        isApplied: false,
        values: e.values
            .map((e) => e.copyWith(isApplied: false))
            .toList()))).map((e) => e as FilterDto).toList();
    emit(state.copyWith(filters: filters, noUse: !state.noUse));
    onFilterChanged(filterValue: 'sort');
  }
}
