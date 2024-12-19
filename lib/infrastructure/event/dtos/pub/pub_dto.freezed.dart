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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: 'highlights', defaultValue: [])
  List<AssetDto> get highlights => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'barMenu')
  List<MenuDto>? get barMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'foodMenu')
  List<MenuDto>? get foodMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'address', defaultValue: null)
  PubLocationDto? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'extraDetails', defaultValue: null)
  PubExtraDetailsDto? get extraDetailsDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'happyHours', defaultValue: [])
  List<HappyhoursDto>? get happyHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'openingHours', defaultValue: null)
  PubOpeningHours? get openingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'completedEventsCount', defaultValue: 0)
  int? get completedEventsCount => throw _privateConstructorUsedError;

  /// Serializes this PubDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'highlights', defaultValue: []) List<AssetDto> highlights,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'barMenu') List<MenuDto>? barMenu,
      @JsonKey(name: 'foodMenu') List<MenuDto>? foodMenu,
      @JsonKey(name: 'address', defaultValue: null) PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'happyHours', defaultValue: [])
      List<HappyhoursDto>? happyHours,
      @JsonKey(name: 'openingHours', defaultValue: null)
      PubOpeningHours? openingHours,
      @JsonKey(name: 'completedEventsCount', defaultValue: 0)
      int? completedEventsCount});

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

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
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
    Object? highlights = null,
    Object? tag = freezed,
    Object? barMenu = freezed,
    Object? foodMenu = freezed,
    Object? location = freezed,
    Object? extraDetailsDto = freezed,
    Object? happyHours = freezed,
    Object? openingHours = freezed,
    Object? completedEventsCount = freezed,
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
      highlights: null == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      barMenu: freezed == barMenu
          ? _value.barMenu
          : barMenu // ignore: cast_nullable_to_non_nullable
              as List<MenuDto>?,
      foodMenu: freezed == foodMenu
          ? _value.foodMenu
          : foodMenu // ignore: cast_nullable_to_non_nullable
              as List<MenuDto>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PubLocationDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as PubExtraDetailsDto?,
      happyHours: freezed == happyHours
          ? _value.happyHours
          : happyHours // ignore: cast_nullable_to_non_nullable
              as List<HappyhoursDto>?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as PubOpeningHours?,
      completedEventsCount: freezed == completedEventsCount
          ? _value.completedEventsCount
          : completedEventsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of PubDto
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

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
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
      @JsonKey(name: 'highlights', defaultValue: []) List<AssetDto> highlights,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'barMenu') List<MenuDto>? barMenu,
      @JsonKey(name: 'foodMenu') List<MenuDto>? foodMenu,
      @JsonKey(name: 'address', defaultValue: null) PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'happyHours', defaultValue: [])
      List<HappyhoursDto>? happyHours,
      @JsonKey(name: 'openingHours', defaultValue: null)
      PubOpeningHours? openingHours,
      @JsonKey(name: 'completedEventsCount', defaultValue: 0)
      int? completedEventsCount});

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

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
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
    Object? highlights = null,
    Object? tag = freezed,
    Object? barMenu = freezed,
    Object? foodMenu = freezed,
    Object? location = freezed,
    Object? extraDetailsDto = freezed,
    Object? happyHours = freezed,
    Object? openingHours = freezed,
    Object? completedEventsCount = freezed,
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
      highlights: null == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      barMenu: freezed == barMenu
          ? _value.barMenu
          : barMenu // ignore: cast_nullable_to_non_nullable
              as List<MenuDto>?,
      foodMenu: freezed == foodMenu
          ? _value.foodMenu
          : foodMenu // ignore: cast_nullable_to_non_nullable
              as List<MenuDto>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PubLocationDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as PubExtraDetailsDto?,
      happyHours: freezed == happyHours
          ? _value.happyHours
          : happyHours // ignore: cast_nullable_to_non_nullable
              as List<HappyhoursDto>?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as PubOpeningHours?,
      completedEventsCount: freezed == completedEventsCount
          ? _value.completedEventsCount
          : completedEventsCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'highlights', defaultValue: []) required this.highlights,
      @JsonKey(name: 'tag', defaultValue: null) this.tag,
      @JsonKey(name: 'barMenu') this.barMenu,
      @JsonKey(name: 'foodMenu') this.foodMenu,
      @JsonKey(name: 'address', defaultValue: null) this.location,
      @JsonKey(name: 'extraDetails', defaultValue: null) this.extraDetailsDto,
      @JsonKey(name: 'happyHours', defaultValue: []) this.happyHours,
      @JsonKey(name: 'openingHours', defaultValue: null) this.openingHours,
      @JsonKey(name: 'completedEventsCount', defaultValue: 0)
      this.completedEventsCount});

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
  @JsonKey(name: 'highlights', defaultValue: [])
  final List<AssetDto> highlights;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  final TagDto? tag;
  @override
  @JsonKey(name: 'barMenu')
  final List<MenuDto>? barMenu;
  @override
  @JsonKey(name: 'foodMenu')
  final List<MenuDto>? foodMenu;
  @override
  @JsonKey(name: 'address', defaultValue: null)
  final PubLocationDto? location;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  final PubExtraDetailsDto? extraDetailsDto;
  @override
  @JsonKey(name: 'happyHours', defaultValue: [])
  final List<HappyhoursDto>? happyHours;
  @override
  @JsonKey(name: 'openingHours', defaultValue: null)
  final PubOpeningHours? openingHours;
  @override
  @JsonKey(name: 'completedEventsCount', defaultValue: 0)
  final int? completedEventsCount;

  @override
  String toString() {
    return 'PubDto(id: $id, fullName: $fullName, description: $description, userName: $userName, logo: $logo, averageRating: $averageRating, coverImageUrl: $coverImageUrl, assets: $assets, highlights: $highlights, tag: $tag, barMenu: $barMenu, foodMenu: $foodMenu, location: $location, extraDetailsDto: $extraDetailsDto, happyHours: $happyHours, openingHours: $openingHours, completedEventsCount: $completedEventsCount)';
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
            const DeepCollectionEquality()
                .equals(other.highlights, highlights) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other.barMenu, barMenu) &&
            const DeepCollectionEquality().equals(other.foodMenu, foodMenu) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.extraDetailsDto, extraDetailsDto) ||
                other.extraDetailsDto == extraDetailsDto) &&
            const DeepCollectionEquality()
                .equals(other.happyHours, happyHours) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            (identical(other.completedEventsCount, completedEventsCount) ||
                other.completedEventsCount == completedEventsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(highlights),
      tag,
      const DeepCollectionEquality().hash(barMenu),
      const DeepCollectionEquality().hash(foodMenu),
      location,
      extraDetailsDto,
      const DeepCollectionEquality().hash(happyHours),
      openingHours,
      completedEventsCount);

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'highlights', defaultValue: [])
      required final List<AssetDto> highlights,
      @JsonKey(name: 'tag', defaultValue: null) final TagDto? tag,
      @JsonKey(name: 'barMenu') final List<MenuDto>? barMenu,
      @JsonKey(name: 'foodMenu') final List<MenuDto>? foodMenu,
      @JsonKey(name: 'address', defaultValue: null)
      final PubLocationDto? location,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      final PubExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'happyHours', defaultValue: [])
      final List<HappyhoursDto>? happyHours,
      @JsonKey(name: 'openingHours', defaultValue: null)
      final PubOpeningHours? openingHours,
      @JsonKey(name: 'completedEventsCount', defaultValue: 0)
      final int? completedEventsCount}) = _$PubDtoImpl;

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
  @JsonKey(name: 'highlights', defaultValue: [])
  List<AssetDto> get highlights;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag;
  @override
  @JsonKey(name: 'barMenu')
  List<MenuDto>? get barMenu;
  @override
  @JsonKey(name: 'foodMenu')
  List<MenuDto>? get foodMenu;
  @override
  @JsonKey(name: 'address', defaultValue: null)
  PubLocationDto? get location;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  PubExtraDetailsDto? get extraDetailsDto;
  @override
  @JsonKey(name: 'happyHours', defaultValue: [])
  List<HappyhoursDto>? get happyHours;
  @override
  @JsonKey(name: 'openingHours', defaultValue: null)
  PubOpeningHours? get openingHours;
  @override
  @JsonKey(name: 'completedEventsCount', defaultValue: 0)
  int? get completedEventsCount;

  /// Create a copy of PubDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubDtoImplCopyWith<_$PubDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
