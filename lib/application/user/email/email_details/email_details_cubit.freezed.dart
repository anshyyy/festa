// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailDetailsState {
  String get emailAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailDetailsStateCopyWith<EmailDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailDetailsStateCopyWith<$Res> {
  factory $EmailDetailsStateCopyWith(
          EmailDetailsState value, $Res Function(EmailDetailsState) then) =
      _$EmailDetailsStateCopyWithImpl<$Res, EmailDetailsState>;
  @useResult
  $Res call({String emailAddress});
}

/// @nodoc
class _$EmailDetailsStateCopyWithImpl<$Res, $Val extends EmailDetailsState>
    implements $EmailDetailsStateCopyWith<$Res> {
  _$EmailDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailDetailsStateImplCopyWith<$Res>
    implements $EmailDetailsStateCopyWith<$Res> {
  factory _$$EmailDetailsStateImplCopyWith(_$EmailDetailsStateImpl value,
          $Res Function(_$EmailDetailsStateImpl) then) =
      __$$EmailDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emailAddress});
}

/// @nodoc
class __$$EmailDetailsStateImplCopyWithImpl<$Res>
    extends _$EmailDetailsStateCopyWithImpl<$Res, _$EmailDetailsStateImpl>
    implements _$$EmailDetailsStateImplCopyWith<$Res> {
  __$$EmailDetailsStateImplCopyWithImpl(_$EmailDetailsStateImpl _value,
      $Res Function(_$EmailDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
  }) {
    return _then(_$EmailDetailsStateImpl(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailDetailsStateImpl implements _EmailDetailsState {
  const _$EmailDetailsStateImpl({required this.emailAddress});

  @override
  final String emailAddress;

  @override
  String toString() {
    return 'EmailDetailsState(emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailDetailsStateImpl &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailDetailsStateImplCopyWith<_$EmailDetailsStateImpl> get copyWith =>
      __$$EmailDetailsStateImplCopyWithImpl<_$EmailDetailsStateImpl>(
          this, _$identity);
}

abstract class _EmailDetailsState implements EmailDetailsState {
  const factory _EmailDetailsState({required final String emailAddress}) =
      _$EmailDetailsStateImpl;

  @override
  String get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$EmailDetailsStateImplCopyWith<_$EmailDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
