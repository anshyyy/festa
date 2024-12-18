// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'happyhours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HappyhoursDto _$HappyhoursDtoFromJson(Map<String, dynamic> json) {
  return _HappyhoursDto.fromJson(json);
}

/// @nodoc
mixin _$HappyhoursDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  List<String> get urls => throw _privateConstructorUsedError;

  /// Serializes this HappyhoursDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HappyhoursDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HappyhoursDtoCopyWith<HappyhoursDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HappyhoursDtoCopyWith<$Res> {
  factory $HappyhoursDtoCopyWith(
          HappyhoursDto value, $Res Function(HappyhoursDto) then) =
      _$HappyhoursDtoCopyWithImpl<$Res, HappyhoursDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'url') List<String> urls});
}

/// @nodoc
class _$HappyhoursDtoCopyWithImpl<$Res, $Val extends HappyhoursDto>
    implements $HappyhoursDtoCopyWith<$Res> {
  _$HappyhoursDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HappyhoursDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? urls = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HappyhoursDtoImplCopyWith<$Res>
    implements $HappyhoursDtoCopyWith<$Res> {
  factory _$$HappyhoursDtoImplCopyWith(
          _$HappyhoursDtoImpl value, $Res Function(_$HappyhoursDtoImpl) then) =
      __$$HappyhoursDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'url') List<String> urls});
}

/// @nodoc
class __$$HappyhoursDtoImplCopyWithImpl<$Res>
    extends _$HappyhoursDtoCopyWithImpl<$Res, _$HappyhoursDtoImpl>
    implements _$$HappyhoursDtoImplCopyWith<$Res> {
  __$$HappyhoursDtoImplCopyWithImpl(
      _$HappyhoursDtoImpl _value, $Res Function(_$HappyhoursDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HappyhoursDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? urls = null,
  }) {
    return _then(_$HappyhoursDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HappyhoursDtoImpl implements _HappyhoursDto {
  _$HappyhoursDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'url') required final List<String> urls})
      : _urls = urls;

  factory _$HappyhoursDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HappyhoursDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<String> _urls;
  @override
  @JsonKey(name: 'url')
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  String toString() {
    return 'HappyhoursDto(id: $id, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HappyhoursDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._urls, _urls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_urls));

  /// Create a copy of HappyhoursDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HappyhoursDtoImplCopyWith<_$HappyhoursDtoImpl> get copyWith =>
      __$$HappyhoursDtoImplCopyWithImpl<_$HappyhoursDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HappyhoursDtoImplToJson(
      this,
    );
  }
}

abstract class _HappyhoursDto implements HappyhoursDto {
  factory _HappyhoursDto(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'url') required final List<String> urls}) =
      _$HappyhoursDtoImpl;

  factory _HappyhoursDto.fromJson(Map<String, dynamic> json) =
      _$HappyhoursDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'url')
  List<String> get urls;

  /// Create a copy of HappyhoursDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HappyhoursDtoImplCopyWith<_$HappyhoursDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
