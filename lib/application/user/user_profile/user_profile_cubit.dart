import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/core_repository.dart';
import '../../../infrastructure/core/i_core_repository.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(super.initialState);

  void onSelectProfileImage() async {
    emit(state.copyWith(isLoading: true));
    final file = await state.coreRepository.selectImage();
    if (file == null) return;

    final res = await state.coreRepository.uploadFileToUserLocation(file: file);
    res.fold((l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(state.copyWith(profileImage: r, isLoading: false)));
  }
}
