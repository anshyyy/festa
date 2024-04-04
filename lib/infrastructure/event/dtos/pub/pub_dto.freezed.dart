// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubDto _$PubDtoFromJson(Map<String, dynamic> json) {
  return _PubDto.fromJson(json);
}

/// @nodoc
mixin _$PubDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName', defaultValue: '')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo', defaultValue: '')
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets', defaultValue: [])
  List<AssetDto> get assets => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'address', defaultValue: null)
  PubLocationDto? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'extraDetails', defaultValue: null)
  PubExtraDetailsDto? get extraDetailsDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'openingHours', defaultValue: null)
  PubOpeningHours? get openingHours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubDtoCopyWith<PubDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubDtoCopyWith<$Res> {
  factory $PubDtoCopyWith(PubDto value, $Res Function(PubDto) then) =
      _$PubDtoCopyWithImpl<$Res, PubDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'userName', defaultValue: '') String userName,
      @JsonKey(name: 'logo', defaultValue: '') String logo,
      @JsonKey(name: 'averageRating', defaultValue: 0.0) double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl,
      @JsonKey(name: 'assets', defaultValue: []) List<AssetDto> assets,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'address', defaultValue: null) PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'openingHours', defaultValue: null)
      PubOpeningHours? openingHours});

  $TagDtoCopyWith<$Res>? get tag;
  $PubLocationDtoCopyWith<$Res>? get location;
  $PubExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
  $PubOpeningHoursCopyWith<$Res>? get openingHours;
}

