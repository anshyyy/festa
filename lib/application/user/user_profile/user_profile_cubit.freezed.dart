// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  CoreRepository get coreRepository => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  bool get qrExpandedView => throw _privateConstructorUsedError;
  AppStateNotifier get appStateNotifier => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileStateCopyWith<UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res, UserProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool isUpdating,
      bool noUse,
      String? profileImage,
      String? coverImage,
      CoreRepository coreRepository,
      UserRepository userRepository,
      UserDto? user,
      int userId,
      bool isFollowing,
      bool isBlocked,
      bool qrExpandedView,
      AppStateNotifier appStateNotifier});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res, $Val extends UserProfileState>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? isUpdating = null,
    Object? noUse = null,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? coreRepository = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? userId = null,
    Object? isFollowing = null,
    Object? isBlocked = null,
    Object? qrExpandedView = null,
    Object? appStateNotifier = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      qrExpandedView: null == qrExpandedView
          ? _value.qrExpandedView
          : qrExpandedView // ignore: cast_nullable_to_non_nullable
              as bool,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
    ) as $Val);
  }

  /// Create a copy of UserProfileState
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
abstract class _$$UserProfileStateImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$UserProfileStateImplCopyWith(_$UserProfileStateImpl value,
          $Res Function(_$UserProfileStateImpl) then) =
      __$$UserProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool isUpdating,
      bool noUse,
      String? profileImage,
      String? coverImage,
      CoreRepository coreRepository,
      UserRepository userRepository,
      UserDto? user,
      int userId,
      bool isFollowing,
      bool isBlocked,
      bool qrExpandedView,
      AppStateNotifier appStateNotifier});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserProfileStateImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$UserProfileStateImpl>
    implements _$$UserProfileStateImplCopyWith<$Res> {
  __$$UserProfileStateImplCopyWithImpl(_$UserProfileStateImpl _value,
      $Res Function(_$UserProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? isUpdating = null,
    Object? noUse = null,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? coreRepository = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? userId = null,
    Object? isFollowing = null,
    Object? isBlocked = null,
    Object? qrExpandedView = null,
    Object? appStateNotifier = null,
  }) {
    return _then(_$UserProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      qrExpandedView: null == qrExpandedView
          ? _value.qrExpandedView
          : qrExpandedView // ignore: cast_nullable_to_non_nullable
              as bool,
      appStateNotifier: null == appStateNotifier
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
    ));
  }
}

/// @nodoc

class _$UserProfileStateImpl implements _UserProfileState {
  const _$UserProfileStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.isUpdating,
      required this.noUse,
      this.profileImage,
      this.coverImage,
      required this.coreRepository,
      required this.userRepository,
      this.user,
      required this.userId,
      required this.isFollowing,
      required this.isBlocked,
      required this.qrExpandedView,
      required this.appStateNotifier});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool isUpdating;
  @override
  final bool noUse;
  @override
  final String? profileImage;
  @override
  final String? coverImage;
  @override
  final CoreRepository coreRepository;
  @override
  final UserRepository userRepository;
  @override
  final UserDto? user;
  @override
  final int userId;
  @override
  final bool isFollowing;
  @override
  final bool isBlocked;
  @override
  final bool qrExpandedView;
  @override
  final AppStateNotifier appStateNotifier;

  @override
  String toString() {
    return 'UserProfileState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, isUpdating: $isUpdating, noUse: $noUse, profileImage: $profileImage, coverImage: $coverImage, coreRepository: $coreRepository, userRepository: $userRepository, user: $user, userId: $userId, isFollowing: $isFollowing, isBlocked: $isBlocked, qrExpandedView: $qrExpandedView, appStateNotifier: $appStateNotifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.coreRepository, coreRepository) ||
                other.coreRepository == coreRepository) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.qrExpandedView, qrExpandedView) ||
                other.qrExpandedView == qrExpandedView) &&
            (identical(other.appStateNotifier, appStateNotifier) ||
                other.appStateNotifier == appStateNotifier));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccessful,
      isFailed,
      isUpdating,
      noUse,
      profileImage,
      coverImage,
      coreRepository,
      userRepository,
      user,
      userId,
      isFollowing,
      isBlocked,
      qrExpandedView,
      appStateNotifier);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileStateImplCopyWith<_$UserProfileStateImpl> get copyWith =>
      __$$UserProfileStateImplCopyWithImpl<_$UserProfileStateImpl>(
          this, _$identity);
}

abstract class _UserProfileState implements UserProfileState {
  const factory _UserProfileState(
          {required final bool isLoading,
          required final bool isSuccessful,
          required final bool isFailed,
          required final bool isUpdating,
          required final bool noUse,
          final String? profileImage,
          final String? coverImage,
          required final CoreRepository coreRepository,
          required final UserRepository userRepository,
          final UserDto? user,
          required final int userId,
          required final bool isFollowing,
          required final bool isBlocked,
          required final bool qrExpandedView,
          required final AppStateNotifier appStateNotifier}) =
      _$UserProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get isUpdating;
  @override
  bool get noUse;
  @override
  String? get profileImage;
  @override
  String? get coverImage;
  @override
  CoreRepository get coreRepository;
  @override
  UserRepository get userRepository;
  @override
  UserDto? get user;
  @override
  int get userId;
  @override
  bool get isFollowing;
  @override
  bool get isBlocked;
  @override
  bool get qrExpandedView;
  @override
  AppStateNotifier get appStateNotifier;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileStateImplCopyWith<_$UserProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
