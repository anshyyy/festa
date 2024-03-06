// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get isAccountDelete => throw _privateConstructorUsedError;
  bool get isLogout => throw _privateConstructorUsedError;
  String get responseMsg => throw _privateConstructorUsedError;
  AuthRepository get authRepository => throw _privateConstructorUsedError;
  AppStateNotifier get appStateNotifier => throw _privateConstructorUsedError;
  TextEditingController get menuSearchController =>
      throw _privateConstructorUsedError;
  List<SettingsMenuDto> get settingsMenu => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      bool isAccountDelete,
      bool isLogout,
      String responseMsg,
      AuthRepository authRepository,
      AppStateNotifier appStateNotifier,
      TextEditingController menuSearchController,
      List<SettingsMenuDto> settingsMenu,
      UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

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
    Object? isAccountDelete = null,
    Object? isLogout = null,
    Object? responseMsg = null,
    Object? authRepository = null,
    Object? appStateNotifier = null,
    Object? menuSearchController = null,
    Object? settingsMenu = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountDelete: null == isAccountDelete
          ? _value.isAccountDelete
          : isAccountDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogout: null == isLogout
          ? _value.isLogout
          : isLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: null == responseMsg
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      menuSearchController: null == menuSearchController
          ? _value.menuSearchController
          : menuSearchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      settingsMenu: null == settingsMenu
          ? _value.settingsMenu
          : settingsMenu // ignore: cast_nullable_to_non_nullable
              as List<SettingsMenuDto>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

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
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      bool isAccountDelete,
      bool isLogout,
      String responseMsg,
      AuthRepository authRepository,
      AppStateNotifier appStateNotifier,
      TextEditingController menuSearchController,
      List<SettingsMenuDto> settingsMenu,
      UserDto? user});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? isAccountDelete = null,
    Object? isLogout = null,
    Object? responseMsg = null,
    Object? authRepository = null,
    Object? appStateNotifier = null,
    Object? menuSearchController = null,
    Object? settingsMenu = null,
    Object? user = freezed,
  }) {
    return _then(_$ProfileStateImpl(
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
      isAccountDelete: null == isAccountDelete
          ? _value.isAccountDelete
          : isAccountDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogout: null == isLogout
          ? _value.isLogout
          : isLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: null == responseMsg
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      menuSearchController: null == menuSearchController
          ? _value.menuSearchController
          : menuSearchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      settingsMenu: null == settingsMenu
          ? _value._settingsMenu
          : settingsMenu // ignore: cast_nullable_to_non_nullable
              as List<SettingsMenuDto>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.isAccountDelete,
      required this.isLogout,
      required this.responseMsg,
      required this.authRepository,
      required this.appStateNotifier,
      required this.menuSearchController,
      required final List<SettingsMenuDto> settingsMenu,
      this.user})
      : _settingsMenu = settingsMenu;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final bool isAccountDelete;
  @override
  final bool isLogout;
  @override
  final String responseMsg;
  @override
  final AuthRepository authRepository;
  @override
  final AppStateNotifier appStateNotifier;
  @override
  final TextEditingController menuSearchController;
  final List<SettingsMenuDto> _settingsMenu;
  @override
  List<SettingsMenuDto> get settingsMenu {
    if (_settingsMenu is EqualUnmodifiableListView) return _settingsMenu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settingsMenu);
  }

  @override
  final UserDto? user;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, isAccountDelete: $isAccountDelete, isLogout: $isLogout, responseMsg: $responseMsg, authRepository: $authRepository, appStateNotifier: $appStateNotifier, menuSearchController: $menuSearchController, settingsMenu: $settingsMenu, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.isAccountDelete, isAccountDelete) ||
                other.isAccountDelete == isAccountDelete) &&
            (identical(other.isLogout, isLogout) ||
                other.isLogout == isLogout) &&
            (identical(other.responseMsg, responseMsg) ||
                other.responseMsg == responseMsg) &&
            (identical(other.authRepository, authRepository) ||
                other.authRepository == authRepository) &&
            (identical(other.appStateNotifier, appStateNotifier) ||
                other.appStateNotifier == appStateNotifier) &&
            (identical(other.menuSearchController, menuSearchController) ||
                other.menuSearchController == menuSearchController) &&
            const DeepCollectionEquality()
                .equals(other._settingsMenu, _settingsMenu) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      noUse,
      isAccountDelete,
      isLogout,
      responseMsg,
      authRepository,
      appStateNotifier,
      menuSearchController,
      const DeepCollectionEquality().hash(_settingsMenu),
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final bool isAccountDelete,
      required final bool isLogout,
      required final String responseMsg,
      required final AuthRepository authRepository,
      required final AppStateNotifier appStateNotifier,
      required final TextEditingController menuSearchController,
      required final List<SettingsMenuDto> settingsMenu,
      final UserDto? user}) = _$ProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  bool get isAccountDelete;
  @override
  bool get isLogout;
  @override
  String get responseMsg;
  @override
  AuthRepository get authRepository;
  @override
  AppStateNotifier get appStateNotifier;
  @override
  TextEditingController get menuSearchController;
  @override
  List<SettingsMenuDto> get settingsMenu;
  @override
  UserDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
