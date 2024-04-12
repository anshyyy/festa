import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/core/core_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/i_core_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
    fetchUserDetails(id: state.userId);
  }

  void fetchUserDetails({required int id}) async {
    final response = await state.userRepository.fetchUserDetails(userId: id);
    response.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }, (r) {
      state.nameEditingController.text = r.fullName;
      state.bioTextController.text = r.description;
      emit(
        state.copyWith(
          isLoading: false,
          user: r,
          coverImageUrl: r.coverImage,
          profileImageUrl: r.profileImage,
        ),
      );
    });
  }

  void onSelectCoverImage() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();
    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) return;
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          isFailure: false,
          coverImageUrl: res,
          isSaveEnabled: true,
        ),
      );
    });
  }

  void onProfileImageChange() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.coreRepository.selectImage();

    response.fold((l) {
      if (l == PermissionStatus.permanentlyDenied) {
        // showpopup
      }
    }, (r) async {
      if (r == null) return;
      emit(state.copyWith(
        isLoading: true,
      ));
      final res = await state.coreRepository.uploadFile(file: r);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        profileImageUrl: res,
        isSaveEnabled: true,
      ));
    });
  }

  void onNameChange() {
    if (!state.isSaveEnabled) {
      emit(state.copyWith(isSaveEnabled: true));
    }
  }

  void onBioChange() {
    if (!state.isSaveEnabled) {
      emit(state.copyWith(isSaveEnabled: true));
    }
  }

  void onSave() async {
    emit(state.copyWith(isLoading: true));
    Map<String, dynamic> patchObj = {
      'profileImage': state.profileImageUrl,
      'coverImage': state.coverImageUrl,
      'description': state.bioTextController.text,
      'fullName': state.nameEditingController.text,
    };

    final response = await state.userRepository.patchProfile(input: patchObj);

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        user: r,
        coverImageUrl: r.coverImage,
        profileImageUrl: r.profileImage,
        isSaveEnabled: false,
      ));
    });
  }
}
