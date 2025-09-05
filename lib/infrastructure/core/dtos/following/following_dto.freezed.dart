// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingDto _$FollowingDtoFromJson(Map<String, dynamic> json) {
  return _FollowingDto.fromJson(json);
}

/// @nodoc
mixin _$FollowingDto {
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following', defaultValue: [])
  List<CommunityUserDto> get users => throw _privateConstructorUsedError;

  /// Serializes this FollowingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingDtoCopyWith<FollowingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingDtoCopyWith<$Res> {
  factory $FollowingDtoCopyWith(
          FollowingDto value, $Res Function(FollowingDto) then) =
      _$FollowingDtoCopyWithImpl<$Res, FollowingDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'following', defaultValue: [])
      List<CommunityUserDto> users});
}

/// @nodoc
class _$FollowingDtoCopyWithImpl<$Res, $Val extends FollowingDto>
    implements $FollowingDtoCopyWith<$Res> {
  _$FollowingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CommunityUserDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingDtoImplCopyWith<$Res>
    implements $FollowingDtoCopyWith<$Res> {
  factory _$$FollowingDtoImplCopyWith(
          _$FollowingDtoImpl value, $Res Function(_$FollowingDtoImpl) then) =
      __$$FollowingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'following', defaultValue: [])
      List<CommunityUserDto> users});
}

/// @nodoc
class __$$FollowingDtoImplCopyWithImpl<$Res>
    extends _$FollowingDtoCopyWithImpl<$Res, _$FollowingDtoImpl>
    implements _$$FollowingDtoImplCopyWith<$Res> {
  __$$FollowingDtoImplCopyWithImpl(
      _$FollowingDtoImpl _value, $Res Function(_$FollowingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? users = null,
  }) {
    return _then(_$FollowingDtoImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CommunityUserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingDtoImpl implements _FollowingDto {
  const _$FollowingDtoImpl(
      {@JsonKey(name: 'totalCount', defaultValue: 0) required this.totalCount,
      @JsonKey(name: 'following', defaultValue: []) required this.users});

  factory _$FollowingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingDtoImplFromJson(json);

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;
  @override
  @JsonKey(name: 'following', defaultValue: [])
  final List<CommunityUserDto> users;

  @override
  String toString() {
    return 'FollowingDto(totalCount: $totalCount, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingDtoImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(users));

  /// Create a copy of FollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingDtoImplCopyWith<_$FollowingDtoImpl> get copyWith =>
      __$$FollowingDtoImplCopyWithImpl<_$FollowingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingDtoImplToJson(
      this,
    );
  }
}

abstract class _FollowingDto implements FollowingDto {
  const factory _FollowingDto(
      {@JsonKey(name: 'totalCount', defaultValue: 0)
      required final int totalCount,
      @JsonKey(name: 'following', defaultValue: [])
      required final List<CommunityUserDto> users}) = _$FollowingDtoImpl;

  factory _FollowingDto.fromJson(Map<String, dynamic> json) =
      _$FollowingDtoImpl.fromJson;

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount;
  @override
  @JsonKey(name: 'following', defaultValue: [])
  List<CommunityUserDto> get users;

  /// Create a copy of FollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingDtoImplCopyWith<_$FollowingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
