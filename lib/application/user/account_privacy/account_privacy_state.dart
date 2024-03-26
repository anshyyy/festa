part of 'account_privacy_cubit.dart';

@freezed
class AccountPrivacyState with _$AccountPrivacyState {
  const factory AccountPrivacyState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool isPrivate,
    required UserRepository userRepository,
    UserDto? user,
  }) = _AccountPrivacy;
  factory AccountPrivacyState.initial({
    required String serverUrl,
    required bool isPrivate,
  }) =>
      AccountPrivacyState(
          isPrivate: isPrivate,
          isLoading: false,
          isFailure: false,
          isSuccess: false,
          userRepository: IUserRepository(serverUrl: serverUrl));
}
