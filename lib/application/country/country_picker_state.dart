part of 'country_picker_cubit.dart';

@freezed
class CountryPickerState with _$CountryPickerState {
  const factory CountryPickerState({
    required String selectedCountryDialCode,
    required String selectedCountryLocale,
    required String searchText,
    required List<Map<String, dynamic>> countryList,
    required List<Map<String, dynamic>> tempCountryList,
  }) = _CountryPickerState;

  factory CountryPickerState.initial() => CountryPickerState(
      selectedCountryDialCode: '',
      selectedCountryLocale: '',
      searchText: '',
      countryList: country,
      tempCountryList: country);
}
