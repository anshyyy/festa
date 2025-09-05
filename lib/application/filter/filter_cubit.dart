import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(super.initialState);

  void init() {
    final anyFilterSelected = state.filters.any((element) => element.isApplied);
    emit(state.copyWith(isFilterSelected: anyFilterSelected));
    onFilterChanged(filterValue: 'sort');
  }

  void onFilterChanged({required String filterValue}) {
    final filter = state.filters
        .firstWhere((filter) => filter.name == filterValue.toLowerCase());
    emit(state.copyWith(
        isLoading: false,
        filterValues: filter.values,
        currentActive: filterValue));
  }

  void onOptionChange({required String optionId}) {
  // Emit state to indicate that a filter option is being selected
  emit(state.copyWith(isFilterOptionSelected: true));

  // Find the index of the option in filterValues
  final indexOfOption = state.filterValues
      .indexWhere((filterValue) => filterValue.displayName == optionId);

  // Iterate through all filter values
  for (int i = 0; i < state.filterValues.length; i++) {
    if (indexOfOption == i) {
      // Check if the name is 'event_category.id'
      if (state.filterValues[i].name == 'event_category.id') {
        // Toggle 'isApplied' if it is 'event_category.id'
        bool currentApplied = state.filterValues[i].isApplied;
        state.filterValues[i] =
            state.filterValues[i].copyWith(isApplied: !currentApplied);
      } else {
        // Apply the selected option
        state.filterValues[i] = state.filterValues[i].copyWith(isApplied: true);
      }
      continue;
    }

    // Unselect other filter values that are not 'event_category.id'
    if (state.filterValues[i].name != 'event_category.id') {
      state.filterValues[i] =
          state.filterValues[i].copyWith(isApplied: false);
    }
  }

  // Update the specific filter as applied
  final index = state.filters.indexWhere(
      (filter) => filter.name == state.currentActive.toLowerCase());
  state.filters[index] = state.filters[index].copyWith(isApplied: true);

  // Emit the updated state to trigger UI changes
  emit(state.copyWith(noUse: !state.noUse));
}


  void emitFromEveryWhere({required FilterState currentState}) {
    emit(currentState);
  }

  void clearFilters() {
    emit(state.copyWith(isFilterSelected: false));
    List<FilterDto> filters = List.from(state.filters.map((e) => e.copyWith(
        isApplied: false,
        values: e.values
            .map((e) => e.copyWith(isApplied: false))
            .toList()))).map((e) => e as FilterDto).toList();
    emit(state.copyWith(
      filters: filters,
      noUse: !state.noUse,
    ));
    onFilterChanged(
      filterValue: 'sort',
    );
  }
}
