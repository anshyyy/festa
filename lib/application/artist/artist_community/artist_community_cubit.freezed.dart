// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_community_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtistCommunityState {
  bool get isFollowersFetching => throw _privateConstructorUsedError;
  bool get isFriendsFetching => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  int get artistId => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  ArtistRepository get artistRepository => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  CommunityDto? get artistFollowers => throw _privateConstructorUsedError;
  CommunityDto? get artistFriends => throw _privateConstructorUsedError;
  ScrollController get followersScrollController =>
      throw _privateConstructorUsedError;
  ScrollController get friendsScrollController =>
      throw _privateConstructorUsedError;
  bool get hasMoreFollowers => throw _privateConstructorUsedError;
  bool get hasMoreFriends => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtistCommunityStateCopyWith<ArtistCommunityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCommunityStateCopyWith<$Res> {
  factory $ArtistCommunityStateCopyWith(ArtistCommunityState value,
          $Res Function(ArtistCommunityState) then) =
      _$ArtistCommunityStateCopyWithImpl<$Res, ArtistCommunityState>;
  @useResult
  $Res call(
      {bool isFollowersFetching,
      bool isFriendsFetching,
      bool isFailed,
      bool isSuccessful,
      int artistId,
      String artistName,
      int page,
      ArtistRepository artistRepository,
      UserRepository userRepository,
      CommunityDto? artistFollowers,
      CommunityDto? artistFriends,
      ScrollController followersScrollController,
      ScrollController friendsScrollController,
      bool hasMoreFollowers,
      bool hasMoreFriends});

  $CommunityDtoCopyWith<$Res>? get artistFollowers;
  $CommunityDtoCopyWith<$Res>? get artistFriends;
}

