import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/auth_repository.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/user/user_repository.dart';
import '../../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../../infrastructure/auth/i_auth_repository.dart';
import '../../../../infrastructure/user/i_user_repository.dart';

part 'gender_selection_state.dart';
part 'gender_selection_cubit.freezed.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit(super.initialState);
  //emit from anywhere
  void emitFromAnywhere({required GenderSelectionState state}) {
    emit(state);
  }

  void init({String? gender}) {
    emit(state.copyWith(
        selectedSex:
            state.lsOFSexValue.indexWhere((element) => element == gender)));
  }

  // on add patient
  void onContinue() async {
    final sex = state.lsOFSexValue[state.selectedSex!].trim();
    emit(state.copyWith(
      isLoading: true,
    ));
    final response =
        await state.userRepository.patchProfile(input: {'gender': sex});

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

  void onSexSelect(int selectedSex) async {
    emit(state.copyWith(
      selectedSex: selectedSex,
    ));
    final response = await state.userRepository.patchProfile(input: {
      'gender': state.lsOFSexValue[state.selectedSex!].trim().toLowerCase()
    });

    response.fold((l) {
      emit(state.copyWith(
        // selectedSex: selectedSex,
        genderUpdateSuccess: false,
        genderUpdateFailure: true,
        // isSaveDetailsEnable:true,
      ));
    }, (r) {
      emit(state.copyWith(
        selectedSex: selectedSex,
        genderUpdateSuccess: true,
        genderUpdateFailure: false,
        user: r,
        isSaveDetailsEnable:true,
      ));
    });
  }
}
