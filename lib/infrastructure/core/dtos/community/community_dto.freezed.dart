// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityDto _$CommunityDtoFromJson(Map<String, dynamic> json) {
  return _CommunityDto.fromJson(json);
}

/// @nodoc
mixin _$CommunityDto {
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'users', defaultValue: [])
  List<CommunityUserDto> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityDtoCopyWith<CommunityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityDtoCopyWith<$Res> {
  factory $CommunityDtoCopyWith(
          CommunityDto value, $Res Function(CommunityDto) then) =
      _$CommunityDtoCopyWithImpl<$Res, CommunityDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'users', defaultValue: []) List<CommunityUserDto> users});
}

/// @nodoc
class _$CommunityDtoCopyWithImpl<$Res, $Val extends CommunityDto>
    implements $CommunityDtoCopyWith<$Res> {
  _$CommunityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$CommunityDtoImplCopyWith<$Res>
    implements $CommunityDtoCopyWith<$Res> {
  factory _$$CommunityDtoImplCopyWith(
          _$CommunityDtoImpl value, $Res Function(_$CommunityDtoImpl) then) =
      __$$CommunityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount', defaultValue: 0) int totalCount,
      @JsonKey(name: 'users', defaultValue: []) List<CommunityUserDto> users});
}

/// @nodoc
class __$$CommunityDtoImplCopyWithImpl<$Res>
    extends _$CommunityDtoCopyWithImpl<$Res, _$CommunityDtoImpl>
    implements _$$CommunityDtoImplCopyWith<$Res> {
  __$$CommunityDtoImplCopyWithImpl(
      _$CommunityDtoImpl _value, $Res Function(_$CommunityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? users = null,
  }) {
    return _then(_$CommunityDtoImpl(
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
class _$CommunityDtoImpl implements _CommunityDto {
  const _$CommunityDtoImpl(
      {@JsonKey(name: 'totalCount', defaultValue: 0) required this.totalCount,
      @JsonKey(name: 'users', defaultValue: []) required this.users});

  factory _$CommunityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityDtoImplFromJson(json);

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;
  @override
  @JsonKey(name: 'users', defaultValue: [])
  final List<CommunityUserDto> users;

  @override
  String toString() {
    return 'CommunityDto(totalCount: $totalCount, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityDtoImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityDtoImplCopyWith<_$CommunityDtoImpl> get copyWith =>
      __$$CommunityDtoImplCopyWithImpl<_$CommunityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityDtoImplToJson(
      this,
    );
  }
}

abstract class _CommunityDto implements CommunityDto {
  const factory _CommunityDto(
      {@JsonKey(name: 'totalCount', defaultValue: 0)
      required final int totalCount,
      @JsonKey(name: 'users', defaultValue: [])
      required final List<CommunityUserDto> users}) = _$CommunityDtoImpl;

  factory _CommunityDto.fromJson(Map<String, dynamic> json) =
      _$CommunityDtoImpl.fromJson;

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount;
  @override
  @JsonKey(name: 'users', defaultValue: [])
  List<CommunityUserDto> get users;
  @override
  @JsonKey(ignore: true)
  _$$CommunityDtoImplCopyWith<_$CommunityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
