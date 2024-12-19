// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyOtpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOTPVerificationSuccessful => throw _privateConstructorUsedError;
  bool get isOTPVerificationFailed => throw _privateConstructorUsedError;
  TextEditingController get otpController => throw _privateConstructorUsedError;
  String? get verificationCode => throw _privateConstructorUsedError;
  String? get apiBaseUrl => throw _privateConstructorUsedError;
  AuthRepository get authRepository => throw _privateConstructorUsedError;
  String get dialCode => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  CountdownController get countdownController =>
      throw _privateConstructorUsedError;
  bool get showResendButton => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isVerifyEnabled => throw _privateConstructorUsedError;
  bool get backToAuth => throw _privateConstructorUsedError;
  bool get isOTPSentSuccessful => throw _privateConstructorUsedError;
  bool get isOTPSentFailed => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpStateCopyWith<VerifyOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpStateCopyWith<$Res> {
  factory $VerifyOtpStateCopyWith(
          VerifyOtpState value, $Res Function(VerifyOtpState) then) =
      _$VerifyOtpStateCopyWithImpl<$Res, VerifyOtpState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isOTPVerificationSuccessful,
      bool isOTPVerificationFailed,
      TextEditingController otpController,
      String? verificationCode,
      String? apiBaseUrl,
      AuthRepository authRepository,
      String dialCode,
      String phoneNumber,
      CountdownController countdownController,
      bool showResendButton,
      String errorMessage,
      bool isVerifyEnabled,
      bool backToAuth,
      bool isOTPSentSuccessful,
      bool isOTPSentFailed,
      UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$VerifyOtpStateCopyWithImpl<$Res, $Val extends VerifyOtpState>
    implements $VerifyOtpStateCopyWith<$Res> {
  _$VerifyOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOTPVerificationSuccessful = null,
    Object? isOTPVerificationFailed = null,
    Object? otpController = null,
    Object? verificationCode = freezed,
    Object? apiBaseUrl = freezed,
    Object? authRepository = null,
    Object? dialCode = null,
    Object? phoneNumber = null,
    Object? countdownController = null,
    Object? showResendButton = null,
    Object? errorMessage = null,
    Object? isVerifyEnabled = null,
    Object? backToAuth = null,
    Object? isOTPSentSuccessful = null,
    Object? isOTPSentFailed = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationSuccessful: null == isOTPVerificationSuccessful
          ? _value.isOTPVerificationSuccessful
          : isOTPVerificationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationFailed: null == isOTPVerificationFailed
          ? _value.isOTPVerificationFailed
          : isOTPVerificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      apiBaseUrl: freezed == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countdownController: null == countdownController
          ? _value.countdownController
          : countdownController // ignore: cast_nullable_to_non_nullable
              as CountdownController,
      showResendButton: null == showResendButton
          ? _value.showResendButton
          : showResendButton // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isVerifyEnabled: null == isVerifyEnabled
          ? _value.isVerifyEnabled
          : isVerifyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      backToAuth: null == backToAuth
          ? _value.backToAuth
          : backToAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentSuccessful: null == isOTPSentSuccessful
          ? _value.isOTPSentSuccessful
          : isOTPSentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentFailed: null == isOTPSentFailed
          ? _value.isOTPSentFailed
          : isOTPSentFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyOtpStateImplCopyWith<$Res>
    implements $VerifyOtpStateCopyWith<$Res> {
  factory _$$VerifyOtpStateImplCopyWith(_$VerifyOtpStateImpl value,
          $Res Function(_$VerifyOtpStateImpl) then) =
      __$$VerifyOtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isOTPVerificationSuccessful,
      bool isOTPVerificationFailed,
      TextEditingController otpController,
      String? verificationCode,
      String? apiBaseUrl,
      AuthRepository authRepository,
      String dialCode,
      String phoneNumber,
      CountdownController countdownController,
      bool showResendButton,
      String errorMessage,
      bool isVerifyEnabled,
      bool backToAuth,
      bool isOTPSentSuccessful,
      bool isOTPSentFailed,
      UserDto? user});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$VerifyOtpStateImplCopyWithImpl<$Res>
    extends _$VerifyOtpStateCopyWithImpl<$Res, _$VerifyOtpStateImpl>
    implements _$$VerifyOtpStateImplCopyWith<$Res> {
  __$$VerifyOtpStateImplCopyWithImpl(
      _$VerifyOtpStateImpl _value, $Res Function(_$VerifyOtpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOTPVerificationSuccessful = null,
    Object? isOTPVerificationFailed = null,
    Object? otpController = null,
    Object? verificationCode = freezed,
    Object? apiBaseUrl = freezed,
    Object? authRepository = null,
    Object? dialCode = null,
    Object? phoneNumber = null,
    Object? countdownController = null,
    Object? showResendButton = null,
    Object? errorMessage = null,
    Object? isVerifyEnabled = null,
    Object? backToAuth = null,
    Object? isOTPSentSuccessful = null,
    Object? isOTPSentFailed = null,
    Object? user = freezed,
  }) {
    return _then(_$VerifyOtpStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationSuccessful: null == isOTPVerificationSuccessful
          ? _value.isOTPVerificationSuccessful
          : isOTPVerificationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerificationFailed: null == isOTPVerificationFailed
          ? _value.isOTPVerificationFailed
          : isOTPVerificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      apiBaseUrl: freezed == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countdownController: null == countdownController
          ? _value.countdownController
          : countdownController // ignore: cast_nullable_to_non_nullable
              as CountdownController,
      showResendButton: null == showResendButton
          ? _value.showResendButton
          : showResendButton // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isVerifyEnabled: null == isVerifyEnabled
          ? _value.isVerifyEnabled
          : isVerifyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      backToAuth: null == backToAuth
          ? _value.backToAuth
          : backToAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentSuccessful: null == isOTPSentSuccessful
          ? _value.isOTPSentSuccessful
          : isOTPSentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSentFailed: null == isOTPSentFailed
          ? _value.isOTPSentFailed
          : isOTPSentFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$VerifyOtpStateImpl implements _VerifyOtpState {
  const _$VerifyOtpStateImpl(
      {required this.isLoading,
      required this.isOTPVerificationSuccessful,
      required this.isOTPVerificationFailed,
      required this.otpController,
      required this.verificationCode,
      required this.apiBaseUrl,
      required this.authRepository,
      required this.dialCode,
      required this.phoneNumber,
      required this.countdownController,
      required this.showResendButton,
      required this.errorMessage,
      required this.isVerifyEnabled,
      required this.backToAuth,
      required this.isOTPSentSuccessful,
      required this.isOTPSentFailed,
      this.user});

  @override
  final bool isLoading;
  @override
  final bool isOTPVerificationSuccessful;
  @override
  final bool isOTPVerificationFailed;
  @override
  final TextEditingController otpController;
  @override
  final String? verificationCode;
  @override
  final String? apiBaseUrl;
  @override
  final AuthRepository authRepository;
  @override
  final String dialCode;
  @override
  final String phoneNumber;
  @override
  final CountdownController countdownController;
  @override
  final bool showResendButton;
  @override
  final String errorMessage;
  @override
  final bool isVerifyEnabled;
  @override
  final bool backToAuth;
  @override
  final bool isOTPSentSuccessful;
  @override
  final bool isOTPSentFailed;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'VerifyOtpState(isLoading: $isLoading, isOTPVerificationSuccessful: $isOTPVerificationSuccessful, isOTPVerificationFailed: $isOTPVerificationFailed, otpController: $otpController, verificationCode: $verificationCode, apiBaseUrl: $apiBaseUrl, authRepository: $authRepository, dialCode: $dialCode, phoneNumber: $phoneNumber, countdownController: $countdownController, showResendButton: $showResendButton, errorMessage: $errorMessage, isVerifyEnabled: $isVerifyEnabled, backToAuth: $backToAuth, isOTPSentSuccessful: $isOTPSentSuccessful, isOTPSentFailed: $isOTPSentFailed, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOTPVerificationSuccessful,
                    isOTPVerificationSuccessful) ||
                other.isOTPVerificationSuccessful ==
                    isOTPVerificationSuccessful) &&
            (identical(
                    other.isOTPVerificationFailed, isOTPVerificationFailed) ||
                other.isOTPVerificationFailed == isOTPVerificationFailed) &&
            (identical(other.otpController, otpController) ||
                other.otpController == otpController) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.authRepository, authRepository) ||
                other.authRepository == authRepository) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.countdownController, countdownController) ||
                other.countdownController == countdownController) &&
            (identical(other.showResendButton, showResendButton) ||
                other.showResendButton == showResendButton) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isVerifyEnabled, isVerifyEnabled) ||
                other.isVerifyEnabled == isVerifyEnabled) &&
            (identical(other.backToAuth, backToAuth) ||
                other.backToAuth == backToAuth) &&
            (identical(other.isOTPSentSuccessful, isOTPSentSuccessful) ||
                other.isOTPSentSuccessful == isOTPSentSuccessful) &&
            (identical(other.isOTPSentFailed, isOTPSentFailed) ||
                other.isOTPSentFailed == isOTPSentFailed) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isOTPVerificationSuccessful,
      isOTPVerificationFailed,
      otpController,
      verificationCode,
      apiBaseUrl,
      authRepository,
      dialCode,
      phoneNumber,
      countdownController,
      showResendButton,
      errorMessage,
      isVerifyEnabled,
      backToAuth,
      isOTPSentSuccessful,
      isOTPSentFailed,
      user);

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      __$$VerifyOtpStateImplCopyWithImpl<_$VerifyOtpStateImpl>(
          this, _$identity);
}

