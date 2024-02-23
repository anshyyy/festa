import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState);

  void deleteAccount() async {
    emit(state.copyWith(isLoading: true));
    final isDelete =
        await state.authRepository.deleteProfile(id: state.user!.id);
    emit(state.copyWith(
      isLoading: false,
      isAccountDelete: isDelete,
      isFailure: !isDelete,
      responseMsg: isDelete
          ? UserProfileScreenConstants.accountDeleted
          : UserProfileScreenConstants.accountDeletionFailed,
    ));
  }

  void logout() async {
    emit(state.copyWith(isLoading: true));

    final isLogoutSuccessfully = await state.authRepository.logout();
    emit(state.copyWith(
      isLogout: isLogoutSuccessfully,
      isFailure: !isLogoutSuccessfully,
      responseMsg: UserProfileScreenConstants.logoutSuccess,
    ));
  }

  void emitFromAnywhere({required ProfileState state}) {
    emit(state);
  }
}