/// @nodoc
class _$ArtistCommunityStateCopyWithImpl<$Res,
        $Val extends ArtistCommunityState>
    implements $ArtistCommunityStateCopyWith<$Res> {
  _$ArtistCommunityStateCopyWithImpl(this._value, this._then);

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
    Object? artistId = null,
    Object? artistName = null,
    Object? page = null,
    Object? artistRepository = null,
    Object? userRepository = null,
    Object? artistFollowers = freezed,
    Object? artistFriends = freezed,
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
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as ArtistRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      artistFollowers: freezed == artistFollowers
          ? _value.artistFollowers
          : artistFollowers // ignore: cast_nullable_to_non_nullable
              as CommunityDto?,
      artistFriends: freezed == artistFriends
          ? _value.artistFriends
          : artistFriends // ignore: cast_nullable_to_non_nullable
              as CommunityDto?,
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
  $CommunityDtoCopyWith<$Res>? get artistFollowers {
    if (_value.artistFollowers == null) {
      return null;
    }

    return $CommunityDtoCopyWith<$Res>(_value.artistFollowers!, (value) {
      return _then(_value.copyWith(artistFollowers: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunityDtoCopyWith<$Res>? get artistFriends {
    if (_value.artistFriends == null) {
      return null;
    }

    return $CommunityDtoCopyWith<$Res>(_value.artistFriends!, (value) {
      return _then(_value.copyWith(artistFriends: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtistCommunityStateImplCopyWith<$Res>
    implements $ArtistCommunityStateCopyWith<$Res> {
  factory _$$ArtistCommunityStateImplCopyWith(_$ArtistCommunityStateImpl value,
          $Res Function(_$ArtistCommunityStateImpl) then) =
      __$$ArtistCommunityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFollowersFetching,
      bool isFriendsFetching,
      bool isFailed,
      bool isSuccessful,
      int artistId,
      String artistName,
      int page,
      ArtistRepository artistRepository,
      UserRepository userRepository,
      CommunityDto? artistFollowers,
      CommunityDto? artistFriends,
      ScrollController followersScrollController,
      ScrollController friendsScrollController,
      bool hasMoreFollowers,
      bool hasMoreFriends});

  @override
  $CommunityDtoCopyWith<$Res>? get artistFollowers;
  @override
  $CommunityDtoCopyWith<$Res>? get artistFriends;
}

/// @nodoc
class __$$ArtistCommunityStateImplCopyWithImpl<$Res>
    extends _$ArtistCommunityStateCopyWithImpl<$Res, _$ArtistCommunityStateImpl>
    implements _$$ArtistCommunityStateImplCopyWith<$Res> {
  __$$ArtistCommunityStateImplCopyWithImpl(_$ArtistCommunityStateImpl _value,
      $Res Function(_$ArtistCommunityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowersFetching = null,
    Object? isFriendsFetching = null,
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? artistId = null,
    Object? artistName = null,
    Object? page = null,
    Object? artistRepository = null,
    Object? userRepository = null,
    Object? artistFollowers = freezed,
    Object? artistFriends = freezed,
    Object? followersScrollController = null,
    Object? friendsScrollController = null,
    Object? hasMoreFollowers = null,
    Object? hasMoreFriends = null,
  }) {
    return _then(_$ArtistCommunityStateImpl(
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
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as ArtistRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      artistFollowers: freezed == artistFollowers
          ? _value.artistFollowers
          : artistFollowers // ignore: cast_nullable_to_non_nullable
              as CommunityDto?,
      artistFriends: freezed == artistFriends
          ? _value.artistFriends
          : artistFriends // ignore: cast_nullable_to_non_nullable
              as CommunityDto?,
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

class _$ArtistCommunityStateImpl implements _ArtistCommunityState {
  const _$ArtistCommunityStateImpl(
      {required this.isFollowersFetching,
      required this.isFriendsFetching,
      required this.isFailed,
      required this.isSuccessful,
      required this.artistId,
      required this.artistName,
      required this.page,
      required this.artistRepository,
      required this.userRepository,
      this.artistFollowers,
      this.artistFriends,
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
  final int artistId;
  @override
  final String artistName;
  @override
  final int page;
  @override
  final ArtistRepository artistRepository;
  @override
  final UserRepository userRepository;
  @override
  final CommunityDto? artistFollowers;
  @override
  final CommunityDto? artistFriends;
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
    return 'ArtistCommunityState(isFollowersFetching: $isFollowersFetching, isFriendsFetching: $isFriendsFetching, isFailed: $isFailed, isSuccessful: $isSuccessful, artistId: $artistId, artistName: $artistName, page: $page, artistRepository: $artistRepository, userRepository: $userRepository, artistFollowers: $artistFollowers, artistFriends: $artistFriends, followersScrollController: $followersScrollController, friendsScrollController: $friendsScrollController, hasMoreFollowers: $hasMoreFollowers, hasMoreFriends: $hasMoreFriends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistCommunityStateImpl &&
            (identical(other.isFollowersFetching, isFollowersFetching) ||
                other.isFollowersFetching == isFollowersFetching) &&
            (identical(other.isFriendsFetching, isFriendsFetching) ||
                other.isFriendsFetching == isFriendsFetching) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.artistRepository, artistRepository) ||
                other.artistRepository == artistRepository) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.artistFollowers, artistFollowers) ||
                other.artistFollowers == artistFollowers) &&
            (identical(other.artistFriends, artistFriends) ||
                other.artistFriends == artistFriends) &&
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
      artistId,
      artistName,
      page,
      artistRepository,
      userRepository,
      artistFollowers,
      artistFriends,
      followersScrollController,
      friendsScrollController,
      hasMoreFollowers,
      hasMoreFriends);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistCommunityStateImplCopyWith<_$ArtistCommunityStateImpl>
      get copyWith =>
          __$$ArtistCommunityStateImplCopyWithImpl<_$ArtistCommunityStateImpl>(
              this, _$identity);
}

abstract class _ArtistCommunityState implements ArtistCommunityState {
  const factory _ArtistCommunityState(
      {required final bool isFollowersFetching,
      required final bool isFriendsFetching,
      required final bool isFailed,
      required final bool isSuccessful,
      required final int artistId,
      required final String artistName,
      required final int page,
      required final ArtistRepository artistRepository,
      required final UserRepository userRepository,
      final CommunityDto? artistFollowers,
      final CommunityDto? artistFriends,
      required final ScrollController followersScrollController,
      required final ScrollController friendsScrollController,
      required final bool hasMoreFollowers,
      required final bool hasMoreFriends}) = _$ArtistCommunityStateImpl;

  @override
  bool get isFollowersFetching;
  @override
  bool get isFriendsFetching;
  @override
  bool get isFailed;
  @override
  bool get isSuccessful;
  @override
  int get artistId;
  @override
  String get artistName;
  @override
  int get page;
  @override
  ArtistRepository get artistRepository;
  @override
  UserRepository get userRepository;
  @override
  CommunityDto? get artistFollowers;
  @override
  CommunityDto? get artistFriends;
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
  _$$ArtistCommunityStateImplCopyWith<_$ArtistCommunityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
