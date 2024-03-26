import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/core_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/i_core_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(super.initialState);

  void init() async {
    emit(state.copyWith(isLoading: true));
    fetchUserDetails(id: state.userId);
    // emit(state.copyWith(isLoading: false, user: user!));
  }

  void fetchUserDetails({required int id}) async {
    final response = await state.userRepository.fetchUserDetails(userId: id);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailed: true,
        isSuccessful: false,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isFailed: false,
        isSuccessful: true,
        user: r,
        profileImage: r.profileImage,
        coverImage: r.coverImage,
        isFollowing: r.extraDetailsDto!.isFollowing,
      ));
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

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isSuccessful: false,
        isFailed: true,
        coverImage: res,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        coverImage: res,
        isSuccessful: true,
        isFailed: false,
        user: r,
      ));
    });
  }

  void expandQrView() {
    emit(state.copyWith(qrExpandedView: !state.qrExpandedView));
  }

  void followUser({
    required int id,
  }) async {
    state.userRepository.followUser(userId: id);
    emit(state.copyWith(isFollowing: true));
  }

  void unFollowUser({
    required int id,
  }) async {
    state.userRepository.unFollowUser(userId: id);
    emit(state.copyWith(isFollowing: false));
  }
}
