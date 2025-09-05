import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/auth_repository.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/user/user_repository.dart';
import '../../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../../infrastructure/auth/i_auth_repository.dart';
import '../../../../infrastructure/user/i_user_repository.dart';

part 'gender_selection_cubit.freezed.dart';
part 'gender_selection_state.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit(super.initialState);
  //emit from anywhere
  void emitFromAnywhere({required GenderSelectionState state}) {
    emit(state);
  }

  void init({String? gender}) {
    //  print(" this is the init state ${state.userGender}");
    int indexOfUserGender =
        state.lsOFSexValue.indexWhere((e) => e == state.userGender);
    emit(state.copyWith(selectedSex: indexOfUserGender));
  }

  // on add patient
  void onContinue() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await state.userRepository.patchProfile(input: {
      'gender': state.lsOFSexValue[state.selectedSex!].trim().toLowerCase()
    });

    response.fold((l) {
      emit(state.copyWith(
        errorMessage: l,
        isFailed: true,
        isLoading: false,
        genderUpdateSuccess: false,
        genderUpdateFailure: true,
        // isSaveDetailsEnable:true,
      ));
    }, (r) {
      int indexofGender = state.lsOFSexValue.indexOf(r.gender);
      // print("this is user gender ${r.gender} $indexofGender");
      emit(state.copyWith(
        genderUpdateSuccess: true,
        genderUpdateFailure: false,
        user: r,
        selectedSex: indexofGender == -1 ? 2 : indexofGender,
        isSaveDetailsEnable: true,
        isSuccessful: true,
        isLoading: false,
      ));
    });
  }

  void onSelectGender(String gender) {
    int indexOfSelected = state.lsOFSex.indexOf(gender);
    if (indexOfSelected == -1) {
      emit(state.copyWith(errorMessage: "gender not found"));
    }
    emit(state.copyWith(
        selectedSex: indexOfSelected,
        userGender: state.lsOFSex[indexOfSelected],
        isSaveDetailsEnable: true));
    //onContinue();
  }

  void onSexSelect(int selectedSex) async {
    emit(state.copyWith(
      selectedSex: selectedSex,
      isSaveDetailsEnable: true,
    ));
  }
}