abstract class _VerifyOtpState implements VerifyOtpState {
  const factory _VerifyOtpState(
      {required final bool isLoading,
      required final bool isOTPVerificationSuccessful,
      required final bool isOTPVerificationFailed,
      required final TextEditingController otpController,
      required final String? verificationCode,
      required final String? apiBaseUrl,
      required final AuthRepository authRepository,
      required final String dialCode,
      required final String phoneNumber,
      required final CountdownController countdownController,
      required final bool showResendButton,
      required final String errorMessage,
      required final bool isVerifyEnabled,
      required final bool backToAuth,
      required final bool isOTPSentSuccessful,
      required final bool isOTPSentFailed,
      final UserDto? user}) = _$VerifyOtpStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isOTPVerificationSuccessful;
  @override
  bool get isOTPVerificationFailed;
  @override
  TextEditingController get otpController;
  @override
  String? get verificationCode;
  @override
  String? get apiBaseUrl;
  @override
  AuthRepository get authRepository;
  @override
  String get dialCode;
  @override
  String get phoneNumber;
  @override
  CountdownController get countdownController;
  @override
  bool get showResendButton;
  @override
  String get errorMessage;
  @override
  bool get isVerifyEnabled;
  @override
  bool get backToAuth;
  @override
  bool get isOTPSentSuccessful;
  @override
  bool get isOTPSentFailed;
  @override
  UserDto? get user;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
