import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthdateselection_state.dart';
part 'birthdateselection_cubit.freezed.dart';

class BirthdateselectionCubit extends Cubit<BirthdateselectionState> {
  BirthdateselectionCubit(super.initialState);

  //emit from anywhere
  void emitFromAnywhere({required BirthdateselectionState state}) {
    emit(state);
  }

  //select date
  void selectedDate(DateTime newDateTime) {
    emit(state.copyWith(selectedDate: newDateTime));
  }

  //continue
  void onContinue() async {
    // if (state.selectedDate != null) {
    //   emit(state.copyWith(
    //     isFailed: true,
    //     isLoading: false,
    //     isSuccessful: false,
    //   ));
    // } else {
    //   emit(state.copyWith(
    //     isLoading: true,
    //   ));
    //   await Future.delayed(const Duration(seconds: 5));
    //   emit(state.copyWith(
    //     isFailed: false,
    //     isLoading: false,
    //     isSuccessful: true,
    //   ));
    // }
  }
}
