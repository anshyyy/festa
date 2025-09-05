part of 'date_of_birth_settings_cubit.dart';

@freezed
class DateOfBirthSettingsState with _$DateOfBirthSettingsState {
  const factory DateOfBirthSettingsState({
    required bool openDatePicker,
    required DateTime selectedDate,
    required DateTime updatedDate,
    required String currentDob,
    required UserRepository userRepository,
    UserDto? user,
    required bool isLoading,
  }) = _DateOfBirthSettingsState;
  factory DateOfBirthSettingsState.initial({
    required String dob,
    required String serverUrl,
  }) =>
      DateOfBirthSettingsState(
        openDatePicker: false,
        isLoading: false,
        selectedDate: GenericHelpers().getDatetimeFromString(dob),
        updatedDate: GenericHelpers().getDatetimeFromString(dob),
        currentDob: dob,
        userRepository: IUserRepository(
          serverUrl: serverUrl,
        ),
      );
}
