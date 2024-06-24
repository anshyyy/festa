part of 'starter_cubit.dart';

@freezed
class StarterState with _$StarterState {
  const factory StarterState({
    required bool isLoading,
    required bool isTermsAndConditionChecked,
    required bool isOnboardingComplete,
  }) = _StarterState;

  factory StarterState.initial() {
    return const StarterState(
      isLoading: false,
      isTermsAndConditionChecked: false,
      isOnboardingComplete: false,
    );
  }
}
