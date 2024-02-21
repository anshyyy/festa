part of 'gender_selection_cubit.dart';

@freezed
class GenderSelectionState with _$GenderSelectionState {
  const factory GenderSelectionState({
    required bool isFailed,
    required bool isSuccessful,
    required bool isLoading,
    required bool isSaveEnable,
    required List<String> lsOFSex,
    required List<String> lsOFSexValue,
    required bool isSaveDetailsEnable,
    required String errorMessage,
    required AppStateNotifier appStateNotifier,
    required AuthRepository authRepository,
        int? selectedSex,

  }) = _GenderSelectionState;

  factory GenderSelectionState.initial({
    required final AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) =>
     GenderSelectionState(
          isFailed: false,
          isSuccessful: false,
          isLoading: false,
          isSaveDetailsEnable: false,
          isSaveEnable: false,
          lsOFSex: ['Woman', 'Man', 'Nonbinary'],
          lsOFSexValue: ['female', 'male', 'other'],
          authRepository: IAuthRepository(serverUrl: serverUrl),
          appStateNotifier: appStateNotifier,
          errorMessage: '');
}
