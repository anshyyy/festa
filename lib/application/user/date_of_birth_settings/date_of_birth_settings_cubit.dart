import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/helpers/generic_helpers.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'date_of_birth_settings_cubit.freezed.dart';
part 'date_of_birth_settings_state.dart';

class DateOfBirthSettingsCubit extends Cubit<DateOfBirthSettingsState> {
  DateOfBirthSettingsCubit(super.initialState);

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

  void saveDateOfBirth() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.userRepository.patchProfile(input: {
      'dob': StringExtension.formatDateTimeWithDash(state.selectedDate),
    });
    response.fold((l) {
      emit(state.copyWith(
        openDatePicker: false,
        isLoading: false,
      ));
    }, (r) async {
      final user = await state.userRepository.fetchUserByToken();
      emit(state.copyWith(
        updatedDate: state.selectedDate,
        openDatePicker: false,
        isLoading: false,
        user: user,
      ));
    });
  }
}
