part of 'basic_profile_cubit.dart';

@freezed
class BasicProfileState with _$BasicProfileState {
  const factory BasicProfileState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isSaveDetailsEnable,
    required String errorMessage,
    required String errorProfileImageFile,
    required File? profileImageFile,
    required AppStateNotifier appStateNotifier,
    required AuthRepository authRepository,
    required TextEditingController fullNameController,
    required String errorFullName,
  }) = _BasicProfileState;

  factory BasicProfileState.initial({
    required final AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) =>
      BasicProfileState(
          noUse: false,
          isLoading: false,
          isFailed: false,
          isSuccessful: false,
          isSaveDetailsEnable: false,
          authRepository: IAuthRepository(serverBaseUrl: serverUrl),
          appStateNotifier: appStateNotifier,
          errorMessage: '',
          errorProfileImageFile: '',
          profileImageFile: null,
          fullNameController: TextEditingController(),
          errorFullName: '');
}
