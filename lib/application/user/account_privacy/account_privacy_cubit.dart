import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'account_privacy_state.dart';
part 'account_privacy_cubit.freezed.dart';

class AccountPrivacyCubit extends Cubit<AccountPrivacyState> {
  AccountPrivacyCubit(super.initialState);

  void switchAccount({required bool isPrivate}) async {
    emit(state.copyWith(isPrivate: isPrivate));
    final response = await state.userRepository
        .patchProfile(input: {'isPrivateAccount': isPrivate});
    response.fold((l) => null, (r) {
      emit(state.copyWith(user: r));
    });
  }
}
