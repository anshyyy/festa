part of 'filter_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FilterState with _$FilterState {
  const factory FilterState({
    required bool isLoading,
    required String currentActive,
    required List<FilterDto> filters,
    required List<FilterValueDto> filterValues,
    required bool noUse,
    required bool isFilterOptionSelected,
    required bool isFilterSelected,
  }) = _FilterState;

  factory FilterState.initial({required List<FilterDto> filters}) =>
      FilterState(
        isLoading: true,
        currentActive: '',
        noUse: true,
        filters: filters,
        filterValues: [],
        isFilterOptionSelected: false,
        isFilterSelected: false,
      );
}
