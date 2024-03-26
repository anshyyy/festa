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
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', defaultValue: [])
  List<ArtistCategoryDto> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'city', defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'extraDetails', defaultValue: null)
  ArtistExtraDetailsDto? get extraDetailsDto =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'category', defaultValue: [])
      List<ArtistCategoryDto> categories,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      ArtistExtraDetailsDto? extraDetailsDto});

  $TagDtoCopyWith<$Res>? get tag;
  $ArtistExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
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
    Object? description = null,
    Object? categories = null,
    Object? city = null,
    Object? tag = freezed,
    Object? extraDetailsDto = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ArtistCategoryDto>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as ArtistExtraDetailsDto?,
    ) as $Val);
  }

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

  @override
  @pragma('vm:prefer-inline')
  $ArtistExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto {
    if (_value.extraDetailsDto == null) {
      return null;
    }

    return $ArtistExtraDetailsDtoCopyWith<$Res>(_value.extraDetailsDto!,
        (value) {
      return _then(_value.copyWith(extraDetailsDto: value) as $Val);
    });
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
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'category', defaultValue: [])
      List<ArtistCategoryDto> categories,
      @JsonKey(name: 'city', defaultValue: '') String city,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      ArtistExtraDetailsDto? extraDetailsDto});

  @override
  $TagDtoCopyWith<$Res>? get tag;
  @override
  $ArtistExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
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
    Object? description = null,
    Object? categories = null,
    Object? city = null,
    Object? tag = freezed,
    Object? extraDetailsDto = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ArtistCategoryDto>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as ArtistExtraDetailsDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistDtoImpl implements _ArtistDto {
  const _$ArtistDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'fullName', defaultValue: '') required this.fullName,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'category', defaultValue: []) required this.categories,
      @JsonKey(name: 'city', defaultValue: '') required this.city,
      @JsonKey(name: 'tag', defaultValue: null) this.tag,
      @JsonKey(name: 'extraDetails', defaultValue: null) this.extraDetailsDto});

  factory _$ArtistDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  final String fullName;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'category', defaultValue: [])
  final List<ArtistCategoryDto> categories;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  final String city;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  final TagDto? tag;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  final ArtistExtraDetailsDto? extraDetailsDto;

  @override
  String toString() {
    return 'ArtistDto(id: $id, fullName: $fullName, description: $description, categories: $categories, city: $city, tag: $tag, extraDetailsDto: $extraDetailsDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.extraDetailsDto, extraDetailsDto) ||
                other.extraDetailsDto == extraDetailsDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      description,
      const DeepCollectionEquality().hash(categories),
      city,
      tag,
      extraDetailsDto);

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
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'fullName', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'category', defaultValue: [])
      required final List<ArtistCategoryDto> categories,
      @JsonKey(name: 'city', defaultValue: '') required final String city,
      @JsonKey(name: 'tag', defaultValue: null) final TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      final ArtistExtraDetailsDto? extraDetailsDto}) = _$ArtistDtoImpl;

  factory _ArtistDto.fromJson(Map<String, dynamic> json) =
      _$ArtistDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'category', defaultValue: [])
  List<ArtistCategoryDto> get categories;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  String get city;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  ArtistExtraDetailsDto? get extraDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$ArtistDtoImplCopyWith<_$ArtistDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
