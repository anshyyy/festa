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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountPrivacyState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  /// Create a copy of AccountPrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountPrivacyStateCopyWith<AccountPrivacyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountPrivacyStateCopyWith<$Res> {
  factory $AccountPrivacyStateCopyWith(
          AccountPrivacyState value, $Res Function(AccountPrivacyState) then) =
      _$AccountPrivacyStateCopyWithImpl<$Res, AccountPrivacyState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool isPrivate,
      UserRepository userRepository,
      UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$AccountPrivacyStateCopyWithImpl<$Res, $Val extends AccountPrivacyState>
    implements $AccountPrivacyStateCopyWith<$Res> {
  _$AccountPrivacyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountPrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? isPrivate = null,
    Object? userRepository = null,
    Object? user = freezed,
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
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

  /// Create a copy of AccountPrivacyState
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
abstract class _$$AccountPrivacyImplCopyWith<$Res>
    implements $AccountPrivacyStateCopyWith<$Res> {
  factory _$$AccountPrivacyImplCopyWith(_$AccountPrivacyImpl value,
          $Res Function(_$AccountPrivacyImpl) then) =
      __$$AccountPrivacyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool isPrivate,
      UserRepository userRepository,
      UserDto? user});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AccountPrivacyImplCopyWithImpl<$Res>
    extends _$AccountPrivacyStateCopyWithImpl<$Res, _$AccountPrivacyImpl>
    implements _$$AccountPrivacyImplCopyWith<$Res> {
  __$$AccountPrivacyImplCopyWithImpl(
      _$AccountPrivacyImpl _value, $Res Function(_$AccountPrivacyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountPrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? isPrivate = null,
    Object? userRepository = null,
    Object? user = freezed,
  }) {
    return _then(_$AccountPrivacyImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$AccountPrivacyImpl implements _AccountPrivacy {
  const _$AccountPrivacyImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.isPrivate,
      required this.userRepository,
      this.user});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool isPrivate;
  @override
  final UserRepository userRepository;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'AccountPrivacyState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, isPrivate: $isPrivate, userRepository: $userRepository, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountPrivacyImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailure,
      isPrivate, userRepository, user);

  /// Create a copy of AccountPrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountPrivacyImplCopyWith<_$AccountPrivacyImpl> get copyWith =>
      __$$AccountPrivacyImplCopyWithImpl<_$AccountPrivacyImpl>(
          this, _$identity);
}

abstract class _AccountPrivacy implements AccountPrivacyState {
  const factory _AccountPrivacy(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool isPrivate,
      required final UserRepository userRepository,
      final UserDto? user}) = _$AccountPrivacyImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get isPrivate;
  @override
  UserRepository get userRepository;
  @override
  UserDto? get user;

  /// Create a copy of AccountPrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountPrivacyImplCopyWith<_$AccountPrivacyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
