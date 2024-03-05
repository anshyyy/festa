part of 'date_of_birth_settings_cubit.dart';

@freezed
class DateOfBirthSettingsState with _$DateOfBirthSettingsState {
  const factory DateOfBirthSettingsState({
    required bool openDatePicker,
    required DateTime selectedDate,
    required DateTime updatedDate,
  }) = _DateOfBirthSettingsState;
  factory DateOfBirthSettingsState.initial() => DateOfBirthSettingsState(
        openDatePicker: false,
        selectedDate: DateTime(
          2010,
          DateTime.now().month,
          DateTime.now().day,
        ),
        updatedDate: DateTime(
          2010,
          DateTime.now().month,
          DateTime.now().day,
        ),
      );
}
