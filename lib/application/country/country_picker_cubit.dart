import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/country_info.dart';

part 'country_picker_state.dart';
part 'country_picker_cubit.freezed.dart';

class CountryPickerCubit extends Cubit<CountryPickerState> {
  CountryPickerCubit(super.initialState);

  void searchCountry({required String keyword}) {
    List<Map<String, dynamic>> temp = keyword == ''
        ? state.countryList
        : state.countryList
            .sublist(1)
            .where(
              (element) =>
                  element['name']
                      .toString()
                      .toLowerCase()
                      .startsWith(keyword.toLowerCase()) ||
                  element['locale']
                      .toString()
                      .toLowerCase()
                      .startsWith(keyword.toLowerCase()) ||
                  element['dial_code']
                      .toString()
                      .toLowerCase()
                      .replaceAll('+', '')
                      .startsWith(keyword.toLowerCase()),
            )
            .toList();
    emit(state.copyWith(tempCountryList: temp));
  }
}
