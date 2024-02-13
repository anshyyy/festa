part of 'birthdateselection_cubit.dart';

@freezed
class BirthdateselectionState with _$BirthdateselectionState {
  const factory BirthdateselectionState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isSaveDetailsEnable,
    required DateTime selectedDate,
  }) = _BirthdateselectionState;

  factory BirthdateselectionState.initial() => BirthdateselectionState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        isSaveDetailsEnable: false,
        selectedDate: DateTime.now(),
      );
}
