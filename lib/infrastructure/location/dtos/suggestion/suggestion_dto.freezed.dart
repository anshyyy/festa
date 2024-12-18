// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestionDto _$SuggestionDtoFromJson(Map<String, dynamic> json) {
  return _SuggestionDto.fromJson(json);
}

/// @nodoc
mixin _$SuggestionDto {
  @JsonKey(name: 'place_id', defaultValue: '')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_text', defaultValue: '')
  String get mainText => throw _privateConstructorUsedError;

  /// Serializes this SuggestionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionDtoCopyWith<SuggestionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionDtoCopyWith<$Res> {
  factory $SuggestionDtoCopyWith(
          SuggestionDto value, $Res Function(SuggestionDto) then) =
      _$SuggestionDtoCopyWithImpl<$Res, SuggestionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id', defaultValue: '') String placeId,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'main_text', defaultValue: '') String mainText});
}

/// @nodoc
class _$SuggestionDtoCopyWithImpl<$Res, $Val extends SuggestionDto>
    implements $SuggestionDtoCopyWith<$Res> {
  _$SuggestionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? mainText = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainText: null == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionDtoImplCopyWith<$Res>
    implements $SuggestionDtoCopyWith<$Res> {
  factory _$$SuggestionDtoImplCopyWith(
          _$SuggestionDtoImpl value, $Res Function(_$SuggestionDtoImpl) then) =
      __$$SuggestionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id', defaultValue: '') String placeId,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'main_text', defaultValue: '') String mainText});
}

/// @nodoc
class __$$SuggestionDtoImplCopyWithImpl<$Res>
    extends _$SuggestionDtoCopyWithImpl<$Res, _$SuggestionDtoImpl>
    implements _$$SuggestionDtoImplCopyWith<$Res> {
  __$$SuggestionDtoImplCopyWithImpl(
      _$SuggestionDtoImpl _value, $Res Function(_$SuggestionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? mainText = null,
  }) {
    return _then(_$SuggestionDtoImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainText: null == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionDtoImpl implements _SuggestionDto {
  const _$SuggestionDtoImpl(
      {@JsonKey(name: 'place_id', defaultValue: '') required this.placeId,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'main_text', defaultValue: '') required this.mainText});

  factory _$SuggestionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'place_id', defaultValue: '')
  final String placeId;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'main_text', defaultValue: '')
  final String mainText;

  @override
  String toString() {
    return 'SuggestionDto(placeId: $placeId, description: $description, mainText: $mainText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionDtoImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, description, mainText);

  /// Create a copy of SuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionDtoImplCopyWith<_$SuggestionDtoImpl> get copyWith =>
      __$$SuggestionDtoImplCopyWithImpl<_$SuggestionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionDtoImplToJson(
      this,
    );
  }
}

abstract class _SuggestionDto implements SuggestionDto {
  const factory _SuggestionDto(
      {@JsonKey(name: 'place_id', defaultValue: '')
      required final String placeId,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'main_text', defaultValue: '')
      required final String mainText}) = _$SuggestionDtoImpl;

  factory _SuggestionDto.fromJson(Map<String, dynamic> json) =
      _$SuggestionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'place_id', defaultValue: '')
  String get placeId;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'main_text', defaultValue: '')
  String get mainText;

  /// Create a copy of SuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionDtoImplCopyWith<_$SuggestionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
