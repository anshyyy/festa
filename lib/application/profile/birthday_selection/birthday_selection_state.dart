part of 'birthday_selection_cubit.dart';

@freezed
class BirthdaySelectionState with _$BirthdaySelectionState {
  const factory BirthdaySelectionState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isSaveDetailsEnable,
    required DateTime selectedDate,
    required String errorMessage,
    required AppStateNotifier appStateNotifier,
    required AuthRepository authRepository,
  }) = _BirthdaySelectionState;

  factory BirthdaySelectionState.initial({
    required final AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) =>
      BirthdaySelectionState(
        noUse: false,
        isLoading: false,
        authRepository: IAuthRepository(serverUrl: serverUrl),
        appStateNotifier: appStateNotifier,
        isFailed: false,
        isSuccessful: false,
        isSaveDetailsEnable: false,
        errorMessage: '',
        selectedDate: DateTime(
          2010,
          DateTime.now().month,
          DateTime.now().day,
        ),
      );
}
