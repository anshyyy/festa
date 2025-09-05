// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneState {
  bool get hasValidationError => throw _privateConstructorUsedError;
  TextEditingController get phoneNumberController =>
      throw _privateConstructorUsedError;

  /// Create a copy of PhoneState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneStateCopyWith<PhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneStateCopyWith<$Res> {
  factory $PhoneStateCopyWith(
          PhoneState value, $Res Function(PhoneState) then) =
      _$PhoneStateCopyWithImpl<$Res, PhoneState>;
  @useResult
  $Res call(
      {bool hasValidationError, TextEditingController phoneNumberController});
}

/// @nodoc
class _$PhoneStateCopyWithImpl<$Res, $Val extends PhoneState>
    implements $PhoneStateCopyWith<$Res> {
  _$PhoneStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasValidationError = null,
    Object? phoneNumberController = null,
  }) {
    return _then(_value.copyWith(
      hasValidationError: null == hasValidationError
          ? _value.hasValidationError
          : hasValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberController: null == phoneNumberController
          ? _value.phoneNumberController
          : phoneNumberController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneStateImplCopyWith<$Res>
    implements $PhoneStateCopyWith<$Res> {
  factory _$$PhoneStateImplCopyWith(
          _$PhoneStateImpl value, $Res Function(_$PhoneStateImpl) then) =
      __$$PhoneStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasValidationError, TextEditingController phoneNumberController});
}

/// @nodoc
class __$$PhoneStateImplCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$PhoneStateImpl>
    implements _$$PhoneStateImplCopyWith<$Res> {
  __$$PhoneStateImplCopyWithImpl(
      _$PhoneStateImpl _value, $Res Function(_$PhoneStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasValidationError = null,
    Object? phoneNumberController = null,
  }) {
    return _then(_$PhoneStateImpl(
      hasValidationError: null == hasValidationError
          ? _value.hasValidationError
          : hasValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberController: null == phoneNumberController
          ? _value.phoneNumberController
          : phoneNumberController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$PhoneStateImpl implements _PhoneState {
  const _$PhoneStateImpl(
      {required this.hasValidationError, required this.phoneNumberController});

  @override
  final bool hasValidationError;
  @override
  final TextEditingController phoneNumberController;

  @override
  String toString() {
    return 'PhoneState(hasValidationError: $hasValidationError, phoneNumberController: $phoneNumberController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneStateImpl &&
            (identical(other.hasValidationError, hasValidationError) ||
                other.hasValidationError == hasValidationError) &&
            (identical(other.phoneNumberController, phoneNumberController) ||
                other.phoneNumberController == phoneNumberController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hasValidationError, phoneNumberController);

  /// Create a copy of PhoneState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
      __$$PhoneStateImplCopyWithImpl<_$PhoneStateImpl>(this, _$identity);
}

abstract class _PhoneState implements PhoneState {
  const factory _PhoneState(
          {required final bool hasValidationError,
          required final TextEditingController phoneNumberController}) =
      _$PhoneStateImpl;

  @override
  bool get hasValidationError;
  @override
  TextEditingController get phoneNumberController;

  /// Create a copy of PhoneState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
