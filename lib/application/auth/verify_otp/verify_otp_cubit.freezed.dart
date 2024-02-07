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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyOtpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  TextEditingController get otpController => throw _privateConstructorUsedError;
  String? get verificationCode => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      bool isSuccess,
      bool isFailed,
      TextEditingController otpController,
      String? verificationCode,
      String? otpCode});
}

/// @nodoc
class _$VerifyOtpStateCopyWithImpl<$Res, $Val extends VerifyOtpState>
    implements $VerifyOtpStateCopyWith<$Res> {
  _$VerifyOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailed = null,
    Object? otpController = null,
    Object? verificationCode = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      bool isSuccess,
      bool isFailed,
      TextEditingController otpController,
      String? verificationCode,
      String? otpCode});
}

/// @nodoc
class __$$VerifyOtpStateImplCopyWithImpl<$Res>
    extends _$VerifyOtpStateCopyWithImpl<$Res, _$VerifyOtpStateImpl>
    implements _$$VerifyOtpStateImplCopyWith<$Res> {
  __$$VerifyOtpStateImplCopyWithImpl(
      _$VerifyOtpStateImpl _value, $Res Function(_$VerifyOtpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailed = null,
    Object? otpController = null,
    Object? verificationCode = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_$VerifyOtpStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerifyOtpStateImpl implements _VerifyOtpState {
  const _$VerifyOtpStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailed,
      required this.otpController,
      required this.verificationCode,
      required this.otpCode});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailed;
  @override
  final TextEditingController otpController;
  @override
  final String? verificationCode;
  @override
  final String? otpCode;

  @override
  String toString() {
    return 'VerifyOtpState(isLoading: $isLoading, isSuccess: $isSuccess, isFailed: $isFailed, otpController: $otpController, verificationCode: $verificationCode, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.otpController, otpController) ||
                other.otpController == otpController) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailed,
      otpController, verificationCode, otpCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      __$$VerifyOtpStateImplCopyWithImpl<_$VerifyOtpStateImpl>(
          this, _$identity);
}

abstract class _VerifyOtpState implements VerifyOtpState {
  const factory _VerifyOtpState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailed,
      required final TextEditingController otpController,
      required final String? verificationCode,
      required final String? otpCode}) = _$VerifyOtpStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailed;
  @override
  TextEditingController get otpController;
  @override
  String? get verificationCode;
  @override
  String? get otpCode;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
