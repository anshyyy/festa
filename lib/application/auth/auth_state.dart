part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required bool loginWithApple,
    required bool loginWithGoogle,
    required bool loginWithPhone,
    required String selectedDialCode,
    required String selectedLocale,
    required TextEditingController phoneController,
    required TextEditingController otpController,
    required bool isLoginEnabled,
    required String apiBaseUrl,
    required AuthRepository authRepository,
    required bool isOTPSentFailed,
    required bool isOTPSentSuccessful,
    required bool isLoginSuccess,
  }) = _AuthState;

  factory AuthState.initial({
    required String apiBaseUrl,
  }) =>
      AuthState(
        isLoading: false,
        loginWithApple: false,
        loginWithGoogle: false,
        loginWithPhone: false,
        phoneController: TextEditingController(),
        otpController: TextEditingController(),
        selectedDialCode: country.first['dial_code'],
        selectedLocale: country.first['locale'],
        isLoginEnabled: false,
        apiBaseUrl: apiBaseUrl,
        authRepository: IAuthRepository(
          apiBaseUrl: apiBaseUrl,
        ),
        isOTPSentFailed: false,
        isOTPSentSuccessful: false,
        isLoginSuccess: false,
      );
}
