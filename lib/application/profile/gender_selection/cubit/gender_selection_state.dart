part of 'gender_selection_cubit.dart';

@freezed
class GenderSelectionState with _$GenderSelectionState {
  const factory GenderSelectionState({
    required bool isFailed,
    required bool isSuccessful,
    required bool isLoading,
    required bool isSaveEnable,
    required List<String> lsOFSex,
    required String sex,
    required int selectedSex,
  }) = _GenderSelectionState;

  factory GenderSelectionState.initial() => const GenderSelectionState(
        isFailed: false,
        isSuccessful: false,
        isLoading: false,
        isSaveEnable: false,
        lsOFSex: ['Woman', 'Man', 'Nonbinary '],
        selectedSex: 0,
        sex: '',
      );
}
