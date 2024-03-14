// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubTagDto _$PubTagDtoFromJson(Map<String, dynamic> json) {
  return _PubTagDto.fromJson(json);
}

/// @nodoc
mixin _$PubTagDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: '')
  String get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubTagDtoCopyWith<PubTagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubTagDtoCopyWith<$Res> {
  factory $PubTagDtoCopyWith(PubTagDto value, $Res Function(PubTagDto) then) =
      _$PubTagDtoCopyWithImpl<$Res, PubTagDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'tag', defaultValue: '') String tag});
}

/// @nodoc
class _$PubTagDtoCopyWithImpl<$Res, $Val extends PubTagDto>
    implements $PubTagDtoCopyWith<$Res> {
  _$PubTagDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$PubTagDtoImplCopyWith<$Res>
    implements $PubTagDtoCopyWith<$Res> {
  factory _$$PubTagDtoImplCopyWith(
          _$PubTagDtoImpl value, $Res Function(_$PubTagDtoImpl) then) =
      __$$PubTagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'tag', defaultValue: '') String tag});
}

/// @nodoc
class __$$PubTagDtoImplCopyWithImpl<$Res>
    extends _$PubTagDtoCopyWithImpl<$Res, _$PubTagDtoImpl>
    implements _$$PubTagDtoImplCopyWith<$Res> {
  __$$PubTagDtoImplCopyWithImpl(
      _$PubTagDtoImpl _value, $Res Function(_$PubTagDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_$PubTagDtoImpl(
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
class _$PubTagDtoImpl implements _PubTagDto {
  const _$PubTagDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'tag', defaultValue: '') required this.tag});

  factory _$PubTagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubTagDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'tag', defaultValue: '')
  final String tag;

  @override
  String toString() {
    return 'PubTagDto(id: $id, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubTagDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubTagDtoImplCopyWith<_$PubTagDtoImpl> get copyWith =>
      __$$PubTagDtoImplCopyWithImpl<_$PubTagDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubTagDtoImplToJson(
      this,
    );
  }
}

abstract class _PubTagDto implements PubTagDto {
  const factory _PubTagDto(
          {@JsonKey(name: 'id', defaultValue: 0) required final int id,
          @JsonKey(name: 'tag', defaultValue: '') required final String tag}) =
      _$PubTagDtoImpl;

  factory _PubTagDto.fromJson(Map<String, dynamic> json) =
      _$PubTagDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'tag', defaultValue: '')
  String get tag;
  @override
  @JsonKey(ignore: true)
  _$$PubTagDtoImplCopyWith<_$PubTagDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
