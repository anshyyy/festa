import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/core_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/i_core_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

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
      emit(
        state.copyWith(
          isLoading: false,
          user: r,
        ),
      );
    });
  }

  void onSelectCoverImage() async {
    emit(state.copyWith(isLoading: true));
    final file = await state.coreRepository.selectImage();
    if (file == null) return;

    // final res = await state.coreRepository.uploadFileToUserLocation(file: file);
    final res = await state.coreRepository.uploadFile(file: file);
    final response =
        await state.userRepository.patchProfile(input: {'coverImage': res});

    fetchUserDetails(id: state.userId);

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        coverImageUrl: res,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        coverImageUrl: res,
        isSuccess: true,
        isFailure: false,
      ));
    });
  }

    void onProfileImageChange() async {
    emit(state.copyWith(isLoading: true));
    final file = await state.coreRepository.selectImage();
    if (file == null) return;

    // final res = await state.coreRepository.uploadFileToUserLocation(file: file);
    final res = await state.coreRepository.uploadFile(file: file);
    final response =
        await state.userRepository.patchProfile(input: {'profileImage': res});

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        profileImageUrl: res,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        profileImageUrl: res,
        isSuccess: true,
        isFailure: false,
        user: r,
      ));
    });
  }


}
