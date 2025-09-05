// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneDetailsState {
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of PhoneDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneDetailsStateCopyWith<PhoneDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneDetailsStateCopyWith<$Res> {
  factory $PhoneDetailsStateCopyWith(
          PhoneDetailsState value, $Res Function(PhoneDetailsState) then) =
      _$PhoneDetailsStateCopyWithImpl<$Res, PhoneDetailsState>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$PhoneDetailsStateCopyWithImpl<$Res, $Val extends PhoneDetailsState>
    implements $PhoneDetailsStateCopyWith<$Res> {
  _$PhoneDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneDetailsState
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
abstract class _$$PhoneDetailsStateImplCopyWith<$Res>
    implements $PhoneDetailsStateCopyWith<$Res> {
  factory _$$PhoneDetailsStateImplCopyWith(_$PhoneDetailsStateImpl value,
          $Res Function(_$PhoneDetailsStateImpl) then) =
      __$$PhoneDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneDetailsStateImplCopyWithImpl<$Res>
    extends _$PhoneDetailsStateCopyWithImpl<$Res, _$PhoneDetailsStateImpl>
    implements _$$PhoneDetailsStateImplCopyWith<$Res> {
  __$$PhoneDetailsStateImplCopyWithImpl(_$PhoneDetailsStateImpl _value,
      $Res Function(_$PhoneDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneDetailsStateImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneDetailsStateImpl implements _PhoneDetailsState {
  const _$PhoneDetailsStateImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneDetailsState(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneDetailsStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of PhoneDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneDetailsStateImplCopyWith<_$PhoneDetailsStateImpl> get copyWith =>
      __$$PhoneDetailsStateImplCopyWithImpl<_$PhoneDetailsStateImpl>(
          this, _$identity);
}

abstract class _PhoneDetailsState implements PhoneDetailsState {
  const factory _PhoneDetailsState({required final String phoneNumber}) =
      _$PhoneDetailsStateImpl;

  @override
  String get phoneNumber;

  /// Create a copy of PhoneDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneDetailsStateImplCopyWith<_$PhoneDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
