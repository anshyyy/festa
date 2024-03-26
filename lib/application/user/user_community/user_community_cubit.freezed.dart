// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_community_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserCommunityState {
  bool get isFollowersFetching => throw _privateConstructorUsedError;
  bool get isFriendsFetching => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get followersPage => throw _privateConstructorUsedError;
  int get friendsPage => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  CommunityDto get userFollowers => throw _privateConstructorUsedError;
  CommunityDto get userFriends => throw _privateConstructorUsedError;
  int get pubFollowersCount => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  ScrollController get followersScrollController =>
      throw _privateConstructorUsedError;
  ScrollController get friendsScrollController =>
      throw _privateConstructorUsedError;
  bool get hasMoreFollowers => throw _privateConstructorUsedError;
  bool get hasMoreFriends => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCommunityStateCopyWith<UserCommunityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCommunityStateCopyWith<$Res> {
  factory $UserCommunityStateCopyWith(
          UserCommunityState value, $Res Function(UserCommunityState) then) =
      _$UserCommunityStateCopyWithImpl<$Res, UserCommunityState>;
  @useResult
  $Res call(
      {bool isFollowersFetching,
      bool isFriendsFetching,
      bool isFailed,
      bool isSuccessful,
      int userId,
      String username,
      int followersPage,
      int friendsPage,
      UserRepository userRepository,
      CommunityDto userFollowers,
      CommunityDto userFriends,
      int pubFollowersCount,
      ScrollController scrollController,
      ScrollController followersScrollController,
      ScrollController friendsScrollController,
      bool hasMoreFollowers,
      bool hasMoreFriends});

  $CommunityDtoCopyWith<$Res> get userFollowers;
  $CommunityDtoCopyWith<$Res> get userFriends;
}

