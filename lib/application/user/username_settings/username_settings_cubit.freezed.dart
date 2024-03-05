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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsernameSettingsState {
  TextEditingController get usernameInputController =>
      throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      {TextEditingController usernameInputController,
      bool noUse,
      bool hasError});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInputController = null,
    Object? noUse = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
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
      {TextEditingController usernameInputController,
      bool noUse,
      bool hasError});
}

/// @nodoc
class __$$UsernameSettingsStateImplCopyWithImpl<$Res>
    extends _$UsernameSettingsStateCopyWithImpl<$Res,
        _$UsernameSettingsStateImpl>
    implements _$$UsernameSettingsStateImplCopyWith<$Res> {
  __$$UsernameSettingsStateImplCopyWithImpl(_$UsernameSettingsStateImpl _value,
      $Res Function(_$UsernameSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInputController = null,
    Object? noUse = null,
    Object? hasError = null,
  }) {
    return _then(_$UsernameSettingsStateImpl(
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
    ));
  }
}

/// @nodoc

class _$UsernameSettingsStateImpl implements _UsernameSettingsState {
  _$UsernameSettingsStateImpl(
      {required this.usernameInputController,
      required this.noUse,
      required this.hasError});

  @override
  final TextEditingController usernameInputController;
  @override
  final bool noUse;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'UsernameSettingsState(usernameInputController: $usernameInputController, noUse: $noUse, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameSettingsStateImpl &&
            (identical(
                    other.usernameInputController, usernameInputController) ||
                other.usernameInputController == usernameInputController) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, usernameInputController, noUse, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameSettingsStateImplCopyWith<_$UsernameSettingsStateImpl>
      get copyWith => __$$UsernameSettingsStateImplCopyWithImpl<
          _$UsernameSettingsStateImpl>(this, _$identity);
}

abstract class _UsernameSettingsState implements UsernameSettingsState {
  factory _UsernameSettingsState(
      {required final TextEditingController usernameInputController,
      required final bool noUse,
      required final bool hasError}) = _$UsernameSettingsStateImpl;

  @override
  TextEditingController get usernameInputController;
  @override
  bool get noUse;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$UsernameSettingsStateImplCopyWith<_$UsernameSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
