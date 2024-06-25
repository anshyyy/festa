import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/core_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';
import '../../../infrastructure/core/i_core_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

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
    final response = await state.coreRepository.selectImage();

    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup

        emit(state.copyWith(
        showPermissionDialog: true,
        noUse: !state.noUse,
      ));
      }
    }, (r) async {
      if (r == null) return;
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(state.copyWith(
        profileImage: res,
        isLoading: false,
        showPermissionDialog: false,
      ));
    });

    // Error needs here
  }

  Future<void> onContinue() async {
    String fullName = state.fullNameController.text;
    String profileImage = state.profileImage ?? '';
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await state.userRepository.patchProfile(input: {
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
