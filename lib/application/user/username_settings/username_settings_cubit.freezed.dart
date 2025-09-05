// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsernameSettingsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  TextEditingController get usernameInputController =>
      throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isUpdateEnabled => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  String get currentUsername => throw _privateConstructorUsedError;
  bool get isUsernameUpdateSuccess => throw _privateConstructorUsedError;
  bool get isUsernameUpdateFailure => throw _privateConstructorUsedError;

  /// Create a copy of UsernameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsernameSettingsStateCopyWith<UsernameSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameSettingsStateCopyWith<$Res> {
  factory $UsernameSettingsStateCopyWith(UsernameSettingsState value,
          $Res Function(UsernameSettingsState) then) =
      _$UsernameSettingsStateCopyWithImpl<$Res, UsernameSettingsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailure,
      bool isSuccess,
      TextEditingController usernameInputController,
      bool noUse,
      bool hasError,
      bool isUpdateEnabled,
      UserRepository userRepository,
      UserDto? user,
      String currentUsername,
      bool isUsernameUpdateSuccess,
      bool isUsernameUpdateFailure});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$UsernameSettingsStateCopyWithImpl<$Res,
        $Val extends UsernameSettingsState>
    implements $UsernameSettingsStateCopyWith<$Res> {
  _$UsernameSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsernameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? usernameInputController = null,
    Object? noUse = null,
    Object? hasError = null,
    Object? isUpdateEnabled = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? currentUsername = null,
    Object? isUsernameUpdateSuccess = null,
    Object? isUsernameUpdateFailure = null,
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
      usernameInputController: null == usernameInputController
          ? _value.usernameInputController
          : usernameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateEnabled: null == isUpdateEnabled
          ? _value.isUpdateEnabled
          : isUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      currentUsername: null == currentUsername
          ? _value.currentUsername
          : currentUsername // ignore: cast_nullable_to_non_nullable
              as String,
      isUsernameUpdateSuccess: null == isUsernameUpdateSuccess
          ? _value.isUsernameUpdateSuccess
          : isUsernameUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsernameUpdateFailure: null == isUsernameUpdateFailure
          ? _value.isUsernameUpdateFailure
          : isUsernameUpdateFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of UsernameSettingsState
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
abstract class _$$UsernameSettingsStateImplCopyWith<$Res>
    implements $UsernameSettingsStateCopyWith<$Res> {
  factory _$$UsernameSettingsStateImplCopyWith(
          _$UsernameSettingsStateImpl value,
          $Res Function(_$UsernameSettingsStateImpl) then) =
      __$$UsernameSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailure,
      bool isSuccess,
      TextEditingController usernameInputController,
      bool noUse,
      bool hasError,
      bool isUpdateEnabled,
      UserRepository userRepository,
      UserDto? user,
      String currentUsername,
      bool isUsernameUpdateSuccess,
      bool isUsernameUpdateFailure});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UsernameSettingsStateImplCopyWithImpl<$Res>
    extends _$UsernameSettingsStateCopyWithImpl<$Res,
        _$UsernameSettingsStateImpl>
    implements _$$UsernameSettingsStateImplCopyWith<$Res> {
  __$$UsernameSettingsStateImplCopyWithImpl(_$UsernameSettingsStateImpl _value,
      $Res Function(_$UsernameSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsernameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? usernameInputController = null,
    Object? noUse = null,
    Object? hasError = null,
    Object? isUpdateEnabled = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? currentUsername = null,
    Object? isUsernameUpdateSuccess = null,
    Object? isUsernameUpdateFailure = null,
  }) {
    return _then(_$UsernameSettingsStateImpl(
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
      usernameInputController: null == usernameInputController
          ? _value.usernameInputController
          : usernameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateEnabled: null == isUpdateEnabled
          ? _value.isUpdateEnabled
          : isUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      currentUsername: null == currentUsername
          ? _value.currentUsername
          : currentUsername // ignore: cast_nullable_to_non_nullable
              as String,
      isUsernameUpdateSuccess: null == isUsernameUpdateSuccess
          ? _value.isUsernameUpdateSuccess
          : isUsernameUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsernameUpdateFailure: null == isUsernameUpdateFailure
          ? _value.isUsernameUpdateFailure
          : isUsernameUpdateFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UsernameSettingsStateImpl implements _UsernameSettingsState {
  _$UsernameSettingsStateImpl(
      {required this.isLoading,
      required this.isFailure,
      required this.isSuccess,
      required this.usernameInputController,
      required this.noUse,
      required this.hasError,
      required this.isUpdateEnabled,
      required this.userRepository,
      this.user,
      required this.currentUsername,
      required this.isUsernameUpdateSuccess,
      required this.isUsernameUpdateFailure});

  @override
  final bool isLoading;
  @override
  final bool isFailure;
  @override
  final bool isSuccess;
  @override
  final TextEditingController usernameInputController;
  @override
  final bool noUse;
  @override
  final bool hasError;
  @override
  final bool isUpdateEnabled;
  @override
  final UserRepository userRepository;
  @override
  final UserDto? user;
  @override
  final String currentUsername;
  @override
  final bool isUsernameUpdateSuccess;
  @override
  final bool isUsernameUpdateFailure;

  @override
  String toString() {
    return 'UsernameSettingsState(isLoading: $isLoading, isFailure: $isFailure, isSuccess: $isSuccess, usernameInputController: $usernameInputController, noUse: $noUse, hasError: $hasError, isUpdateEnabled: $isUpdateEnabled, userRepository: $userRepository, user: $user, currentUsername: $currentUsername, isUsernameUpdateSuccess: $isUsernameUpdateSuccess, isUsernameUpdateFailure: $isUsernameUpdateFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameSettingsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(
                    other.usernameInputController, usernameInputController) ||
                other.usernameInputController == usernameInputController) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isUpdateEnabled, isUpdateEnabled) ||
                other.isUpdateEnabled == isUpdateEnabled) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.currentUsername, currentUsername) ||
                other.currentUsername == currentUsername) &&
            (identical(
                    other.isUsernameUpdateSuccess, isUsernameUpdateSuccess) ||
                other.isUsernameUpdateSuccess == isUsernameUpdateSuccess) &&
            (identical(
                    other.isUsernameUpdateFailure, isUsernameUpdateFailure) ||
                other.isUsernameUpdateFailure == isUsernameUpdateFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFailure,
      isSuccess,
      usernameInputController,
      noUse,
      hasError,
      isUpdateEnabled,
      userRepository,
      user,
      currentUsername,
      isUsernameUpdateSuccess,
      isUsernameUpdateFailure);

  /// Create a copy of UsernameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameSettingsStateImplCopyWith<_$UsernameSettingsStateImpl>
      get copyWith => __$$UsernameSettingsStateImplCopyWithImpl<
          _$UsernameSettingsStateImpl>(this, _$identity);
}

abstract class _UsernameSettingsState implements UsernameSettingsState {
  factory _UsernameSettingsState(
          {required final bool isLoading,
          required final bool isFailure,
          required final bool isSuccess,
          required final TextEditingController usernameInputController,
          required final bool noUse,
          required final bool hasError,
          required final bool isUpdateEnabled,
          required final UserRepository userRepository,
          final UserDto? user,
          required final String currentUsername,
          required final bool isUsernameUpdateSuccess,
          required final bool isUsernameUpdateFailure}) =
      _$UsernameSettingsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFailure;
  @override
  bool get isSuccess;
  @override
  TextEditingController get usernameInputController;
  @override
  bool get noUse;
  @override
  bool get hasError;
  @override
  bool get isUpdateEnabled;
  @override
  UserRepository get userRepository;
  @override
  UserDto? get user;
  @override
  String get currentUsername;
  @override
  bool get isUsernameUpdateSuccess;
  @override
  bool get isUsernameUpdateFailure;

  /// Create a copy of UsernameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsernameSettingsStateImplCopyWith<_$UsernameSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
