part of 'personalisation_cubit.dart';

@freezed
class PersonalisationState with _$PersonalisationState {
  const factory PersonalisationState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required List<PersonalizationMenuDto> personalizationList,
    required UserRepository userRepository,
    required int selectedGender,
  }) = _PersonalisationState;

  factory PersonalisationState.initial({
    required String serverUrl,
  }) => PersonalisationState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        selectedGender: 0,
        isSuccessful: false,
        personalizationList: [],
        userRepository: IUserRepository(serverUrl: serverUrl),
      );
}
