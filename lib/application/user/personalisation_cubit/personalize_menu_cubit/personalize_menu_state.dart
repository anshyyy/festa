part of 'personalize_menu_cubit.dart';

@freezed
class PersonalizeMenuState with _$PersonalizeMenuState {
  const factory PersonalizeMenuState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<PersonalizationOptionDto> menuOptionsList,
  }) = _PersonalizeMenuState;

  factory PersonalizeMenuState.initial({
    required List<PersonalizationOptionDto> menuOptionsList,
  }) => PersonalizeMenuState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        menuOptionsList: menuOptionsList,
      );
}