/// @nodoc
class _$PubDtoCopyWithImpl<$Res, $Val extends PubDto>
    implements $PubDtoCopyWith<$Res> {
  _$PubDtoCopyWithImpl(this._value, this._then);

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
    Object? userName = null,
    Object? logo = null,
    Object? averageRating = null,
    Object? coverImageUrl = null,
    Object? assets = null,
    Object? tag = freezed,
    Object? location = freezed,
    Object? extraDetailsDto = freezed,
    Object? openingHours = freezed,
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PubLocationDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as PubExtraDetailsDto?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as PubOpeningHours?,
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
  $PubLocationDtoCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $PubLocationDtoCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PubExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto {
    if (_value.extraDetailsDto == null) {
      return null;
    }

    return $PubExtraDetailsDtoCopyWith<$Res>(_value.extraDetailsDto!, (value) {
      return _then(_value.copyWith(extraDetailsDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PubOpeningHoursCopyWith<$Res>? get openingHours {
    if (_value.openingHours == null) {
      return null;
    }

    return $PubOpeningHoursCopyWith<$Res>(_value.openingHours!, (value) {
      return _then(_value.copyWith(openingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PubDtoImplCopyWith<$Res> implements $PubDtoCopyWith<$Res> {
  factory _$$PubDtoImplCopyWith(
          _$PubDtoImpl value, $Res Function(_$PubDtoImpl) then) =
      __$$PubDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'userName', defaultValue: '') String userName,
      @JsonKey(name: 'logo', defaultValue: '') String logo,
      @JsonKey(name: 'averageRating', defaultValue: 0.0) double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl,
      @JsonKey(name: 'assets', defaultValue: []) List<AssetDto> assets,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'address', defaultValue: null) PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'openingHours', defaultValue: null)
      PubOpeningHours? openingHours});

  @override
  $TagDtoCopyWith<$Res>? get tag;
  @override
  $PubLocationDtoCopyWith<$Res>? get location;
  @override
  $PubExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
  @override
  $PubOpeningHoursCopyWith<$Res>? get openingHours;
}

/// @nodoc
class __$$PubDtoImplCopyWithImpl<$Res>
    extends _$PubDtoCopyWithImpl<$Res, _$PubDtoImpl>
    implements _$$PubDtoImplCopyWith<$Res> {
  __$$PubDtoImplCopyWithImpl(
      _$PubDtoImpl _value, $Res Function(_$PubDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? description = null,
    Object? userName = null,
    Object? logo = null,
    Object? averageRating = null,
    Object? coverImageUrl = null,
    Object? assets = null,
    Object? tag = freezed,
    Object? location = freezed,
    Object? extraDetailsDto = freezed,
    Object? openingHours = freezed,
  }) {
    return _then(_$PubDtoImpl(
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PubLocationDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as PubExtraDetailsDto?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as PubOpeningHours?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubDtoImpl implements _PubDto {
  const _$PubDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'fullName', defaultValue: '') required this.fullName,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'userName', defaultValue: '') required this.userName,
      @JsonKey(name: 'logo', defaultValue: '') required this.logo,
      @JsonKey(name: 'averageRating', defaultValue: 0.0)
      required this.averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required this.coverImageUrl,
      @JsonKey(name: 'assets', defaultValue: []) required this.assets,
      @JsonKey(name: 'tag', defaultValue: null) this.tag,
      @JsonKey(name: 'address', defaultValue: null) this.location,
      @JsonKey(name: 'extraDetails', defaultValue: null) this.extraDetailsDto,
      @JsonKey(name: 'openingHours', defaultValue: null) this.openingHours});

  factory _$PubDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubDtoImplFromJson(json);

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
  @JsonKey(name: 'userName', defaultValue: '')
  final String userName;
  @override
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;
  @override
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  final double averageRating;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  final String coverImageUrl;
  @override
  @JsonKey(name: 'assets', defaultValue: [])
  final List<AssetDto> assets;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  final TagDto? tag;
  @override
  @JsonKey(name: 'address', defaultValue: null)
  final PubLocationDto? location;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  final PubExtraDetailsDto? extraDetailsDto;
  @override
  @JsonKey(name: 'openingHours', defaultValue: null)
  final PubOpeningHours? openingHours;

  @override
  String toString() {
    return 'PubDto(id: $id, fullName: $fullName, description: $description, userName: $userName, logo: $logo, averageRating: $averageRating, coverImageUrl: $coverImageUrl, assets: $assets, tag: $tag, location: $location, extraDetailsDto: $extraDetailsDto, openingHours: $openingHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            const DeepCollectionEquality().equals(other.assets, assets) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.extraDetailsDto, extraDetailsDto) ||
                other.extraDetailsDto == extraDetailsDto) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      description,
      userName,
      logo,
      averageRating,
      coverImageUrl,
      const DeepCollectionEquality().hash(assets),
      tag,
      location,
      extraDetailsDto,
      openingHours);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubDtoImplCopyWith<_$PubDtoImpl> get copyWith =>
      __$$PubDtoImplCopyWithImpl<_$PubDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubDtoImplToJson(
      this,
    );
  }
}

abstract class _PubDto implements PubDto {
  const factory _PubDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'fullName', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'userName', defaultValue: '')
      required final String userName,
      @JsonKey(name: 'logo', defaultValue: '') required final String logo,
      @JsonKey(name: 'averageRating', defaultValue: 0.0)
      required final double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required final String coverImageUrl,
      @JsonKey(name: 'assets', defaultValue: [])
      required final List<AssetDto> assets,
      @JsonKey(name: 'tag', defaultValue: null) final TagDto? tag,
      @JsonKey(name: 'address', defaultValue: null)
      final PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      final PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'openingHours', defaultValue: null)
      final PubOpeningHours? openingHours}) = _$PubDtoImpl;

  factory _PubDto.fromJson(Map<String, dynamic> json) = _$PubDtoImpl.fromJson;

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
  @JsonKey(name: 'userName', defaultValue: '')
  String get userName;
  @override
  @JsonKey(name: 'logo', defaultValue: '')
  String get logo;
  @override
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  double get averageRating;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl;
  @override
  @JsonKey(name: 'assets', defaultValue: [])
  List<AssetDto> get assets;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag;
  @override
  @JsonKey(name: 'address', defaultValue: null)
  PubLocationDto? get location;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  PubExtraDetailsDto? get extraDetailsDto;
  @override
  @JsonKey(name: 'openingHours', defaultValue: null)
  PubOpeningHours? get openingHours;
  @override
  @JsonKey(ignore: true)
  _$$PubDtoImplCopyWith<_$PubDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
