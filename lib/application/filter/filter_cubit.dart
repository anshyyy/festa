import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  void onFilterChanged({required String filterValue}) {
    final options = state.filtersList.firstWhere((filter) =>
        filter['name'].toString().toLowerCase() == filterValue.toLowerCase());
    List<Map<String, dynamic>> optionValues = [];

    if (options != null) {
      optionValues = options['values'];
    }
    emit(state.copyWith(
        filterOptions: optionValues, currentFilter: filterValue));
  }

  void onOptionChange({required String optionId}) {
    List<Map<String,dynamic>> all = List<Map<String,dynamic>>.from(state.filterOptions);
    List<Map<String, dynamic>> updated = all.map((e) {
      e=Map<String, dynamic>.from(e);
      if(e['id']==optionId){
        e['isSelected']= true;
      }else{
        e['isSelected']= false;
      }
      return e;
    }).toList();

    List<Map<String,dynamic>> allFilters = List.from(state.filtersList);
    final index = allFilters.indexWhere((element) => element['name']==state.currentFilter);
    allFilters[index] = Map<String, dynamic>.from(allFilters[index]);
    allFilters[index]['values'] = updated;

    emit(state.copyWith(filtersList: allFilters, noUse: !state.noUse,filterOptions: updated));
  }
}
