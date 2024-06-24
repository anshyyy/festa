import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/configs/app_config.dart';
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

  void initOtherUserProfile({required int userId}) async {
    emit(state.copyWith(isLoading: true, userId: userId));
    fetchUserDetails(id: userId);
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
        isBlocked: r.extraDetailsDto!.isBlocked,
        isFollowing: r.extraDetailsDto!.isFollowing,
      ));
    });
  }

  void onSelectCoverImage() async {
    emit(state.copyWith(isLoading: true));
    final fileReponse = await state.coreRepository.selectImage();
    fileReponse.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }, (r) async {
      if (r == null) return;
      final res = await state.coreRepository.uploadFile(file: r);
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
    });
    // final res = await state.coreRepository.uploadFileToUserLocation(file: file);
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

  void blockUser() async {
    emit(state.copyWith(isBlocked: true));

    await state.userRepository.block(id: state.userId.toString(), type: 'user');
  }

  void unblockUser() async {
    emit(state.copyWith(isBlocked: false));
    await state.userRepository
        .unBlock(id: state.userId.toString(), type: 'user');
  }

  void emitFromAnywhere({required UserProfileState state}) {
    emit(state);
  }
}
