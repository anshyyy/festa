part of 'email_cubit.dart';

@freezed
class EmailState with _$EmailState {
  const factory EmailState({
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required bool isOtpSent,
    required bool hasValidationError,
    required TextEditingController emailTextController,
    required UserRepository userRepository,
  }) = _EmailState;
  factory EmailState.initial({required String serverUrl}) => EmailState(
     isLoading: false,
        isFailure: false,
        isSuccess: false,
        isOtpSent: false,
        hasValidationError: false,
        emailTextController: TextEditingController(),
        userRepository: IUserRepository(serverUrl: serverUrl),
      );
}
