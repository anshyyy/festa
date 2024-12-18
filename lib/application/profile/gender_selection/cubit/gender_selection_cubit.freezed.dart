// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenderSelectionState {
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaveEnable => throw _privateConstructorUsedError;
  List<String> get lsOFSex => throw _privateConstructorUsedError;
  List<String> get lsOFSexValue => throw _privateConstructorUsedError;
  bool get isSaveDetailsEnable => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get userGender => throw _privateConstructorUsedError;
  AppStateNotifier get appStateNotifier => throw _privateConstructorUsedError;
  AuthRepository get authRepository => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  int? get selectedSex => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  bool get genderUpdateSuccess => throw _privateConstructorUsedError;
  bool get genderUpdateFailure => throw _privateConstructorUsedError;

  /// Create a copy of GenderSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenderSelectionStateCopyWith<GenderSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderSelectionStateCopyWith<$Res> {
  factory $GenderSelectionStateCopyWith(GenderSelectionState value,
          $Res Function(GenderSelectionState) then) =
      _$GenderSelectionStateCopyWithImpl<$Res, GenderSelectionState>;
  @useResult
  $Res call(
      {bool isFailed,
      bool isSuccessful,
      bool isLoading,
      bool isSaveEnable,
      List<String> lsOFSex,
      List<String> lsOFSexValue,
      bool isSaveDetailsEnable,
      String errorMessage,
      String userGender,
      AppStateNotifier appStateNotifier,
      AuthRepository authRepository,
      UserRepository userRepository,
      int? selectedSex,
      UserDto? user,
      bool genderUpdateSuccess,
      bool genderUpdateFailure});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$GenderSelectionStateCopyWithImpl<$Res,
        $Val extends GenderSelectionState>
    implements $GenderSelectionStateCopyWith<$Res> {
  _$GenderSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenderSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? isLoading = null,
    Object? isSaveEnable = null,
    Object? lsOFSex = null,
    Object? lsOFSexValue = null,
    Object? isSaveDetailsEnable = null,
    Object? errorMessage = null,
    Object? userGender = null,
    Object? appStateNotifier = null,
    Object? authRepository = null,
    Object? userRepository = null,
    Object? selectedSex = freezed,
    Object? user = freezed,
    Object? genderUpdateSuccess = null,
    Object? genderUpdateFailure = null,
  }) {
    return _then(_value.copyWith(
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaveEnable: null == isSaveEnable
          ? _value.isSaveEnable
          : isSaveEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      lsOFSex: null == lsOFSex
          ? _value.lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lsOFSexValue: null == lsOFSexValue
          ? _value.lsOFSexValue
          : lsOFSexValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSaveDetailsEnable: null == isSaveDetailsEnable
          ? _value.isSaveDetailsEnable
          : isSaveDetailsEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userGender: null == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      selectedSex: freezed == selectedSex
          ? _value.selectedSex
          : selectedSex // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      genderUpdateSuccess: null == genderUpdateSuccess
          ? _value.genderUpdateSuccess
          : genderUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      genderUpdateFailure: null == genderUpdateFailure
          ? _value.genderUpdateFailure
          : genderUpdateFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of GenderSelectionState
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
abstract class _$$GenderSelectionStateImplCopyWith<$Res>
    implements $GenderSelectionStateCopyWith<$Res> {
  factory _$$GenderSelectionStateImplCopyWith(_$GenderSelectionStateImpl value,
          $Res Function(_$GenderSelectionStateImpl) then) =
      __$$GenderSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFailed,
      bool isSuccessful,
      bool isLoading,
      bool isSaveEnable,
      List<String> lsOFSex,
      List<String> lsOFSexValue,
      bool isSaveDetailsEnable,
      String errorMessage,
      String userGender,
      AppStateNotifier appStateNotifier,
      AuthRepository authRepository,
      UserRepository userRepository,
      int? selectedSex,
      UserDto? user,
      bool genderUpdateSuccess,
      bool genderUpdateFailure});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GenderSelectionStateImplCopyWithImpl<$Res>
    extends _$GenderSelectionStateCopyWithImpl<$Res, _$GenderSelectionStateImpl>
    implements _$$GenderSelectionStateImplCopyWith<$Res> {
  __$$GenderSelectionStateImplCopyWithImpl(_$GenderSelectionStateImpl _value,
      $Res Function(_$GenderSelectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenderSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? isLoading = null,
    Object? isSaveEnable = null,
    Object? lsOFSex = null,
    Object? lsOFSexValue = null,
    Object? isSaveDetailsEnable = null,
    Object? errorMessage = null,
    Object? userGender = null,
    Object? appStateNotifier = null,
    Object? authRepository = null,
    Object? userRepository = null,
    Object? selectedSex = freezed,
    Object? user = freezed,
    Object? genderUpdateSuccess = null,
    Object? genderUpdateFailure = null,
  }) {
    return _then(_$GenderSelectionStateImpl(
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaveEnable: null == isSaveEnable
          ? _value.isSaveEnable
          : isSaveEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      lsOFSex: null == lsOFSex
          ? _value._lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lsOFSexValue: null == lsOFSexValue
          ? _value._lsOFSexValue
          : lsOFSexValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSaveDetailsEnable: null == isSaveDetailsEnable
          ? _value.isSaveDetailsEnable
          : isSaveDetailsEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userGender: null == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      authRepository: null == authRepository
          ? _value.authRepository
          : authRepository // ignore: cast_nullable_to_non_nullable
              as AuthRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      selectedSex: freezed == selectedSex
          ? _value.selectedSex
          : selectedSex // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      genderUpdateSuccess: null == genderUpdateSuccess
          ? _value.genderUpdateSuccess
          : genderUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      genderUpdateFailure: null == genderUpdateFailure
          ? _value.genderUpdateFailure
          : genderUpdateFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GenderSelectionStateImpl implements _GenderSelectionState {
  const _$GenderSelectionStateImpl(
      {required this.isFailed,
      required this.isSuccessful,
      required this.isLoading,
      required this.isSaveEnable,
      required final List<String> lsOFSex,
      required final List<String> lsOFSexValue,
      required this.isSaveDetailsEnable,
      required this.errorMessage,
      required this.userGender,
      required this.appStateNotifier,
      required this.authRepository,
      required this.userRepository,
      this.selectedSex,
      this.user,
      required this.genderUpdateSuccess,
      required this.genderUpdateFailure})
      : _lsOFSex = lsOFSex,
        _lsOFSexValue = lsOFSexValue;

  @override
  final bool isFailed;
  @override
  final bool isSuccessful;
  @override
  final bool isLoading;
  @override
  final bool isSaveEnable;
  final List<String> _lsOFSex;
  @override
  List<String> get lsOFSex {
    if (_lsOFSex is EqualUnmodifiableListView) return _lsOFSex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOFSex);
  }

  final List<String> _lsOFSexValue;
  @override
  List<String> get lsOFSexValue {
    if (_lsOFSexValue is EqualUnmodifiableListView) return _lsOFSexValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOFSexValue);
  }

  @override
  final bool isSaveDetailsEnable;
  @override
  final String errorMessage;
  @override
  final String userGender;
  @override
  final AppStateNotifier appStateNotifier;
  @override
  final AuthRepository authRepository;
  @override
  final UserRepository userRepository;
  @override
  final int? selectedSex;
  @override
  final UserDto? user;
  @override
  final bool genderUpdateSuccess;
  @override
  final bool genderUpdateFailure;

  @override
  String toString() {
    return 'GenderSelectionState(isFailed: $isFailed, isSuccessful: $isSuccessful, isLoading: $isLoading, isSaveEnable: $isSaveEnable, lsOFSex: $lsOFSex, lsOFSexValue: $lsOFSexValue, isSaveDetailsEnable: $isSaveDetailsEnable, errorMessage: $errorMessage, userGender: $userGender, appStateNotifier: $appStateNotifier, authRepository: $authRepository, userRepository: $userRepository, selectedSex: $selectedSex, user: $user, genderUpdateSuccess: $genderUpdateSuccess, genderUpdateFailure: $genderUpdateFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderSelectionStateImpl &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaveEnable, isSaveEnable) ||
                other.isSaveEnable == isSaveEnable) &&
            const DeepCollectionEquality().equals(other._lsOFSex, _lsOFSex) &&
            const DeepCollectionEquality()
                .equals(other._lsOFSexValue, _lsOFSexValue) &&
            (identical(other.isSaveDetailsEnable, isSaveDetailsEnable) ||
                other.isSaveDetailsEnable == isSaveDetailsEnable) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.userGender, userGender) ||
                other.userGender == userGender) &&
            (identical(other.appStateNotifier, appStateNotifier) ||
                other.appStateNotifier == appStateNotifier) &&
            (identical(other.authRepository, authRepository) ||
                other.authRepository == authRepository) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.selectedSex, selectedSex) ||
                other.selectedSex == selectedSex) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.genderUpdateSuccess, genderUpdateSuccess) ||
                other.genderUpdateSuccess == genderUpdateSuccess) &&
            (identical(other.genderUpdateFailure, genderUpdateFailure) ||
                other.genderUpdateFailure == genderUpdateFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFailed,
      isSuccessful,
      isLoading,
      isSaveEnable,
      const DeepCollectionEquality().hash(_lsOFSex),
      const DeepCollectionEquality().hash(_lsOFSexValue),
      isSaveDetailsEnable,
      errorMessage,
      userGender,
      appStateNotifier,
      authRepository,
      userRepository,
      selectedSex,
      user,
      genderUpdateSuccess,
      genderUpdateFailure);

  /// Create a copy of GenderSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderSelectionStateImplCopyWith<_$GenderSelectionStateImpl>
      get copyWith =>
          __$$GenderSelectionStateImplCopyWithImpl<_$GenderSelectionStateImpl>(
              this, _$identity);
}

