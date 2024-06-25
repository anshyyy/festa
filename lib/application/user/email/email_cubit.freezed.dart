// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isOtpSent => throw _privateConstructorUsedError;
  bool get hasValidationError => throw _privateConstructorUsedError;
  TextEditingController get emailTextController =>
      throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailStateCopyWith<EmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailStateCopyWith<$Res> {
  factory $EmailStateCopyWith(
          EmailState value, $Res Function(EmailState) then) =
      _$EmailStateCopyWithImpl<$Res, EmailState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailure,
      bool isSuccess,
      bool isOtpSent,
      bool hasValidationError,
      TextEditingController emailTextController,
      UserRepository userRepository});
}

/// @nodoc
class _$EmailStateCopyWithImpl<$Res, $Val extends EmailState>
    implements $EmailStateCopyWith<$Res> {
  _$EmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? isOtpSent = null,
    Object? hasValidationError = null,
    Object? emailTextController = null,
    Object? userRepository = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpSent: null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidationError: null == hasValidationError
          ? _value.hasValidationError
          : hasValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
      emailTextController: null == emailTextController
          ? _value.emailTextController
          : emailTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailStateImplCopyWith<$Res>
    implements $EmailStateCopyWith<$Res> {
  factory _$$EmailStateImplCopyWith(
          _$EmailStateImpl value, $Res Function(_$EmailStateImpl) then) =
      __$$EmailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailure,
      bool isSuccess,
      bool isOtpSent,
      bool hasValidationError,
      TextEditingController emailTextController,
      UserRepository userRepository});
}

/// @nodoc
class __$$EmailStateImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateImpl>
    implements _$$EmailStateImplCopyWith<$Res> {
  __$$EmailStateImplCopyWithImpl(
      _$EmailStateImpl _value, $Res Function(_$EmailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? isOtpSent = null,
    Object? hasValidationError = null,
    Object? emailTextController = null,
    Object? userRepository = null,
  }) {
    return _then(_$EmailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpSent: null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidationError: null == hasValidationError
          ? _value.hasValidationError
          : hasValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
      emailTextController: null == emailTextController
          ? _value.emailTextController
          : emailTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
    ));
  }
}

/// @nodoc

class _$EmailStateImpl implements _EmailState {
  const _$EmailStateImpl(
      {required this.isLoading,
      required this.isFailure,
      required this.isSuccess,
      required this.isOtpSent,
      required this.hasValidationError,
      required this.emailTextController,
      required this.userRepository});

  @override
  final bool isLoading;
  @override
  final bool isFailure;
  @override
  final bool isSuccess;
  @override
  final bool isOtpSent;
  @override
  final bool hasValidationError;
  @override
  final TextEditingController emailTextController;
  @override
  final UserRepository userRepository;

  @override
  String toString() {
    return 'EmailState(isLoading: $isLoading, isFailure: $isFailure, isSuccess: $isSuccess, isOtpSent: $isOtpSent, hasValidationError: $hasValidationError, emailTextController: $emailTextController, userRepository: $userRepository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isOtpSent, isOtpSent) ||
                other.isOtpSent == isOtpSent) &&
            (identical(other.hasValidationError, hasValidationError) ||
                other.hasValidationError == hasValidationError) &&
            (identical(other.emailTextController, emailTextController) ||
                other.emailTextController == emailTextController) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFailure, isSuccess,
      isOtpSent, hasValidationError, emailTextController, userRepository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailStateImplCopyWith<_$EmailStateImpl> get copyWith =>
      __$$EmailStateImplCopyWithImpl<_$EmailStateImpl>(this, _$identity);
}

abstract class _EmailState implements EmailState {
  const factory _EmailState(
      {required final bool isLoading,
      required final bool isFailure,
      required final bool isSuccess,
      required final bool isOtpSent,
      required final bool hasValidationError,
      required final TextEditingController emailTextController,
      required final UserRepository userRepository}) = _$EmailStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFailure;
  @override
  bool get isSuccess;
  @override
  bool get isOtpSent;
  @override
  bool get hasValidationError;
  @override
  TextEditingController get emailTextController;
  @override
  UserRepository get userRepository;
  @override
  @JsonKey(ignore: true)
  _$$EmailStateImplCopyWith<_$EmailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
