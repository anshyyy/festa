import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_of_birth_settings_state.dart';
part 'date_of_birth_settings_cubit.freezed.dart';

class DateOfBirthSettingsCubit extends Cubit<DateOfBirthSettingsState> {
  DateOfBirthSettingsCubit() : super(DateOfBirthSettingsState.initial());

  void openDatePicker() {
    emit(state.copyWith(
      openDatePicker: !state.openDatePicker,
    ));
  }

  void onBirthDateChanged(DateTime selectedDate) {
    emit(state.copyWith(
      selectedDate: selectedDate,
    ));
  }

  void saveDateOfBirth() {
    emit(state.copyWith(
      updatedDate: state.selectedDate,
      openDatePicker: false,
    ));
  }
}
