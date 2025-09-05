import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/user/dtos/blocked_users/blocked_users.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'account_settings_state.dart';
part 'account_settings_cubit.freezed.dart';

class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  AccountSettingsCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
    fetchUserDetails(id: state.userId);
    
  }

  void fetchBlockedUsers() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.userRepository.getBlockedUsers();
    emit(state.copyWith(blockedUsers: response, isLoading: false));
  }

  void unblockUser({required int id,required String type}) async {
    final response = await state.userRepository.unblockUser(id: id, type: type);
    response.fold((l) {}, (r) {
      fetchBlockedUsers();
    });
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
}
