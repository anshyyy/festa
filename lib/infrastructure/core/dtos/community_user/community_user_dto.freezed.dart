// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityUserDto _$CommunityUserDtoFromJson(Map<String, dynamic> json) {
  return _CommunityUserDto.fromJson(json);
}

/// @nodoc
mixin _$CommunityUserDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage', defaultValue: '')
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFollowing', defaultValue: false)
  bool get isFollowing => throw _privateConstructorUsedError;

  /// Serializes this CommunityUserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityUserDtoCopyWith<CommunityUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityUserDtoCopyWith<$Res> {
  factory $CommunityUserDtoCopyWith(
          CommunityUserDto value, $Res Function(CommunityUserDto) then) =
      _$CommunityUserDtoCopyWithImpl<$Res, CommunityUserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '') String profileImage,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing});

  $TagDtoCopyWith<$Res>? get tag;
}

/// @nodoc
class _$CommunityUserDtoCopyWithImpl<$Res, $Val extends CommunityUserDto>
    implements $CommunityUserDtoCopyWith<$Res> {
  _$CommunityUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? profileImage = null,
    Object? tag = freezed,
    Object? isFollowing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagDtoCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $TagDtoCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommunityUserDtoImplCopyWith<$Res>
    implements $CommunityUserDtoCopyWith<$Res> {
  factory _$$CommunityUserDtoImplCopyWith(_$CommunityUserDtoImpl value,
          $Res Function(_$CommunityUserDtoImpl) then) =
      __$$CommunityUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '') String profileImage,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'isFollowing', defaultValue: false) bool isFollowing});

  @override
  $TagDtoCopyWith<$Res>? get tag;
}

/// @nodoc
class __$$CommunityUserDtoImplCopyWithImpl<$Res>
    extends _$CommunityUserDtoCopyWithImpl<$Res, _$CommunityUserDtoImpl>
    implements _$$CommunityUserDtoImplCopyWith<$Res> {
  __$$CommunityUserDtoImplCopyWithImpl(_$CommunityUserDtoImpl _value,
      $Res Function(_$CommunityUserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? profileImage = null,
    Object? tag = freezed,
    Object? isFollowing = null,
  }) {
    return _then(_$CommunityUserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityUserDtoImpl implements _CommunityUserDto {
  const _$CommunityUserDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'fullName', defaultValue: '') required this.fullName,
      @JsonKey(name: 'profileImage', defaultValue: '')
      required this.profileImage,
      @JsonKey(name: 'tag', defaultValue: null) this.tag,
      @JsonKey(name: 'isFollowing', defaultValue: false)
      required this.isFollowing});

  factory _$CommunityUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityUserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  final String fullName;
  @override
  @JsonKey(name: 'profileImage', defaultValue: '')
  final String profileImage;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  final TagDto? tag;
  @override
  @JsonKey(name: 'isFollowing', defaultValue: false)
  final bool isFollowing;

  @override
  String toString() {
    return 'CommunityUserDto(id: $id, fullName: $fullName, profileImage: $profileImage, tag: $tag, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityUserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, profileImage, tag, isFollowing);

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityUserDtoImplCopyWith<_$CommunityUserDtoImpl> get copyWith =>
      __$$CommunityUserDtoImplCopyWithImpl<_$CommunityUserDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityUserDtoImplToJson(
      this,
    );
  }
}

abstract class _CommunityUserDto implements CommunityUserDto {
  const factory _CommunityUserDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'fullName', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '')
      required final String profileImage,
      @JsonKey(name: 'tag', defaultValue: null) final TagDto? tag,
      @JsonKey(name: 'isFollowing', defaultValue: false)
      required final bool isFollowing}) = _$CommunityUserDtoImpl;

  factory _CommunityUserDto.fromJson(Map<String, dynamic> json) =
      _$CommunityUserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName;
  @override
  @JsonKey(name: 'profileImage', defaultValue: '')
  String get profileImage;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag;
  @override
  @JsonKey(name: 'isFollowing', defaultValue: false)
  bool get isFollowing;

  /// Create a copy of CommunityUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityUserDtoImplCopyWith<_$CommunityUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
