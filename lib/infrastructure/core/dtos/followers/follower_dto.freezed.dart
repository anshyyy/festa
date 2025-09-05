// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowerDto _$FollowerDtoFromJson(Map<String, dynamic> json) {
  return _FollowerDto.fromJson(json);
}

/// @nodoc
mixin _$FollowerDto {
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers', defaultValue: [])
  List<CommunityUserDto> get users => throw _privateConstructorUsedError;

  /// Serializes this FollowerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowerDtoCopyWith<FollowerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerDtoCopyWith<$Res> {
  factory $FollowerDtoCopyWith(
          FollowerDto value, $Res Function(FollowerDto) then) =
      _$FollowerDtoCopyWithImpl<$Res, FollowerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'followers', defaultValue: [])
      List<CommunityUserDto> users});
}

/// @nodoc
class _$FollowerDtoCopyWithImpl<$Res, $Val extends FollowerDto>
    implements $FollowerDtoCopyWith<$Res> {
  _$FollowerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowerDto
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
abstract class _$$FollowerDtoImplCopyWith<$Res>
    implements $FollowerDtoCopyWith<$Res> {
  factory _$$FollowerDtoImplCopyWith(
          _$FollowerDtoImpl value, $Res Function(_$FollowerDtoImpl) then) =
      __$$FollowerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'followers', defaultValue: [])
      List<CommunityUserDto> users});
}

/// @nodoc
class __$$FollowerDtoImplCopyWithImpl<$Res>
    extends _$FollowerDtoCopyWithImpl<$Res, _$FollowerDtoImpl>
    implements _$$FollowerDtoImplCopyWith<$Res> {
  __$$FollowerDtoImplCopyWithImpl(
      _$FollowerDtoImpl _value, $Res Function(_$FollowerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? users = null,
  }) {
    return _then(_$FollowerDtoImpl(
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
class _$FollowerDtoImpl implements _FollowerDto {
  const _$FollowerDtoImpl(
      {@JsonKey(name: 'totalCount', defaultValue: 0) required this.totalCount,
      @JsonKey(name: 'followers', defaultValue: []) required this.users});

  factory _$FollowerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerDtoImplFromJson(json);

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;
  @override
  @JsonKey(name: 'followers', defaultValue: [])
  final List<CommunityUserDto> users;

  @override
  String toString() {
    return 'FollowerDto(totalCount: $totalCount, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerDtoImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(users));

  /// Create a copy of FollowerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowerDtoImplCopyWith<_$FollowerDtoImpl> get copyWith =>
      __$$FollowerDtoImplCopyWithImpl<_$FollowerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowerDtoImplToJson(
      this,
    );
  }
}

abstract class _FollowerDto implements FollowerDto {
  const factory _FollowerDto(
      {@JsonKey(name: 'totalCount', defaultValue: 0)
      required final int totalCount,
      @JsonKey(name: 'followers', defaultValue: [])
      required final List<CommunityUserDto> users}) = _$FollowerDtoImpl;

  factory _FollowerDto.fromJson(Map<String, dynamic> json) =
      _$FollowerDtoImpl.fromJson;

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount;
  @override
  @JsonKey(name: 'followers', defaultValue: [])
  List<CommunityUserDto> get users;

  /// Create a copy of FollowerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowerDtoImplCopyWith<_$FollowerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
