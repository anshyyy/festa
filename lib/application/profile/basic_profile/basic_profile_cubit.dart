import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/core_repository.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';
import '../../../infrastructure/core/i_core_repository.dart';

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
    final file = await state.coreRepository.selectImage();

    // Error needs here
    if (file == null) return;
    emit(state.copyWith(
      isLoading: true,
    ));
    final res = await state.coreRepository.uploadFileToUserLocation(file: file);
    emit(res.fold(
        (l) => state.copyWith(
              isLoading: false,
            ), (r) {
      return state.copyWith(
        profileImage: r,
        isLoading: false,
      );
    }));
  }

  Future<void> onContinue() async {
    String fullName = state.fullNameController.text;
    String profileImage = state.profileImage ?? '';
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await state.authRepository.patchProfile(input: {
      'fullName': fullName,
      'profileImage': profileImage,
    });

    emit(response.fold(
        (l) => state.copyWith(
              errorMessage: l,
              isFailed: true,
              isLoading: false,
            ), (r) {
      state.appStateNotifier.user = r;
      return state.copyWith(
        isSuccessful: true,
        isLoading: false,
      );
    }));
  }
}
