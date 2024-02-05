// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get loginWithApple => throw _privateConstructorUsedError;
  bool get loginWithGoogle => throw _privateConstructorUsedError;
  bool get loginWithPhone => throw _privateConstructorUsedError;
  String get selectedDialCode => throw _privateConstructorUsedError;
  String get selectedLocale => throw _privateConstructorUsedError;
  TextEditingController get phoneController =>
      throw _privateConstructorUsedError;
  TextEditingController get otpController => throw _privateConstructorUsedError;
  bool get isLoginEnabled => throw _privateConstructorUsedError;
  String get apiBaseUrl => throw _privateConstructorUsedError;
  AuthRepository get authRepository => throw _privateConstructorUsedError;
  bool get isOTPSentFailed => throw _privateConstructorUsedError;
  bool get isOTPSentSuccessful => throw _privateConstructorUsedError;
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  bool get isOTPVerificationFailed => throw _privateConstructorUsedError;
  bool get isOTPVerificationSuccessful => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool loginWithApple,
      bool loginWithGoogle,
      bool loginWithPhone,
      String selectedDialCode,
      String selectedLocale,
      TextEditingController phoneController,
      TextEditingController otpController,
      bool isLoginEnabled,
      String apiBaseUrl,
      AuthRepository authRepository,
      bool isOTPSentFailed,
      bool isOTPSentSuccessful,
      bool isLoginSuccess,
      bool isOTPVerificationFailed,
      bool isOTPVerificationSuccessful,
      String errorMessage});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loginWithApple = null,
    Object? loginWithGoogle = null,
    Object? loginWithPhone = null,
    Object? selectedDialCode = null,
    Object? selectedLocale = null,
    Object? phoneController = null,
    Object? otpController = null,
    Object? isLoginEnabled = null,
    Object? apiBaseUrl = null,
    Object? authRepository = null,
    Object? isOTPSentFailed = null,
    Object? isOTPSentSuccessful = null,
    Object? isLoginSuccess = null,
    Object? isOTPVerificationFailed = null,
    Object? isOTPVerificationSuccessful = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithApple: null == loginWithApple
          ? _value.loginWithApple
          : loginWithApple // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithGoogle: null == loginWithGoogle
          ? _value.loginWithGoogle
          : loginWithGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithPhone: null == loginWithPhone
          ? _value.loginWithPhone
          : loginWithPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDialCode: null == selectedDialCode
          ? _value.selectedDialCode
          : selectedDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedLocale: null == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as String,
      phoneController: null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isLoginEnabled: null == isLoginEnabled
          ? _value.isLoginEnabled
          : isLoginEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      isOTPSentFailed: null == isOTPSentFailed
          ? _value.isOTPSentFailed
          : isOTPSentFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentSuccessful: null == isOTPSentSuccessful
          ? _value.isOTPSentSuccessful
          : isOTPSentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationFailed: null == isOTPVerificationFailed
          ? _value.isOTPVerificationFailed
          : isOTPVerificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationSuccessful: null == isOTPVerificationSuccessful
          ? _value.isOTPVerificationSuccessful
          : isOTPVerificationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool loginWithApple,
      bool loginWithGoogle,
      bool loginWithPhone,
      String selectedDialCode,
      String selectedLocale,
      TextEditingController phoneController,
      TextEditingController otpController,
      bool isLoginEnabled,
      String apiBaseUrl,
      AuthRepository authRepository,
      bool isOTPSentFailed,
      bool isOTPSentSuccessful,
      bool isLoginSuccess,
      bool isOTPVerificationFailed,
      bool isOTPVerificationSuccessful,
      String errorMessage});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loginWithApple = null,
    Object? loginWithGoogle = null,
    Object? loginWithPhone = null,
    Object? selectedDialCode = null,
    Object? selectedLocale = null,
    Object? phoneController = null,
    Object? otpController = null,
    Object? isLoginEnabled = null,
    Object? apiBaseUrl = null,
    Object? authRepository = null,
    Object? isOTPSentFailed = null,
    Object? isOTPSentSuccessful = null,
    Object? isLoginSuccess = null,
    Object? isOTPVerificationFailed = null,
    Object? isOTPVerificationSuccessful = null,
    Object? errorMessage = null,
  }) {
    return _then(_$AuthStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithApple: null == loginWithApple
          ? _value.loginWithApple
          : loginWithApple // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithGoogle: null == loginWithGoogle
          ? _value.loginWithGoogle
          : loginWithGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      loginWithPhone: null == loginWithPhone
          ? _value.loginWithPhone
          : loginWithPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDialCode: null == selectedDialCode
          ? _value.selectedDialCode
          : selectedDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedLocale: null == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as String,
      phoneController: null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isLoginEnabled: null == isLoginEnabled
          ? _value.isLoginEnabled
          : isLoginEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      isOTPSentFailed: null == isOTPSentFailed
          ? _value.isOTPSentFailed
          : isOTPSentFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentSuccessful: null == isOTPSentSuccessful
          ? _value.isOTPSentSuccessful
          : isOTPSentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationFailed: null == isOTPVerificationFailed
          ? _value.isOTPVerificationFailed
          : isOTPVerificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationSuccessful: null == isOTPVerificationSuccessful
          ? _value.isOTPVerificationSuccessful
          : isOTPVerificationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.isLoading,
      required this.loginWithApple,
      required this.loginWithGoogle,
      required this.loginWithPhone,
      required this.selectedDialCode,
      required this.selectedLocale,
      required this.phoneController,
      required this.otpController,
      required this.isLoginEnabled,
      required this.apiBaseUrl,
      required this.authRepository,
      required this.isOTPSentFailed,
      required this.isOTPSentSuccessful,
      required this.isLoginSuccess,
      required this.isOTPVerificationFailed,
      required this.isOTPVerificationSuccessful,
      required this.errorMessage});

  @override
  final bool isLoading;
  @override
  final bool loginWithApple;
  @override
  final bool loginWithGoogle;
  @override
  final bool loginWithPhone;
  @override
  final String selectedDialCode;
  @override
  final String selectedLocale;
  @override
  final TextEditingController phoneController;
  @override
  final TextEditingController otpController;
  @override
  final bool isLoginEnabled;
  @override
  final String apiBaseUrl;
  @override
  final AuthRepository authRepository;
  @override
  final bool isOTPSentFailed;
  @override
  final bool isOTPSentSuccessful;
  @override
  final bool isLoginSuccess;
  @override
  final bool isOTPVerificationFailed;
  @override
  final bool isOTPVerificationSuccessful;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, loginWithApple: $loginWithApple, loginWithGoogle: $loginWithGoogle, loginWithPhone: $loginWithPhone, selectedDialCode: $selectedDialCode, selectedLocale: $selectedLocale, phoneController: $phoneController, otpController: $otpController, isLoginEnabled: $isLoginEnabled, apiBaseUrl: $apiBaseUrl, authRepository: $authRepository, isOTPSentFailed: $isOTPSentFailed, isOTPSentSuccessful: $isOTPSentSuccessful, isLoginSuccess: $isLoginSuccess, isOTPVerificationFailed: $isOTPVerificationFailed, isOTPVerificationSuccessful: $isOTPVerificationSuccessful, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loginWithApple, loginWithApple) ||
                other.loginWithApple == loginWithApple) &&
            (identical(other.loginWithGoogle, loginWithGoogle) ||
                other.loginWithGoogle == loginWithGoogle) &&
            (identical(other.loginWithPhone, loginWithPhone) ||
                other.loginWithPhone == loginWithPhone) &&
            (identical(other.selectedDialCode, selectedDialCode) ||
                other.selectedDialCode == selectedDialCode) &&
            (identical(other.selectedLocale, selectedLocale) ||
                other.selectedLocale == selectedLocale) &&
            (identical(other.phoneController, phoneController) ||
                other.phoneController == phoneController) &&
            (identical(other.otpController, otpController) ||
                other.otpController == otpController) &&
            (identical(other.isLoginEnabled, isLoginEnabled) ||
                other.isLoginEnabled == isLoginEnabled) &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.authRepository, authRepository) ||
                other.authRepository == authRepository) &&
            (identical(other.isOTPSentFailed, isOTPSentFailed) ||
                other.isOTPSentFailed == isOTPSentFailed) &&
            (identical(other.isOTPSentSuccessful, isOTPSentSuccessful) ||
                other.isOTPSentSuccessful == isOTPSentSuccessful) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(
                    other.isOTPVerificationFailed, isOTPVerificationFailed) ||
                other.isOTPVerificationFailed == isOTPVerificationFailed) &&
            (identical(other.isOTPVerificationSuccessful,
                    isOTPVerificationSuccessful) ||
                other.isOTPVerificationSuccessful ==
                    isOTPVerificationSuccessful) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      loginWithApple,
      loginWithGoogle,
      loginWithPhone,
      selectedDialCode,
      selectedLocale,
      phoneController,
      otpController,
      isLoginEnabled,
      apiBaseUrl,
      authRepository,
      isOTPSentFailed,
      isOTPSentSuccessful,
      isLoginSuccess,
      isOTPVerificationFailed,
      isOTPVerificationSuccessful,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final bool isLoading,
      required final bool loginWithApple,
      required final bool loginWithGoogle,
      required final bool loginWithPhone,
      required final String selectedDialCode,
      required final String selectedLocale,
      required final TextEditingController phoneController,
      required final TextEditingController otpController,
      required final bool isLoginEnabled,
      required final String apiBaseUrl,
      required final AuthRepository authRepository,
      required final bool isOTPSentFailed,
      required final bool isOTPSentSuccessful,
      required final bool isLoginSuccess,
      required final bool isOTPVerificationFailed,
      required final bool isOTPVerificationSuccessful,
      required final String errorMessage}) = _$AuthStateImpl;

  @override
  bool get isLoading;
  @override
  bool get loginWithApple;
  @override
  bool get loginWithGoogle;
  @override
  bool get loginWithPhone;
  @override
  String get selectedDialCode;
  @override
  String get selectedLocale;
  @override
  TextEditingController get phoneController;
  @override
  TextEditingController get otpController;
  @override
  bool get isLoginEnabled;
  @override
  String get apiBaseUrl;
  @override
  AuthRepository get authRepository;
  @override
  bool get isOTPSentFailed;
  @override
  bool get isOTPSentSuccessful;
  @override
  bool get isLoginSuccess;
  @override
  bool get isOTPVerificationFailed;
  @override
  bool get isOTPVerificationSuccessful;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
