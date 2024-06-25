import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'add_username_state.dart';
part 'add_username_cubit.freezed.dart';

class AddUsernameCubit extends Cubit<AddUsernameState> {
  AddUsernameCubit(super.initialState);

  void onUsernameChange({required String username}) {
    emit(state.copyWith(isUpdateEnabled: username.length > 3));
  }

  void clearTextField() {
    state.usernameInputController.clear();
    emit(state.copyWith(noUse: !state.noUse));
  }

  void addUserName() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await state.userRepository.patchProfile(input: {
      'tag': {'tag': state.usernameInputController.text},
    });

    response.fold((l) {
       Fluttertoast.showToast(
      msg: UsernameSettingsScreenConstants.userNameIsntAvailable,
      gravity: ToastGravity.CENTER,
      fontSize: 15.sp,
    );
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        isUpdateEnabled: false,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        user: r,
      ));
    });
  }
}
