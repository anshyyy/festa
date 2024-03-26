import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'username_settings_state.dart';
part 'username_settings_cubit.freezed.dart';

class UsernameSettingsCubit extends Cubit<UsernameSettingsState> {
  UsernameSettingsCubit(super.initialState);

  void clearTextField() {
    state.usernameInputController.clear();
    emit(state.copyWith(noUse: !state.noUse));
  }

  void hasError({required bool errorFlag}) {
    emit(state.copyWith(hasError: errorFlag));
  }

  void showUsernameErrorToast() {
    Fluttertoast.showToast(
      msg: UsernameSettingsScreenConstants.userNameIsntAvailable,
      gravity: ToastGravity.CENTER,
      fontSize: 15.sp,
    );
  }

  void showUsernameSuccessToast() {
    Fluttertoast.showToast(
      msg: UsernameSettingsScreenConstants.userNameUpdated,
      gravity: ToastGravity.CENTER,
      fontSize: 15.sp,
    );
  }

  void onUsernameChange({required String text}) {
    emit(state.copyWith(isUpdateEnabled: text.length > 2 && text!=state.currentUsername));
  }

  void onUpdateUsername() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.userRepository.patchProfile(input: {
      'tag': {
        'tag': state.usernameInputController.text,
      }
    });
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isUsernameUpdateFailure: true,
        isUsernameUpdateSuccess: false,
      ));
      showUsernameErrorToast();
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        user: r,
        isUsernameUpdateFailure: false,
        isUsernameUpdateSuccess: true,
      ));
      showUsernameSuccessToast();
    });
  }
}
