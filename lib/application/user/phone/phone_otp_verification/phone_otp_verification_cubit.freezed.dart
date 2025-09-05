// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_otp_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneOtpVerificationState {
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of PhoneOtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneOtpVerificationStateCopyWith<PhoneOtpVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneOtpVerificationStateCopyWith<$Res> {
  factory $PhoneOtpVerificationStateCopyWith(PhoneOtpVerificationState value,
          $Res Function(PhoneOtpVerificationState) then) =
      _$PhoneOtpVerificationStateCopyWithImpl<$Res, PhoneOtpVerificationState>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$PhoneOtpVerificationStateCopyWithImpl<$Res,
        $Val extends PhoneOtpVerificationState>
    implements $PhoneOtpVerificationStateCopyWith<$Res> {
  _$PhoneOtpVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneOtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneOtpVerificationStateImplCopyWith<$Res>
    implements $PhoneOtpVerificationStateCopyWith<$Res> {
  factory _$$PhoneOtpVerificationStateImplCopyWith(
          _$PhoneOtpVerificationStateImpl value,
          $Res Function(_$PhoneOtpVerificationStateImpl) then) =
      __$$PhoneOtpVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneOtpVerificationStateImplCopyWithImpl<$Res>
    extends _$PhoneOtpVerificationStateCopyWithImpl<$Res,
        _$PhoneOtpVerificationStateImpl>
    implements _$$PhoneOtpVerificationStateImplCopyWith<$Res> {
  __$$PhoneOtpVerificationStateImplCopyWithImpl(
      _$PhoneOtpVerificationStateImpl _value,
      $Res Function(_$PhoneOtpVerificationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneOtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneOtpVerificationStateImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneOtpVerificationStateImpl implements _PhoneOtpVerificationState {
  const _$PhoneOtpVerificationStateImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneOtpVerificationState(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneOtpVerificationStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of PhoneOtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneOtpVerificationStateImplCopyWith<_$PhoneOtpVerificationStateImpl>
      get copyWith => __$$PhoneOtpVerificationStateImplCopyWithImpl<
          _$PhoneOtpVerificationStateImpl>(this, _$identity);
}

abstract class _PhoneOtpVerificationState implements PhoneOtpVerificationState {
  const factory _PhoneOtpVerificationState(
      {required final String phoneNumber}) = _$PhoneOtpVerificationStateImpl;

  @override
  String get phoneNumber;

  /// Create a copy of PhoneOtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneOtpVerificationStateImplCopyWith<_$PhoneOtpVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
