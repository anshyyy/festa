// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) {
  return _ArtistDto.fromJson(json);
}

/// @nodoc
mixin _$ArtistDto {
  @JsonKey(name: 'artist_id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image', defaultValue: '')
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistDtoCopyWith<ArtistDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistDtoCopyWith<$Res> {
  factory $ArtistDtoCopyWith(ArtistDto value, $Res Function(ArtistDto) then) =
      _$ArtistDtoCopyWithImpl<$Res, ArtistDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'artist_id', defaultValue: 0) int id,
      @JsonKey(name: 'full_name', defaultValue: '') String fullName,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'profile_image', defaultValue: '') String profileImage});
}

/// @nodoc
class _$ArtistDtoCopyWithImpl<$Res, $Val extends ArtistDto>
    implements $ArtistDtoCopyWith<$Res> {
  _$ArtistDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? username = null,
    Object? description = null,
    Object? profileImage = null,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistDtoImplCopyWith<$Res>
    implements $ArtistDtoCopyWith<$Res> {
  factory _$$ArtistDtoImplCopyWith(
          _$ArtistDtoImpl value, $Res Function(_$ArtistDtoImpl) then) =
      __$$ArtistDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'artist_id', defaultValue: 0) int id,
      @JsonKey(name: 'full_name', defaultValue: '') String fullName,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'profile_image', defaultValue: '') String profileImage});
}

/// @nodoc
class __$$ArtistDtoImplCopyWithImpl<$Res>
    extends _$ArtistDtoCopyWithImpl<$Res, _$ArtistDtoImpl>
    implements _$$ArtistDtoImplCopyWith<$Res> {
  __$$ArtistDtoImplCopyWithImpl(
      _$ArtistDtoImpl _value, $Res Function(_$ArtistDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? username = null,
    Object? description = null,
    Object? profileImage = null,
  }) {
    return _then(_$ArtistDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistDtoImpl implements _ArtistDto {
  const _$ArtistDtoImpl(
      {@JsonKey(name: 'artist_id', defaultValue: 0) required this.id,
      @JsonKey(name: 'full_name', defaultValue: '') required this.fullName,
      @JsonKey(name: 'username', defaultValue: '') required this.username,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'profile_image', defaultValue: '')
      required this.profileImage});

  factory _$ArtistDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistDtoImplFromJson(json);

  @override
  @JsonKey(name: 'artist_id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'profile_image', defaultValue: '')
  final String profileImage;

  @override
  String toString() {
    return 'ArtistDto(id: $id, fullName: $fullName, username: $username, description: $description, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, username, description, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistDtoImplCopyWith<_$ArtistDtoImpl> get copyWith =>
      __$$ArtistDtoImplCopyWithImpl<_$ArtistDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistDtoImplToJson(
      this,
    );
  }
}

abstract class _ArtistDto implements ArtistDto {
  const factory _ArtistDto(
      {@JsonKey(name: 'artist_id', defaultValue: 0) required final int id,
      @JsonKey(name: 'full_name', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'username', defaultValue: '')
      required final String username,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'profile_image', defaultValue: '')
      required final String profileImage}) = _$ArtistDtoImpl;

  factory _ArtistDto.fromJson(Map<String, dynamic> json) =
      _$ArtistDtoImpl.fromJson;

  @override
  @JsonKey(name: 'artist_id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'full_name', defaultValue: '')
  String get fullName;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'profile_image', defaultValue: '')
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$ArtistDtoImplCopyWith<_$ArtistDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
