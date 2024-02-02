import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_selection_state.dart';
part 'gender_selection_cubit.freezed.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit(super.initialState);

  // on add patient
  void onContinue() {
    final sex = state.lsOFSex[state.selectedSex].toUpperCase();

    emit(state.copyWith(
      sex: sex,
    ));
  }

  void onSexSelect(int selectedSex) {
    emit(state.copyWith(selectedSex: selectedSex));
  }
}
