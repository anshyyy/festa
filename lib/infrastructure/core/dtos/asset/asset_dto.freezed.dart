// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssetDto _$AssetDtoFromJson(Map<String, dynamic> json) {
  return _AssetDto.fromJson(json);
}

/// @nodoc
mixin _$AssetDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', defaultValue: '')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail', defaultValue: '')
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetDtoCopyWith<AssetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDtoCopyWith<$Res> {
  factory $AssetDtoCopyWith(AssetDto value, $Res Function(AssetDto) then) =
      _$AssetDtoCopyWithImpl<$Res, AssetDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'url', defaultValue: '') String url,
      @JsonKey(name: 'thumbnail', defaultValue: '') String thumbnail});
}

/// @nodoc
class _$AssetDtoCopyWithImpl<$Res, $Val extends AssetDto>
    implements $AssetDtoCopyWith<$Res> {
  _$AssetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? url = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetDtoImplCopyWith<$Res>
    implements $AssetDtoCopyWith<$Res> {
  factory _$$AssetDtoImplCopyWith(
          _$AssetDtoImpl value, $Res Function(_$AssetDtoImpl) then) =
      __$$AssetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'url', defaultValue: '') String url,
      @JsonKey(name: 'thumbnail', defaultValue: '') String thumbnail});
}

/// @nodoc
class __$$AssetDtoImplCopyWithImpl<$Res>
    extends _$AssetDtoCopyWithImpl<$Res, _$AssetDtoImpl>
    implements _$$AssetDtoImplCopyWith<$Res> {
  __$$AssetDtoImplCopyWithImpl(
      _$AssetDtoImpl _value, $Res Function(_$AssetDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? url = null,
    Object? thumbnail = null,
  }) {
    return _then(_$AssetDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDtoImpl implements _AssetDto {
  const _$AssetDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'url', defaultValue: '') required this.url,
      @JsonKey(name: 'thumbnail', defaultValue: '') required this.thumbnail});

  factory _$AssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String url;
  @override
  @JsonKey(name: 'thumbnail', defaultValue: '')
  final String thumbnail;

  @override
  String toString() {
    return 'AssetDto(type: $type, url: $url, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, url, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      __$$AssetDtoImplCopyWithImpl<_$AssetDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDtoImplToJson(
      this,
    );
  }
}

abstract class _AssetDto implements AssetDto {
  const factory _AssetDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'url', defaultValue: '') required final String url,
      @JsonKey(name: 'thumbnail', defaultValue: '')
      required final String thumbnail}) = _$AssetDtoImpl;

  factory _AssetDto.fromJson(Map<String, dynamic> json) =
      _$AssetDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get url;
  @override
  @JsonKey(name: 'thumbnail', defaultValue: '')
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
