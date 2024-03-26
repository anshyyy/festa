// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicDto _$MusicDtoFromJson(Map<String, dynamic> json) {
  return _MusicDto.fromJson(json);
}

/// @nodoc
mixin _$MusicDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'audioUrl', defaultValue: '')
  String get audioUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLiked', defaultValue: false)
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'length', defaultValue: 0)
  int get length => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicDtoCopyWith<MusicDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicDtoCopyWith<$Res> {
  factory $MusicDtoCopyWith(MusicDto value, $Res Function(MusicDto) then) =
      _$MusicDtoCopyWithImpl<$Res, MusicDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'audioUrl', defaultValue: '') String audioUrl,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'isLiked', defaultValue: false) bool isLiked,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'length', defaultValue: 0) int length});
}

/// @nodoc
class _$MusicDtoCopyWithImpl<$Res, $Val extends MusicDto>
    implements $MusicDtoCopyWith<$Res> {
  _$MusicDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? imageUrl = null,
    Object? isLiked = null,
    Object? name = null,
    Object? length = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicDtoImplCopyWith<$Res>
    implements $MusicDtoCopyWith<$Res> {
  factory _$$MusicDtoImplCopyWith(
          _$MusicDtoImpl value, $Res Function(_$MusicDtoImpl) then) =
      __$$MusicDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'audioUrl', defaultValue: '') String audioUrl,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'isLiked', defaultValue: false) bool isLiked,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'length', defaultValue: 0) int length});
}

/// @nodoc
class __$$MusicDtoImplCopyWithImpl<$Res>
    extends _$MusicDtoCopyWithImpl<$Res, _$MusicDtoImpl>
    implements _$$MusicDtoImplCopyWith<$Res> {
  __$$MusicDtoImplCopyWithImpl(
      _$MusicDtoImpl _value, $Res Function(_$MusicDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audioUrl = null,
    Object? imageUrl = null,
    Object? isLiked = null,
    Object? name = null,
    Object? length = null,
  }) {
    return _then(_$MusicDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicDtoImpl implements _MusicDto {
  const _$MusicDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'audioUrl', defaultValue: '') required this.audioUrl,
      @JsonKey(name: 'imageUrl', defaultValue: '') required this.imageUrl,
      @JsonKey(name: 'isLiked', defaultValue: false) required this.isLiked,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'length', defaultValue: 0) required this.length});

  factory _$MusicDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'audioUrl', defaultValue: '')
  final String audioUrl;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(name: 'isLiked', defaultValue: false)
  final bool isLiked;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'length', defaultValue: 0)
  final int length;

  @override
  String toString() {
    return 'MusicDto(id: $id, audioUrl: $audioUrl, imageUrl: $imageUrl, isLiked: $isLiked, name: $name, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.length, length) || other.length == length));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, audioUrl, imageUrl, isLiked, name, length);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicDtoImplCopyWith<_$MusicDtoImpl> get copyWith =>
      __$$MusicDtoImplCopyWithImpl<_$MusicDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicDtoImplToJson(
      this,
    );
  }
}

abstract class _MusicDto implements MusicDto {
  const factory _MusicDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'audioUrl', defaultValue: '')
      required final String audioUrl,
      @JsonKey(name: 'imageUrl', defaultValue: '')
      required final String imageUrl,
      @JsonKey(name: 'isLiked', defaultValue: false)
      required final bool isLiked,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'length', defaultValue: 0)
      required final int length}) = _$MusicDtoImpl;

  factory _MusicDto.fromJson(Map<String, dynamic> json) =
      _$MusicDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'audioUrl', defaultValue: '')
  String get audioUrl;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(name: 'isLiked', defaultValue: false)
  bool get isLiked;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'length', defaultValue: 0)
  int get length;
  @override
  @JsonKey(ignore: true)
  _$$MusicDtoImplCopyWith<_$MusicDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
