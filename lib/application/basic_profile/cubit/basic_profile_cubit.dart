import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/error_constants.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';

part 'basic_profile_state.dart';
part 'basic_profile_cubit.freezed.dart';

class BasicProfileCubit extends Cubit<BasicProfileState> {
  BasicProfileCubit(super.initialState);
  //emit from anywhere
  void emitFromAnywhere({required BasicProfileState state}) {
    emit(state);
  }

  //selectProfileImage
  Future<void> onSelectProfileImage() async {
    final res = await state.authRepository.selectImage();

    emit(res.fold((l) => state.copyWith(), (r) {
      return state.copyWith(
        errorMessage: '',
        isFailed: false,
        profileImageFile: r,
        errorProfileImageFile: '',
      );
    }));
  }

  Future<void> onContinue() async {
    String fullName = state.fullNameController.text;

    if (fullName.isEmpty || state.errorFullName.isNotEmpty) {
      emit(state.copyWith(
        errorFullName: state.errorFullName.isEmpty
            ? ErrorConstants.requiredError
            : state.errorFullName,
        isFailed: true,
        isLoading: false,
        isSuccessful: false,
      ));
    } else {
      emit(state.copyWith(
        isLoading: true,
      ));
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(
        isFailed: false,
        isLoading: false,
        isSuccessful: true,
      ));
    }
  }
}
