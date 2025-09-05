// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_viewer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaViewerState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  int get pubId => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  PubDto? get pub => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  PubRepository get pubRepository => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  VideoPlayerController? get videoPlayerController =>
      throw _privateConstructorUsedError;
  bool get isVideoInitialized => throw _privateConstructorUsedError;

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaViewerStateCopyWith<MediaViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaViewerStateCopyWith<$Res> {
  factory $MediaViewerStateCopyWith(
          MediaViewerState value, $Res Function(MediaViewerState) then) =
      _$MediaViewerStateCopyWithImpl<$Res, MediaViewerState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      int pubId,
      bool isFollowing,
      bool isExpanded,
      PubDto? pub,
      String mediaUrl,
      String mediaType,
      PubRepository pubRepository,
      bool isPlaying,
      VideoPlayerController? videoPlayerController,
      bool isVideoInitialized});

  $PubDtoCopyWith<$Res>? get pub;
}

/// @nodoc
class _$MediaViewerStateCopyWithImpl<$Res, $Val extends MediaViewerState>
    implements $MediaViewerStateCopyWith<$Res> {
  _$MediaViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? pubId = null,
    Object? isFollowing = null,
    Object? isExpanded = null,
    Object? pub = freezed,
    Object? mediaUrl = null,
    Object? mediaType = null,
    Object? pubRepository = null,
    Object? isPlaying = null,
    Object? videoPlayerController = freezed,
    Object? isVideoInitialized = null,
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
      pubId: null == pubId
          ? _value.pubId
          : pubId // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      pub: freezed == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as PubDto?,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      pubRepository: null == pubRepository
          ? _value.pubRepository
          : pubRepository // ignore: cast_nullable_to_non_nullable
              as PubRepository,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPlayerController: freezed == videoPlayerController
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      isVideoInitialized: null == isVideoInitialized
          ? _value.isVideoInitialized
          : isVideoInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PubDtoCopyWith<$Res>? get pub {
    if (_value.pub == null) {
      return null;
    }

    return $PubDtoCopyWith<$Res>(_value.pub!, (value) {
      return _then(_value.copyWith(pub: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaViewerStateImplCopyWith<$Res>
    implements $MediaViewerStateCopyWith<$Res> {
  factory _$$MediaViewerStateImplCopyWith(_$MediaViewerStateImpl value,
          $Res Function(_$MediaViewerStateImpl) then) =
      __$$MediaViewerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      int pubId,
      bool isFollowing,
      bool isExpanded,
      PubDto? pub,
      String mediaUrl,
      String mediaType,
      PubRepository pubRepository,
      bool isPlaying,
      VideoPlayerController? videoPlayerController,
      bool isVideoInitialized});

  @override
  $PubDtoCopyWith<$Res>? get pub;
}

/// @nodoc
class __$$MediaViewerStateImplCopyWithImpl<$Res>
    extends _$MediaViewerStateCopyWithImpl<$Res, _$MediaViewerStateImpl>
    implements _$$MediaViewerStateImplCopyWith<$Res> {
  __$$MediaViewerStateImplCopyWithImpl(_$MediaViewerStateImpl _value,
      $Res Function(_$MediaViewerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? pubId = null,
    Object? isFollowing = null,
    Object? isExpanded = null,
    Object? pub = freezed,
    Object? mediaUrl = null,
    Object? mediaType = null,
    Object? pubRepository = null,
    Object? isPlaying = null,
    Object? videoPlayerController = freezed,
    Object? isVideoInitialized = null,
  }) {
    return _then(_$MediaViewerStateImpl(
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
      pubId: null == pubId
          ? _value.pubId
          : pubId // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      pub: freezed == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as PubDto?,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      pubRepository: null == pubRepository
          ? _value.pubRepository
          : pubRepository // ignore: cast_nullable_to_non_nullable
              as PubRepository,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPlayerController: freezed == videoPlayerController
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      isVideoInitialized: null == isVideoInitialized
          ? _value.isVideoInitialized
          : isVideoInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MediaViewerStateImpl implements _MediaViewerState {
  const _$MediaViewerStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      required this.pubId,
      required this.isFollowing,
      required this.isExpanded,
      this.pub,
      required this.mediaUrl,
      required this.mediaType,
      required this.pubRepository,
      required this.isPlaying,
      this.videoPlayerController,
      this.isVideoInitialized = false});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  @override
  final int pubId;
  @override
  final bool isFollowing;
  @override
  final bool isExpanded;
  @override
  final PubDto? pub;
  @override
  final String mediaUrl;
  @override
  final String mediaType;
  @override
  final PubRepository pubRepository;
  @override
  final bool isPlaying;
  @override
  final VideoPlayerController? videoPlayerController;
  @override
  @JsonKey()
  final bool isVideoInitialized;

  @override
  String toString() {
    return 'MediaViewerState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, pubId: $pubId, isFollowing: $isFollowing, isExpanded: $isExpanded, pub: $pub, mediaUrl: $mediaUrl, mediaType: $mediaType, pubRepository: $pubRepository, isPlaying: $isPlaying, videoPlayerController: $videoPlayerController, isVideoInitialized: $isVideoInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaViewerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.pubId, pubId) || other.pubId == pubId) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.pub, pub) || other.pub == pub) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.pubRepository, pubRepository) ||
                other.pubRepository == pubRepository) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.videoPlayerController, videoPlayerController) ||
                other.videoPlayerController == videoPlayerController) &&
            (identical(other.isVideoInitialized, isVideoInitialized) ||
                other.isVideoInitialized == isVideoInitialized));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccessful,
      isFailed,
      noUse,
      pubId,
      isFollowing,
      isExpanded,
      pub,
      mediaUrl,
      mediaType,
      pubRepository,
      isPlaying,
      videoPlayerController,
      isVideoInitialized);

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaViewerStateImplCopyWith<_$MediaViewerStateImpl> get copyWith =>
      __$$MediaViewerStateImplCopyWithImpl<_$MediaViewerStateImpl>(
          this, _$identity);
}

abstract class _MediaViewerState implements MediaViewerState {
  const factory _MediaViewerState(
      {required final bool isLoading,
      required final bool isSuccessful,
      required final bool isFailed,
      required final bool noUse,
      required final int pubId,
      required final bool isFollowing,
      required final bool isExpanded,
      final PubDto? pub,
      required final String mediaUrl,
      required final String mediaType,
      required final PubRepository pubRepository,
      required final bool isPlaying,
      final VideoPlayerController? videoPlayerController,
      final bool isVideoInitialized}) = _$MediaViewerStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  int get pubId;
  @override
  bool get isFollowing;
  @override
  bool get isExpanded;
  @override
  PubDto? get pub;
  @override
  String get mediaUrl;
  @override
  String get mediaType;
  @override
  PubRepository get pubRepository;
  @override
  bool get isPlaying;
  @override
  VideoPlayerController? get videoPlayerController;
  @override
  bool get isVideoInitialized;

  /// Create a copy of MediaViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaViewerStateImplCopyWith<_$MediaViewerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