abstract class _GenderSelectionState implements GenderSelectionState {
  const factory _GenderSelectionState(
      {required final bool isFailed,
      required final bool isSuccessful,
      required final bool isLoading,
      required final bool isSaveEnable,
      required final List<String> lsOFSex,
      required final List<String> lsOFSexValue,
      required final bool isSaveDetailsEnable,
      required final String errorMessage,
      required final String userGender,
      required final AppStateNotifier appStateNotifier,
      required final AuthRepository authRepository,
      required final UserRepository userRepository,
      final int? selectedSex,
      final UserDto? user,
      required final bool genderUpdateSuccess,
      required final bool genderUpdateFailure}) = _$GenderSelectionStateImpl;

  @override
  bool get isFailed;
  @override
  bool get isSuccessful;
  @override
  bool get isLoading;
  @override
  bool get isSaveEnable;
  @override
  List<String> get lsOFSex;
  @override
  List<String> get lsOFSexValue;
  @override
  bool get isSaveDetailsEnable;
  @override
  String get errorMessage;
  @override
  String get userGender;
  @override
  AppStateNotifier get appStateNotifier;
  @override
  AuthRepository get authRepository;
  @override
  UserRepository get userRepository;
  @override
  int? get selectedSex;
  @override
  UserDto? get user;
  @override
  bool get genderUpdateSuccess;
  @override
  bool get genderUpdateFailure;

  /// Create a copy of GenderSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenderSelectionStateImplCopyWith<_$GenderSelectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
