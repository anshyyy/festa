import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'add_username_state.dart';
part 'add_username_cubit.freezed.dart';

class AddUsernameCubit extends Cubit<AddUsernameState> {
  AddUsernameCubit(super.initialState);

  void onUsernameChange({required String username}) {}

  void addUserName() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await state.userRepository.patchProfile(input: {
      'username': state.usernameInputController.text,
    });

    response.fold((l) {
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
        isUpdateEnabled: true,
      ));
    });
  }
}
