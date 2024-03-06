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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  CoreRepository get coreRepository => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      bool noUse,
      String? profileImage,
      CoreRepository coreRepository});
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res, $Val extends UserProfileState>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? profileImage = freezed,
    Object? coreRepository = null,
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
    ) as $Val);
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
      bool noUse,
      String? profileImage,
      CoreRepository coreRepository});
}

/// @nodoc
class __$$UserProfileStateImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$UserProfileStateImpl>
    implements _$$UserProfileStateImplCopyWith<$Res> {
  __$$UserProfileStateImplCopyWithImpl(_$UserProfileStateImpl _value,
      $Res Function(_$UserProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? profileImage = freezed,
    Object? coreRepository = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
    ));
  }
}

/// @nodoc

class _$UserProfileStateImpl implements _UserProfileState {
  const _$UserProfileStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      this.profileImage,
      required this.coreRepository});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  @override
  final String? profileImage;
  @override
  final CoreRepository coreRepository;

  @override
  String toString() {
    return 'UserProfileState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, profileImage: $profileImage, coreRepository: $coreRepository)';
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
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coreRepository, coreRepository) ||
                other.coreRepository == coreRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccessful,
      isFailed, noUse, profileImage, coreRepository);

  @JsonKey(ignore: true)
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
      required final bool noUse,
      final String? profileImage,
      required final CoreRepository coreRepository}) = _$UserProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  String? get profileImage;
  @override
  CoreRepository get coreRepository;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileStateImplCopyWith<_$UserProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
