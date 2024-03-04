// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_privacy_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountPrivacyState {
  bool get isPrivate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountPrivacyStateCopyWith<AccountPrivacyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountPrivacyStateCopyWith<$Res> {
  factory $AccountPrivacyStateCopyWith(
          AccountPrivacyState value, $Res Function(AccountPrivacyState) then) =
      _$AccountPrivacyStateCopyWithImpl<$Res, AccountPrivacyState>;
  @useResult
  $Res call({bool isPrivate});
}

/// @nodoc
class _$AccountPrivacyStateCopyWithImpl<$Res, $Val extends AccountPrivacyState>
    implements $AccountPrivacyStateCopyWith<$Res> {
  _$AccountPrivacyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPrivate = null,
  }) {
    return _then(_value.copyWith(
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountPrivacyImplCopyWith<$Res>
    implements $AccountPrivacyStateCopyWith<$Res> {
  factory _$$AccountPrivacyImplCopyWith(_$AccountPrivacyImpl value,
          $Res Function(_$AccountPrivacyImpl) then) =
      __$$AccountPrivacyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPrivate});
}

/// @nodoc
class __$$AccountPrivacyImplCopyWithImpl<$Res>
    extends _$AccountPrivacyStateCopyWithImpl<$Res, _$AccountPrivacyImpl>
    implements _$$AccountPrivacyImplCopyWith<$Res> {
  __$$AccountPrivacyImplCopyWithImpl(
      _$AccountPrivacyImpl _value, $Res Function(_$AccountPrivacyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPrivate = null,
  }) {
    return _then(_$AccountPrivacyImpl(
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AccountPrivacyImpl implements _AccountPrivacy {
  const _$AccountPrivacyImpl({required this.isPrivate});

  @override
  final bool isPrivate;

  @override
  String toString() {
    return 'AccountPrivacyState(isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountPrivacyImpl &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPrivate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountPrivacyImplCopyWith<_$AccountPrivacyImpl> get copyWith =>
      __$$AccountPrivacyImplCopyWithImpl<_$AccountPrivacyImpl>(
          this, _$identity);
}

abstract class _AccountPrivacy implements AccountPrivacyState {
  const factory _AccountPrivacy({required final bool isPrivate}) =
      _$AccountPrivacyImpl;

  @override
  bool get isPrivate;
  @override
  @JsonKey(ignore: true)
  _$$AccountPrivacyImplCopyWith<_$AccountPrivacyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