/// @nodoc
class _$UserCommunityStateCopyWithImpl<$Res, $Val extends UserCommunityState>
    implements $UserCommunityStateCopyWith<$Res> {
  _$UserCommunityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowersFetching = null,
    Object? isFriendsFetching = null,
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? userId = null,
    Object? username = null,
    Object? followersPage = null,
    Object? friendsPage = null,
    Object? userRepository = null,
    Object? userFollowers = null,
    Object? userFriends = null,
    Object? pubFollowersCount = null,
    Object? scrollController = null,
    Object? followersScrollController = null,
    Object? friendsScrollController = null,
    Object? hasMoreFollowers = null,
    Object? hasMoreFriends = null,
  }) {
    return _then(_value.copyWith(
      isFollowersFetching: null == isFollowersFetching
          ? _value.isFollowersFetching
          : isFollowersFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriendsFetching: null == isFriendsFetching
          ? _value.isFriendsFetching
          : isFriendsFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followersPage: null == followersPage
          ? _value.followersPage
          : followersPage // ignore: cast_nullable_to_non_nullable
              as int,
      friendsPage: null == friendsPage
          ? _value.friendsPage
          : friendsPage // ignore: cast_nullable_to_non_nullable
              as int,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      userFollowers: null == userFollowers
          ? _value.userFollowers
          : userFollowers // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      userFriends: null == userFriends
          ? _value.userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      pubFollowersCount: null == pubFollowersCount
          ? _value.pubFollowersCount
          : pubFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      followersScrollController: null == followersScrollController
          ? _value.followersScrollController
          : followersScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      friendsScrollController: null == friendsScrollController
          ? _value.friendsScrollController
          : friendsScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      hasMoreFollowers: null == hasMoreFollowers
          ? _value.hasMoreFollowers
          : hasMoreFollowers // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreFriends: null == hasMoreFriends
          ? _value.hasMoreFriends
          : hasMoreFriends // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunityDtoCopyWith<$Res> get userFollowers {
    return $CommunityDtoCopyWith<$Res>(_value.userFollowers, (value) {
      return _then(_value.copyWith(userFollowers: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunityDtoCopyWith<$Res> get userFriends {
    return $CommunityDtoCopyWith<$Res>(_value.userFriends, (value) {
      return _then(_value.copyWith(userFriends: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserCommunityStateImplCopyWith<$Res>
    implements $UserCommunityStateCopyWith<$Res> {
  factory _$$UserCommunityStateImplCopyWith(_$UserCommunityStateImpl value,
          $Res Function(_$UserCommunityStateImpl) then) =
      __$$UserCommunityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFollowersFetching,
      bool isFriendsFetching,
      bool isFailed,
      bool isSuccessful,
      int userId,
      String username,
      int followersPage,
      int friendsPage,
      UserRepository userRepository,
      CommunityDto userFollowers,
      CommunityDto userFriends,
      int pubFollowersCount,
      ScrollController scrollController,
      ScrollController followersScrollController,
      ScrollController friendsScrollController,
      bool hasMoreFollowers,
      bool hasMoreFriends});

  @override
  $CommunityDtoCopyWith<$Res> get userFollowers;
  @override
  $CommunityDtoCopyWith<$Res> get userFriends;
}

/// @nodoc
class __$$UserCommunityStateImplCopyWithImpl<$Res>
    extends _$UserCommunityStateCopyWithImpl<$Res, _$UserCommunityStateImpl>
    implements _$$UserCommunityStateImplCopyWith<$Res> {
  __$$UserCommunityStateImplCopyWithImpl(_$UserCommunityStateImpl _value,
      $Res Function(_$UserCommunityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowersFetching = null,
    Object? isFriendsFetching = null,
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? userId = null,
    Object? username = null,
    Object? followersPage = null,
    Object? friendsPage = null,
    Object? userRepository = null,
    Object? userFollowers = null,
    Object? userFriends = null,
    Object? pubFollowersCount = null,
    Object? scrollController = null,
    Object? followersScrollController = null,
    Object? friendsScrollController = null,
    Object? hasMoreFollowers = null,
    Object? hasMoreFriends = null,
  }) {
    return _then(_$UserCommunityStateImpl(
      isFollowersFetching: null == isFollowersFetching
          ? _value.isFollowersFetching
          : isFollowersFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriendsFetching: null == isFriendsFetching
          ? _value.isFriendsFetching
          : isFriendsFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followersPage: null == followersPage
          ? _value.followersPage
          : followersPage // ignore: cast_nullable_to_non_nullable
              as int,
      friendsPage: null == friendsPage
          ? _value.friendsPage
          : friendsPage // ignore: cast_nullable_to_non_nullable
              as int,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      userFollowers: null == userFollowers
          ? _value.userFollowers
          : userFollowers // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      userFriends: null == userFriends
          ? _value.userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      pubFollowersCount: null == pubFollowersCount
          ? _value.pubFollowersCount
          : pubFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      followersScrollController: null == followersScrollController
          ? _value.followersScrollController
          : followersScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      friendsScrollController: null == friendsScrollController
          ? _value.friendsScrollController
          : friendsScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      hasMoreFollowers: null == hasMoreFollowers
          ? _value.hasMoreFollowers
          : hasMoreFollowers // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreFriends: null == hasMoreFriends
          ? _value.hasMoreFriends
          : hasMoreFriends // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserCommunityStateImpl implements _UserCommunityState {
  const _$UserCommunityStateImpl(
      {required this.isFollowersFetching,
      required this.isFriendsFetching,
      required this.isFailed,
      required this.isSuccessful,
      required this.userId,
      required this.username,
      required this.followersPage,
      required this.friendsPage,
      required this.userRepository,
      required this.userFollowers,
      required this.userFriends,
      required this.pubFollowersCount,
      required this.scrollController,
      required this.followersScrollController,
      required this.friendsScrollController,
      required this.hasMoreFollowers,
      required this.hasMoreFriends});

  @override
  final bool isFollowersFetching;
  @override
  final bool isFriendsFetching;
  @override
  final bool isFailed;
  @override
  final bool isSuccessful;
  @override
  final int userId;
  @override
  final String username;
  @override
  final int followersPage;
  @override
  final int friendsPage;
  @override
  final UserRepository userRepository;
  @override
  final CommunityDto userFollowers;
  @override
  final CommunityDto userFriends;
  @override
  final int pubFollowersCount;
  @override
  final ScrollController scrollController;
  @override
  final ScrollController followersScrollController;
  @override
  final ScrollController friendsScrollController;
  @override
  final bool hasMoreFollowers;
  @override
  final bool hasMoreFriends;

  @override
  String toString() {
    return 'UserCommunityState(isFollowersFetching: $isFollowersFetching, isFriendsFetching: $isFriendsFetching, isFailed: $isFailed, isSuccessful: $isSuccessful, userId: $userId, username: $username, followersPage: $followersPage, friendsPage: $friendsPage, userRepository: $userRepository, userFollowers: $userFollowers, userFriends: $userFriends, pubFollowersCount: $pubFollowersCount, scrollController: $scrollController, followersScrollController: $followersScrollController, friendsScrollController: $friendsScrollController, hasMoreFollowers: $hasMoreFollowers, hasMoreFriends: $hasMoreFriends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCommunityStateImpl &&
            (identical(other.isFollowersFetching, isFollowersFetching) ||
                other.isFollowersFetching == isFollowersFetching) &&
            (identical(other.isFriendsFetching, isFriendsFetching) ||
                other.isFriendsFetching == isFriendsFetching) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.followersPage, followersPage) ||
                other.followersPage == followersPage) &&
            (identical(other.friendsPage, friendsPage) ||
                other.friendsPage == friendsPage) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.userFollowers, userFollowers) ||
                other.userFollowers == userFollowers) &&
            (identical(other.userFriends, userFriends) ||
                other.userFriends == userFriends) &&
            (identical(other.pubFollowersCount, pubFollowersCount) ||
                other.pubFollowersCount == pubFollowersCount) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.followersScrollController,
                    followersScrollController) ||
                other.followersScrollController == followersScrollController) &&
            (identical(
                    other.friendsScrollController, friendsScrollController) ||
                other.friendsScrollController == friendsScrollController) &&
            (identical(other.hasMoreFollowers, hasMoreFollowers) ||
                other.hasMoreFollowers == hasMoreFollowers) &&
            (identical(other.hasMoreFriends, hasMoreFriends) ||
                other.hasMoreFriends == hasMoreFriends));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFollowersFetching,
      isFriendsFetching,
      isFailed,
      isSuccessful,
      userId,
      username,
      followersPage,
      friendsPage,
      userRepository,
      userFollowers,
      userFriends,
      pubFollowersCount,
      scrollController,
      followersScrollController,
      friendsScrollController,
      hasMoreFollowers,
      hasMoreFriends);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCommunityStateImplCopyWith<_$UserCommunityStateImpl> get copyWith =>
      __$$UserCommunityStateImplCopyWithImpl<_$UserCommunityStateImpl>(
          this, _$identity);
}

abstract class _UserCommunityState implements UserCommunityState {
  const factory _UserCommunityState(
      {required final bool isFollowersFetching,
      required final bool isFriendsFetching,
      required final bool isFailed,
      required final bool isSuccessful,
      required final int userId,
      required final String username,
      required final int followersPage,
      required final int friendsPage,
      required final UserRepository userRepository,
      required final CommunityDto userFollowers,
      required final CommunityDto userFriends,
      required final int pubFollowersCount,
      required final ScrollController scrollController,
      required final ScrollController followersScrollController,
      required final ScrollController friendsScrollController,
      required final bool hasMoreFollowers,
      required final bool hasMoreFriends}) = _$UserCommunityStateImpl;

  @override
  bool get isFollowersFetching;
  @override
  bool get isFriendsFetching;
  @override
  bool get isFailed;
  @override
  bool get isSuccessful;
  @override
  int get userId;
  @override
  String get username;
  @override
  int get followersPage;
  @override
  int get friendsPage;
  @override
  UserRepository get userRepository;
  @override
  CommunityDto get userFollowers;
  @override
  CommunityDto get userFriends;
  @override
  int get pubFollowersCount;
  @override
  ScrollController get scrollController;
  @override
  ScrollController get followersScrollController;
  @override
  ScrollController get friendsScrollController;
  @override
  bool get hasMoreFollowers;
  @override
  bool get hasMoreFriends;
  @override
  @JsonKey(ignore: true)
  _$$UserCommunityStateImplCopyWith<_$UserCommunityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
