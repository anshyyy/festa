// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistTagDto _$ArtistTagDtoFromJson(Map<String, dynamic> json) {
  return _ArtistTagDto.fromJson(json);
}

/// @nodoc
mixin _$ArtistTagDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: '')
  String get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistTagDtoCopyWith<ArtistTagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistTagDtoCopyWith<$Res> {
  factory $ArtistTagDtoCopyWith(
          ArtistTagDto value, $Res Function(ArtistTagDto) then) =
      _$ArtistTagDtoCopyWithImpl<$Res, ArtistTagDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'tag', defaultValue: '') String tag});
}

/// @nodoc
class _$ArtistTagDtoCopyWithImpl<$Res, $Val extends ArtistTagDto>
    implements $ArtistTagDtoCopyWith<$Res> {
  _$ArtistTagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistTagDtoImplCopyWith<$Res>
    implements $ArtistTagDtoCopyWith<$Res> {
  factory _$$ArtistTagDtoImplCopyWith(
          _$ArtistTagDtoImpl value, $Res Function(_$ArtistTagDtoImpl) then) =
      __$$ArtistTagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'tag', defaultValue: '') String tag});
}

/// @nodoc
class __$$ArtistTagDtoImplCopyWithImpl<$Res>
    extends _$ArtistTagDtoCopyWithImpl<$Res, _$ArtistTagDtoImpl>
    implements _$$ArtistTagDtoImplCopyWith<$Res> {
  __$$ArtistTagDtoImplCopyWithImpl(
      _$ArtistTagDtoImpl _value, $Res Function(_$ArtistTagDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_$ArtistTagDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistTagDtoImpl implements _ArtistTagDto {
  const _$ArtistTagDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'tag', defaultValue: '') required this.tag});

  factory _$ArtistTagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistTagDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'tag', defaultValue: '')
  final String tag;

  @override
  String toString() {
    return 'ArtistTagDto(id: $id, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistTagDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistTagDtoImplCopyWith<_$ArtistTagDtoImpl> get copyWith =>
      __$$ArtistTagDtoImplCopyWithImpl<_$ArtistTagDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistTagDtoImplToJson(
      this,
    );
  }
}

abstract class _ArtistTagDto implements ArtistTagDto {
  const factory _ArtistTagDto(
          {@JsonKey(name: 'id', defaultValue: 0) required final int id,
          @JsonKey(name: 'tag', defaultValue: '') required final String tag}) =
      _$ArtistTagDtoImpl;

  factory _ArtistTagDto.fromJson(Map<String, dynamic> json) =
      _$ArtistTagDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'tag', defaultValue: '')
  String get tag;
  @override
  @JsonKey(ignore: true)
  _$$ArtistTagDtoImplCopyWith<_$ArtistTagDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
