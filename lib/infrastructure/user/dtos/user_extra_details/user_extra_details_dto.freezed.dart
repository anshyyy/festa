// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_extra_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserExtraDetailsDto _$UserExtraDetailsDtoFromJson(Map<String, dynamic> json) {
  return _UserExtraDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$UserExtraDetailsDto {
  @JsonKey(name: 'followedBy')
  CommunityDto get followedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBlocked', defaultValue: false)
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFollowing', defaultValue: false)
  bool get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: 'isHidden', defaultValue: false)
  bool get isHidden => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalFollowers', defaultValue: 0)
  int get totalFollowers => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalFriends', defaultValue: 0)
  int get totalFriends => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalParties', defaultValue: 0)
  int get totalParties => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalFootFall', defaultValue: 0)
  int get totalFootFall => throw _privateConstructorUsedError;

  /// Serializes this UserExtraDetailsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExtraDetailsDtoCopyWith<UserExtraDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExtraDetailsDtoCopyWith<$Res> {
  factory $UserExtraDetailsDtoCopyWith(
          UserExtraDetailsDto value, $Res Function(UserExtraDetailsDto) then) =
      _$UserExtraDetailsDtoCopyWithImpl<$Res, UserExtraDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'followedBy') CommunityDto followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) bool isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) bool isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0) int totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0) int totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0) int totalParties,
      @JsonKey(name: 'totalFootFall', defaultValue: 0) int totalFootFall});

  $CommunityDtoCopyWith<$Res> get followedBy;
}

/// @nodoc
class _$UserExtraDetailsDtoCopyWithImpl<$Res, $Val extends UserExtraDetailsDto>
    implements $UserExtraDetailsDtoCopyWith<$Res> {
  _$UserExtraDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedBy = null,
    Object? isBlocked = null,
    Object? isFollowing = null,
    Object? isHidden = null,
    Object? totalFollowers = null,
    Object? totalFriends = null,
    Object? totalParties = null,
    Object? totalFootFall = null,
  }) {
    return _then(_value.copyWith(
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      totalFollowers: null == totalFollowers
          ? _value.totalFollowers
          : totalFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriends: null == totalFriends
          ? _value.totalFriends
          : totalFriends // ignore: cast_nullable_to_non_nullable
              as int,
      totalParties: null == totalParties
          ? _value.totalParties
          : totalParties // ignore: cast_nullable_to_non_nullable
              as int,
      totalFootFall: null == totalFootFall
          ? _value.totalFootFall
          : totalFootFall // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityDtoCopyWith<$Res> get followedBy {
    return $CommunityDtoCopyWith<$Res>(_value.followedBy, (value) {
      return _then(_value.copyWith(followedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserExtraDetailsDtoImplCopyWith<$Res>
    implements $UserExtraDetailsDtoCopyWith<$Res> {
  factory _$$UserExtraDetailsDtoImplCopyWith(_$UserExtraDetailsDtoImpl value,
          $Res Function(_$UserExtraDetailsDtoImpl) then) =
      __$$UserExtraDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'followedBy') CommunityDto followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) bool isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) bool isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0) int totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0) int totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0) int totalParties,
      @JsonKey(name: 'totalFootFall', defaultValue: 0) int totalFootFall});

  @override
  $CommunityDtoCopyWith<$Res> get followedBy;
}

