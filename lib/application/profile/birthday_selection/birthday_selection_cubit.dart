import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'birthday_selection_state.dart';
part 'birthday_selection_cubit.freezed.dart';

class BirthdaySelectionCubit extends Cubit<BirthdaySelectionState> {
  BirthdaySelectionCubit(super.initialState);

  //emit from anywhere
  void emitFromAnywhere({required BirthdaySelectionState state}) {
    emit(state);
  }

  //select date
  void selectedDate(DateTime newDateTime) {
    emit(state.copyWith(selectedDate: newDateTime));
  }

  //continue
  void onContinue() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormatter.format(state.selectedDate);
    final response =
        await state.userRepository.patchProfile(input: {'dob': formattedDate});

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
}
