// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtistProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  ArtistRepository get artistRepository => throw _privateConstructorUsedError;
  List<ArtistProfileDto> get artists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtistProfileStateCopyWith<ArtistProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistProfileStateCopyWith<$Res> {
  factory $ArtistProfileStateCopyWith(
          ArtistProfileState value, $Res Function(ArtistProfileState) then) =
      _$ArtistProfileStateCopyWithImpl<$Res, ArtistProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      ArtistRepository artistRepository,
      List<ArtistProfileDto> artists});
}

/// @nodoc
class _$ArtistProfileStateCopyWithImpl<$Res, $Val extends ArtistProfileState>
    implements $ArtistProfileStateCopyWith<$Res> {
  _$ArtistProfileStateCopyWithImpl(this._value, this._then);

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
    Object? artistRepository = null,
    Object? artists = null,
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
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as ArtistRepository,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistProfileDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistProfileStateImplCopyWith<$Res>
    implements $ArtistProfileStateCopyWith<$Res> {
  factory _$$ArtistProfileStateImplCopyWith(_$ArtistProfileStateImpl value,
          $Res Function(_$ArtistProfileStateImpl) then) =
      __$$ArtistProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      ArtistRepository artistRepository,
      List<ArtistProfileDto> artists});
}

/// @nodoc
class __$$ArtistProfileStateImplCopyWithImpl<$Res>
    extends _$ArtistProfileStateCopyWithImpl<$Res, _$ArtistProfileStateImpl>
    implements _$$ArtistProfileStateImplCopyWith<$Res> {
  __$$ArtistProfileStateImplCopyWithImpl(_$ArtistProfileStateImpl _value,
      $Res Function(_$ArtistProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? artistRepository = null,
    Object? artists = null,
  }) {
    return _then(_$ArtistProfileStateImpl(
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
      artistRepository: null == artistRepository
          ? _value.artistRepository
          : artistRepository // ignore: cast_nullable_to_non_nullable
              as ArtistRepository,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistProfileDto>,
    ));
  }
}

/// @nodoc

class _$ArtistProfileStateImpl implements _ArtistProfileState {
  const _$ArtistProfileStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.artistRepository,
      required final List<ArtistProfileDto> artists})
      : _artists = artists;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final ArtistRepository artistRepository;
  final List<ArtistProfileDto> _artists;
  @override
  List<ArtistProfileDto> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  String toString() {
    return 'ArtistProfileState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, artistRepository: $artistRepository, artists: $artists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.artistRepository, artistRepository) ||
                other.artistRepository == artistRepository) &&
            const DeepCollectionEquality().equals(other._artists, _artists));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isFailure,
      noUse, artistRepository, const DeepCollectionEquality().hash(_artists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistProfileStateImplCopyWith<_$ArtistProfileStateImpl> get copyWith =>
      __$$ArtistProfileStateImplCopyWithImpl<_$ArtistProfileStateImpl>(
          this, _$identity);
}

abstract class _ArtistProfileState implements ArtistProfileState {
  const factory _ArtistProfileState(
          {required final bool isLoading,
          required final bool isSuccess,
          required final bool isFailure,
          required final bool noUse,
          required final ArtistRepository artistRepository,
          required final List<ArtistProfileDto> artists}) =
      _$ArtistProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  ArtistRepository get artistRepository;
  @override
  List<ArtistProfileDto> get artists;
  @override
  @JsonKey(ignore: true)
  _$$ArtistProfileStateImplCopyWith<_$ArtistProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
