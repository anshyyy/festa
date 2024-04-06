import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'starter_state.dart';
part 'starter_cubit.freezed.dart';

class StarterCubit extends Cubit<StarterState> {
  StarterCubit(super.initialState);

  void emitFromAnywhere({required StarterState state}) {
    emit(state);
  }

  void completeOnboarding() {
    emit(
      state.copyWith(
        isOnboardingComplete: true,
      ),
    );
  }

  void onTermsAndConditionChecked() => emit(state.copyWith(
      isTermsAndConditionChecked: !state.isTermsAndConditionChecked));
}
