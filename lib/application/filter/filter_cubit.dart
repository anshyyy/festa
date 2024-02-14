import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  void onFilterChanged({required String filterValue}) {
   final options = state.filtersList.firstWhere(
      (filter) => filter['name'].toString().toLowerCase() == filterValue.toLowerCase()
    );
    List<Map<String, dynamic>> optionValues = [];

    if(options!=null){
      optionValues  = options['values'];
    }
    emit(state.copyWith(filterOptions: optionValues, currentFilter: filterValue));
  }
}