/// @nodoc
class __$$UserExtraDetailsDtoImplCopyWithImpl<$Res>
    extends _$UserExtraDetailsDtoCopyWithImpl<$Res, _$UserExtraDetailsDtoImpl>
    implements _$$UserExtraDetailsDtoImplCopyWith<$Res> {
  __$$UserExtraDetailsDtoImplCopyWithImpl(_$UserExtraDetailsDtoImpl _value,
      $Res Function(_$UserExtraDetailsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedBy = null,
    Object? isBlocked = null,
    Object? isFollowing = null,
    Object? isHidden = null,
    Object? totalFollowers = null,
    Object? totalFriends = null,
    Object? totalParties = null,
    Object? totalFootFall = null,
  }) {
    return _then(_$UserExtraDetailsDtoImpl(
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as CommunityDto,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      totalFollowers: null == totalFollowers
          ? _value.totalFollowers
          : totalFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriends: null == totalFriends
          ? _value.totalFriends
          : totalFriends // ignore: cast_nullable_to_non_nullable
              as int,
      totalParties: null == totalParties
          ? _value.totalParties
          : totalParties // ignore: cast_nullable_to_non_nullable
              as int,
      totalFootFall: null == totalFootFall
          ? _value.totalFootFall
          : totalFootFall // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserExtraDetailsDtoImpl implements _UserExtraDetailsDto {
  const _$UserExtraDetailsDtoImpl(
      {@JsonKey(name: 'followedBy') required this.followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) required this.isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false)
      required this.isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) required this.isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0)
      required this.totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0)
      required this.totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0)
      required this.totalParties,
      @JsonKey(name: 'totalFootFall', defaultValue: 0)
      required this.totalFootFall});

  factory _$UserExtraDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExtraDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'followedBy')
  final CommunityDto followedBy;
  @override
  @JsonKey(name: 'isBlocked', defaultValue: false)
  final bool isBlocked;
  @override
  @JsonKey(name: 'isFollowing', defaultValue: false)
  final bool isFollowing;
  @override
  @JsonKey(name: 'isHidden', defaultValue: false)
  final bool isHidden;
  @override
  @JsonKey(name: 'totalFollowers', defaultValue: 0)
  final int totalFollowers;
  @override
  @JsonKey(name: 'totalFriends', defaultValue: 0)
  final int totalFriends;
  @override
  @JsonKey(name: 'totalParties', defaultValue: 0)
  final int totalParties;
  @override
  @JsonKey(name: 'totalFootFall', defaultValue: 0)
  final int totalFootFall;

  @override
  String toString() {
    return 'UserExtraDetailsDto(followedBy: $followedBy, isBlocked: $isBlocked, isFollowing: $isFollowing, isHidden: $isHidden, totalFollowers: $totalFollowers, totalFriends: $totalFriends, totalParties: $totalParties, totalFootFall: $totalFootFall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExtraDetailsDtoImpl &&
            (identical(other.followedBy, followedBy) ||
                other.followedBy == followedBy) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.totalFollowers, totalFollowers) ||
                other.totalFollowers == totalFollowers) &&
            (identical(other.totalFriends, totalFriends) ||
                other.totalFriends == totalFriends) &&
            (identical(other.totalParties, totalParties) ||
                other.totalParties == totalParties) &&
            (identical(other.totalFootFall, totalFootFall) ||
                other.totalFootFall == totalFootFall));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      followedBy,
      isBlocked,
      isFollowing,
      isHidden,
      totalFollowers,
      totalFriends,
      totalParties,
      totalFootFall);

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExtraDetailsDtoImplCopyWith<_$UserExtraDetailsDtoImpl> get copyWith =>
      __$$UserExtraDetailsDtoImplCopyWithImpl<_$UserExtraDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExtraDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserExtraDetailsDto implements UserExtraDetailsDto {
  const factory _UserExtraDetailsDto(
      {@JsonKey(name: 'followedBy') required final CommunityDto followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false)
      required final bool isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false)
      required final bool isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false)
      required final bool isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0)
      required final int totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0)
      required final int totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0)
      required final int totalParties,
      @JsonKey(name: 'totalFootFall', defaultValue: 0)
      required final int totalFootFall}) = _$UserExtraDetailsDtoImpl;

  factory _UserExtraDetailsDto.fromJson(Map<String, dynamic> json) =
      _$UserExtraDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'followedBy')
  CommunityDto get followedBy;
  @override
  @JsonKey(name: 'isBlocked', defaultValue: false)
  bool get isBlocked;
  @override
  @JsonKey(name: 'isFollowing', defaultValue: false)
  bool get isFollowing;
  @override
  @JsonKey(name: 'isHidden', defaultValue: false)
  bool get isHidden;
  @override
  @JsonKey(name: 'totalFollowers', defaultValue: 0)
  int get totalFollowers;
  @override
  @JsonKey(name: 'totalFriends', defaultValue: 0)
  int get totalFriends;
  @override
  @JsonKey(name: 'totalParties', defaultValue: 0)
  int get totalParties;
  @override
  @JsonKey(name: 'totalFootFall', defaultValue: 0)
  int get totalFootFall;

  /// Create a copy of UserExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExtraDetailsDtoImplCopyWith<_$UserExtraDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
