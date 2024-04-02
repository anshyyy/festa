// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_username_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddUsernameState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  TextEditingController get usernameInputController =>
      throw _privateConstructorUsedError;
  bool get isUpdateEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddUsernameStateCopyWith<AddUsernameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUsernameStateCopyWith<$Res> {
  factory $AddUsernameStateCopyWith(
          AddUsernameState value, $Res Function(AddUsernameState) then) =
      _$AddUsernameStateCopyWithImpl<$Res, AddUsernameState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      UserRepository userRepository,
      TextEditingController usernameInputController,
      bool isUpdateEnabled});
}

/// @nodoc
class _$AddUsernameStateCopyWithImpl<$Res, $Val extends AddUsernameState>
    implements $AddUsernameStateCopyWith<$Res> {
  _$AddUsernameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? userRepository = null,
    Object? usernameInputController = null,
    Object? isUpdateEnabled = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      usernameInputController: null == usernameInputController
          ? _value.usernameInputController
          : usernameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isUpdateEnabled: null == isUpdateEnabled
          ? _value.isUpdateEnabled
          : isUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddUsernameStateImplCopyWith<$Res>
    implements $AddUsernameStateCopyWith<$Res> {
  factory _$$AddUsernameStateImplCopyWith(_$AddUsernameStateImpl value,
          $Res Function(_$AddUsernameStateImpl) then) =
      __$$AddUsernameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      UserRepository userRepository,
      TextEditingController usernameInputController,
      bool isUpdateEnabled});
}

/// @nodoc
class __$$AddUsernameStateImplCopyWithImpl<$Res>
    extends _$AddUsernameStateCopyWithImpl<$Res, _$AddUsernameStateImpl>
    implements _$$AddUsernameStateImplCopyWith<$Res> {
  __$$AddUsernameStateImplCopyWithImpl(_$AddUsernameStateImpl _value,
      $Res Function(_$AddUsernameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? userRepository = null,
    Object? usernameInputController = null,
    Object? isUpdateEnabled = null,
  }) {
    return _then(_$AddUsernameStateImpl(
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      usernameInputController: null == usernameInputController
          ? _value.usernameInputController
          : usernameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isUpdateEnabled: null == isUpdateEnabled
          ? _value.isUpdateEnabled
          : isUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddUsernameStateImpl implements _AddUsernameState {
  const _$AddUsernameStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.userRepository,
      required this.usernameInputController,
      required this.isUpdateEnabled});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final UserRepository userRepository;
  @override
  final TextEditingController usernameInputController;
  @override
  final bool isUpdateEnabled;

  @override
  String toString() {
    return 'AddUsernameState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, userRepository: $userRepository, usernameInputController: $usernameInputController, isUpdateEnabled: $isUpdateEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUsernameStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(
                    other.usernameInputController, usernameInputController) ||
                other.usernameInputController == usernameInputController) &&
            (identical(other.isUpdateEnabled, isUpdateEnabled) ||
                other.isUpdateEnabled == isUpdateEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailure,
      noUse, userRepository, usernameInputController, isUpdateEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUsernameStateImplCopyWith<_$AddUsernameStateImpl> get copyWith =>
      __$$AddUsernameStateImplCopyWithImpl<_$AddUsernameStateImpl>(
          this, _$identity);
}

abstract class _AddUsernameState implements AddUsernameState {
  const factory _AddUsernameState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final UserRepository userRepository,
      required final TextEditingController usernameInputController,
      required final bool isUpdateEnabled}) = _$AddUsernameStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  UserRepository get userRepository;
  @override
  TextEditingController get usernameInputController;
  @override
  bool get isUpdateEnabled;
  @override
  @JsonKey(ignore: true)
  _$$AddUsernameStateImplCopyWith<_$AddUsernameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
