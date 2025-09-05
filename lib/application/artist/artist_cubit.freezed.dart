// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArtistState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  int get artistId => throw _privateConstructorUsedError;
  bool get isAtTop => throw _privateConstructorUsedError;
  DraggableScrollableController get dragController =>
      throw _privateConstructorUsedError;
  ArtistProfileDto? get artistProfile => throw _privateConstructorUsedError;
  IArtistRepository get artistRepository => throw _privateConstructorUsedError;
  IUserRepository get userRepository => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistStateCopyWith<ArtistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistStateCopyWith<$Res> {
  factory $ArtistStateCopyWith(
          ArtistState value, $Res Function(ArtistState) then) =
      _$ArtistStateCopyWithImpl<$Res, ArtistState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      int artistId,
      bool isAtTop,
      DraggableScrollableController dragController,
      ArtistProfileDto? artistProfile,
      IArtistRepository artistRepository,
      IUserRepository userRepository,
      bool isFollowing,
      bool isBlocked});

  $ArtistProfileDtoCopyWith<$Res>? get artistProfile;
}

/// @nodoc
class _$ArtistStateCopyWithImpl<$Res, $Val extends ArtistState>
    implements $ArtistStateCopyWith<$Res> {
  _$ArtistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? artistId = null,
    Object? isAtTop = null,
    Object? dragController = null,
    Object? artistProfile = freezed,
    Object? artistRepository = null,
    Object? userRepository = null,
    Object? isFollowing = null,
    Object? isBlocked = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int,
      isAtTop: null == isAtTop
          ? _value.isAtTop
          : isAtTop // ignore: cast_nullable_to_non_nullable
              as bool,
      dragController: null == dragController
          ? _value.dragController
          : dragController // ignore: cast_nullable_to_non_nullable
              as DraggableScrollableController,
      artistProfile: freezed == artistProfile
          ? _value.artistProfile
          : artistProfile // ignore: cast_nullable_to_non_nullable
              as ArtistProfileDto?,
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as IArtistRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as IUserRepository,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtistProfileDtoCopyWith<$Res>? get artistProfile {
    if (_value.artistProfile == null) {
      return null;
    }

    return $ArtistProfileDtoCopyWith<$Res>(_value.artistProfile!, (value) {
      return _then(_value.copyWith(artistProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtistStateImplCopyWith<$Res>
    implements $ArtistStateCopyWith<$Res> {
  factory _$$ArtistStateImplCopyWith(
          _$ArtistStateImpl value, $Res Function(_$ArtistStateImpl) then) =
      __$$ArtistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      int artistId,
      bool isAtTop,
      DraggableScrollableController dragController,
      ArtistProfileDto? artistProfile,
      IArtistRepository artistRepository,
      IUserRepository userRepository,
      bool isFollowing,
      bool isBlocked});

  @override
  $ArtistProfileDtoCopyWith<$Res>? get artistProfile;
}

/// @nodoc
class __$$ArtistStateImplCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res, _$ArtistStateImpl>
    implements _$$ArtistStateImplCopyWith<$Res> {
  __$$ArtistStateImplCopyWithImpl(
      _$ArtistStateImpl _value, $Res Function(_$ArtistStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? artistId = null,
    Object? isAtTop = null,
    Object? dragController = null,
    Object? artistProfile = freezed,
    Object? artistRepository = null,
    Object? userRepository = null,
    Object? isFollowing = null,
    Object? isBlocked = null,
  }) {
    return _then(_$ArtistStateImpl(
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int,
      isAtTop: null == isAtTop
          ? _value.isAtTop
          : isAtTop // ignore: cast_nullable_to_non_nullable
              as bool,
      dragController: null == dragController
          ? _value.dragController
          : dragController // ignore: cast_nullable_to_non_nullable
              as DraggableScrollableController,
      artistProfile: freezed == artistProfile
          ? _value.artistProfile
          : artistProfile // ignore: cast_nullable_to_non_nullable
              as ArtistProfileDto?,
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as IArtistRepository,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as IUserRepository,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ArtistStateImpl implements _ArtistState {
  const _$ArtistStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      required this.artistId,
      required this.isAtTop,
      required this.dragController,
      this.artistProfile,
      required this.artistRepository,
      required this.userRepository,
      required this.isFollowing,
      required this.isBlocked});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  @override
  final int artistId;
  @override
  final bool isAtTop;
  @override
  final DraggableScrollableController dragController;
  @override
  final ArtistProfileDto? artistProfile;
  @override
  final IArtistRepository artistRepository;
  @override
  final IUserRepository userRepository;
  @override
  final bool isFollowing;
  @override
  final bool isBlocked;

  @override
  String toString() {
    return 'ArtistState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, artistId: $artistId, isAtTop: $isAtTop, dragController: $dragController, artistProfile: $artistProfile, artistRepository: $artistRepository, userRepository: $userRepository, isFollowing: $isFollowing, isBlocked: $isBlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.isAtTop, isAtTop) || other.isAtTop == isAtTop) &&
            (identical(other.dragController, dragController) ||
                other.dragController == dragController) &&
            (identical(other.artistProfile, artistProfile) ||
                other.artistProfile == artistProfile) &&
            (identical(other.artistRepository, artistRepository) ||
                other.artistRepository == artistRepository) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccessful,
      isFailed,
      noUse,
      artistId,
      isAtTop,
      dragController,
      artistProfile,
      artistRepository,
      userRepository,
      isFollowing,
      isBlocked);

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistStateImplCopyWith<_$ArtistStateImpl> get copyWith =>
      __$$ArtistStateImplCopyWithImpl<_$ArtistStateImpl>(this, _$identity);
}

abstract class _ArtistState implements ArtistState {
  const factory _ArtistState(
      {required final bool isLoading,
      required final bool isSuccessful,
      required final bool isFailed,
      required final bool noUse,
      required final int artistId,
      required final bool isAtTop,
      required final DraggableScrollableController dragController,
      final ArtistProfileDto? artistProfile,
      required final IArtistRepository artistRepository,
      required final IUserRepository userRepository,
      required final bool isFollowing,
      required final bool isBlocked}) = _$ArtistStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  int get artistId;
  @override
  bool get isAtTop;
  @override
  DraggableScrollableController get dragController;
  @override
  ArtistProfileDto? get artistProfile;
  @override
  IArtistRepository get artistRepository;
  @override
  IUserRepository get userRepository;
  @override
  bool get isFollowing;
  @override
  bool get isBlocked;

  /// Create a copy of ArtistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistStateImplCopyWith<_$ArtistStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
