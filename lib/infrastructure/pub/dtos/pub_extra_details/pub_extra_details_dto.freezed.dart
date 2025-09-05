// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_extra_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PubExtraDetailsDto _$PubExtraDetailsDtoFromJson(Map<String, dynamic> json) {
  return _PubExtraDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PubExtraDetailsDto {
  @JsonKey(name: 'followedBy', defaultValue: [])
  List<String> get followedBy => throw _privateConstructorUsedError;
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

  /// Serializes this PubExtraDetailsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PubExtraDetailsDtoCopyWith<PubExtraDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubExtraDetailsDtoCopyWith<$Res> {
  factory $PubExtraDetailsDtoCopyWith(
          PubExtraDetailsDto value, $Res Function(PubExtraDetailsDto) then) =
      _$PubExtraDetailsDtoCopyWithImpl<$Res, PubExtraDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'followedBy', defaultValue: []) List<String> followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) bool isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) bool isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0) int totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0) int totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0) int totalParties});
}

/// @nodoc
class _$PubExtraDetailsDtoCopyWithImpl<$Res, $Val extends PubExtraDetailsDto>
    implements $PubExtraDetailsDtoCopyWith<$Res> {
  _$PubExtraDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PubExtraDetailsDto
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
  }) {
    return _then(_value.copyWith(
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubExtraDetailsDtoImplCopyWith<$Res>
    implements $PubExtraDetailsDtoCopyWith<$Res> {
  factory _$$PubExtraDetailsDtoImplCopyWith(_$PubExtraDetailsDtoImpl value,
          $Res Function(_$PubExtraDetailsDtoImpl) then) =
      __$$PubExtraDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'followedBy', defaultValue: []) List<String> followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) bool isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) bool isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0) int totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0) int totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0) int totalParties});
}

/// @nodoc
class __$$PubExtraDetailsDtoImplCopyWithImpl<$Res>
    extends _$PubExtraDetailsDtoCopyWithImpl<$Res, _$PubExtraDetailsDtoImpl>
    implements _$$PubExtraDetailsDtoImplCopyWith<$Res> {
  __$$PubExtraDetailsDtoImplCopyWithImpl(_$PubExtraDetailsDtoImpl _value,
      $Res Function(_$PubExtraDetailsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PubExtraDetailsDto
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
  }) {
    return _then(_$PubExtraDetailsDtoImpl(
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubExtraDetailsDtoImpl implements _PubExtraDetailsDto {
  const _$PubExtraDetailsDtoImpl(
      {@JsonKey(name: 'followedBy', defaultValue: []) required this.followedBy,
      @JsonKey(name: 'isBlocked', defaultValue: false) required this.isBlocked,
      @JsonKey(name: 'isFollowing', defaultValue: false)
      required this.isFollowing,
      @JsonKey(name: 'isHidden', defaultValue: false) required this.isHidden,
      @JsonKey(name: 'totalFollowers', defaultValue: 0)
      required this.totalFollowers,
      @JsonKey(name: 'totalFriends', defaultValue: 0)
      required this.totalFriends,
      @JsonKey(name: 'totalParties', defaultValue: 0)
      required this.totalParties});

  factory _$PubExtraDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubExtraDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'followedBy', defaultValue: [])
  final List<String> followedBy;
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
  String toString() {
    return 'PubExtraDetailsDto(followedBy: $followedBy, isBlocked: $isBlocked, isFollowing: $isFollowing, isHidden: $isHidden, totalFollowers: $totalFollowers, totalFriends: $totalFriends, totalParties: $totalParties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubExtraDetailsDtoImpl &&
            const DeepCollectionEquality()
                .equals(other.followedBy, followedBy) &&
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
                other.totalParties == totalParties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(followedBy),
      isBlocked,
      isFollowing,
      isHidden,
      totalFollowers,
      totalFriends,
      totalParties);

  /// Create a copy of PubExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PubExtraDetailsDtoImplCopyWith<_$PubExtraDetailsDtoImpl> get copyWith =>
      __$$PubExtraDetailsDtoImplCopyWithImpl<_$PubExtraDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubExtraDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _PubExtraDetailsDto implements PubExtraDetailsDto {
  const factory _PubExtraDetailsDto(
      {@JsonKey(name: 'followedBy', defaultValue: [])
      required final List<String> followedBy,
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
      required final int totalParties}) = _$PubExtraDetailsDtoImpl;

  factory _PubExtraDetailsDto.fromJson(Map<String, dynamic> json) =
      _$PubExtraDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'followedBy', defaultValue: [])
  List<String> get followedBy;
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

  /// Create a copy of PubExtraDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubExtraDetailsDtoImplCopyWith<_$PubExtraDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
