import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';

part 'username_settings_state.dart';
part 'username_settings_cubit.freezed.dart';

class UsernameSettingsCubit extends Cubit<UsernameSettingsState> {
  UsernameSettingsCubit() : super(UsernameSettingsState.initial());

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
}
