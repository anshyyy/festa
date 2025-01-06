// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDto _$EventDtoFromJson(Map<String, dynamic> json) {
  return _EventDto.fromJson(json);
}

/// @nodoc
mixin _$EventDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'vicinity', defaultValue: '')
  String get vicinity => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance', defaultValue: 0)
  double get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate', defaultValue: '')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
  double get priceRangeStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceRangeEnd')
  double? get priceRangeEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'lsd', defaultValue: [])
  List<BulletDto> get lsd => throw _privateConstructorUsedError;
  @JsonKey(name: 'ambience', defaultValue: [])
  List<BulletDto> get ambience => throw _privateConstructorUsedError;
  @JsonKey(name: 'foodAndBeverages', defaultValue: [])
  List<BulletDto> get foodAndBeverages => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAndConditions', defaultValue: [])
  List<TermsAndCondition> get termsAndConditions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'faqs', defaultValue: [])
  List<FAQDto> get faqs => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
  String get eventStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets', defaultValue: [])
  List<AssetDto> get assets => throw _privateConstructorUsedError;
  @JsonKey(name: 'artists', defaultValue: [])
  List<ArtistProfileDto> get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventRules', defaultValue: [])
  List<EventRules> get eventRules => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressDto? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'pub')
  PubDto? get pub => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isApplied => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellationPolicy')
  CancellationPolicy? get cancellationPolicy =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'isLiked', defaultValue: false)
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPaused', defaultValue: true)
  bool get isPaused => throw _privateConstructorUsedError;
  @JsonKey(name: 'expensiveRating', defaultValue: 0)
  int get expensiveRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', defaultValue: [])
  List<CategoryDto> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventActivities', defaultValue: [])
  List<EventActivity> get eventActivities => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventTicketCategories', defaultValue: [])
  List<EventTicketCategoryDto> get eventTicketCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  bool get coverChargeEnabled => throw _privateConstructorUsedError;

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDtoCopyWith<EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res, EventDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE') String name,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImage,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'distance', defaultValue: 0) double distance,
      @JsonKey(name: 'startDate', defaultValue: '') String startDate,
      @JsonKey(name: 'endDate') String? endDate,
      @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
      double priceRangeStart,
      @JsonKey(name: 'priceRangeEnd') double? priceRangeEnd,
      @JsonKey(name: 'lsd', defaultValue: []) List<BulletDto> lsd,
      @JsonKey(name: 'ambience', defaultValue: []) List<BulletDto> ambience,
      @JsonKey(name: 'foodAndBeverages', defaultValue: [])
      List<BulletDto> foodAndBeverages,
      @JsonKey(name: 'termsAndConditions', defaultValue: [])
      List<TermsAndCondition> termsAndConditions,
      @JsonKey(name: 'faqs', defaultValue: []) List<FAQDto> faqs,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE') String eventStatus,
      @JsonKey(name: 'assets', defaultValue: []) List<AssetDto> assets,
      @JsonKey(name: 'artists', defaultValue: [])
      List<ArtistProfileDto> artists,
      @JsonKey(name: 'eventRules', defaultValue: [])
      List<EventRules> eventRules,
      @JsonKey(name: 'address') AddressDto? address,
      @JsonKey(name: 'pub') PubDto? pub,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(name: 'cancellationPolicy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'isLiked', defaultValue: false) bool isLiked,
      @JsonKey(name: 'isPaused', defaultValue: true) bool isPaused,
      @JsonKey(name: 'expensiveRating', defaultValue: 0) int expensiveRating,
      @JsonKey(name: 'category', defaultValue: []) List<CategoryDto> categories,
      @JsonKey(name: 'eventActivities', defaultValue: [])
      List<EventActivity> eventActivities,
      @JsonKey(name: 'eventTicketCategories', defaultValue: [])
      List<EventTicketCategoryDto> eventTicketCategories,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      bool coverChargeEnabled});

  $AddressDtoCopyWith<$Res>? get address;
  $PubDtoCopyWith<$Res>? get pub;
  $CancellationPolicyCopyWith<$Res>? get cancellationPolicy;
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res, $Val extends EventDto>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverImage = null,
    Object? description = null,
    Object? vicinity = null,
    Object? distance = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? priceRangeStart = null,
    Object? priceRangeEnd = freezed,
    Object? lsd = null,
    Object? ambience = null,
    Object? foodAndBeverages = null,
    Object? termsAndConditions = null,
    Object? faqs = null,
    Object? isPaid = null,
    Object? totalCapacity = null,
    Object? bookedSeats = null,
    Object? eventStatus = null,
    Object? assets = null,
    Object? artists = null,
    Object? eventRules = null,
    Object? address = freezed,
    Object? pub = freezed,
    Object? isApplied = null,
    Object? cancellationPolicy = freezed,
    Object? isLiked = null,
    Object? isPaused = null,
    Object? expensiveRating = null,
    Object? categories = null,
    Object? eventActivities = null,
    Object? eventTicketCategories = null,
    Object? coverChargeEnabled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priceRangeStart: null == priceRangeStart
          ? _value.priceRangeStart
          : priceRangeStart // ignore: cast_nullable_to_non_nullable
              as double,
      priceRangeEnd: freezed == priceRangeEnd
          ? _value.priceRangeEnd
          : priceRangeEnd // ignore: cast_nullable_to_non_nullable
              as double?,
      lsd: null == lsd
          ? _value.lsd
          : lsd // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      ambience: null == ambience
          ? _value.ambience
          : ambience // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      foodAndBeverages: null == foodAndBeverages
          ? _value.foodAndBeverages
          : foodAndBeverages // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as List<TermsAndCondition>,
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FAQDto>,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      eventStatus: null == eventStatus
          ? _value.eventStatus
          : eventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistProfileDto>,
      eventRules: null == eventRules
          ? _value.eventRules
          : eventRules // ignore: cast_nullable_to_non_nullable
              as List<EventRules>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto?,
      pub: freezed == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as PubDto?,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      cancellationPolicy: freezed == cancellationPolicy
          ? _value.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      expensiveRating: null == expensiveRating
          ? _value.expensiveRating
          : expensiveRating // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>,
      eventActivities: null == eventActivities
          ? _value.eventActivities
          : eventActivities // ignore: cast_nullable_to_non_nullable
              as List<EventActivity>,
      eventTicketCategories: null == eventTicketCategories
          ? _value.eventTicketCategories
          : eventTicketCategories // ignore: cast_nullable_to_non_nullable
              as List<EventTicketCategoryDto>,
      coverChargeEnabled: null == coverChargeEnabled
          ? _value.coverChargeEnabled
          : coverChargeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressDtoCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressDtoCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PubDtoCopyWith<$Res>? get pub {
    if (_value.pub == null) {
      return null;
    }

    return $PubDtoCopyWith<$Res>(_value.pub!, (value) {
      return _then(_value.copyWith(pub: value) as $Val);
    });
  }

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CancellationPolicyCopyWith<$Res>? get cancellationPolicy {
    if (_value.cancellationPolicy == null) {
      return null;
    }

    return $CancellationPolicyCopyWith<$Res>(_value.cancellationPolicy!,
        (value) {
      return _then(_value.copyWith(cancellationPolicy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDtoImplCopyWith<$Res>
    implements $EventDtoCopyWith<$Res> {
  factory _$$EventDtoImplCopyWith(
          _$EventDtoImpl value, $Res Function(_$EventDtoImpl) then) =
      __$$EventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE') String name,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImage,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'vicinity', defaultValue: '') String vicinity,
      @JsonKey(name: 'distance', defaultValue: 0) double distance,
      @JsonKey(name: 'startDate', defaultValue: '') String startDate,
      @JsonKey(name: 'endDate') String? endDate,
      @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
      double priceRangeStart,
      @JsonKey(name: 'priceRangeEnd') double? priceRangeEnd,
      @JsonKey(name: 'lsd', defaultValue: []) List<BulletDto> lsd,
      @JsonKey(name: 'ambience', defaultValue: []) List<BulletDto> ambience,
      @JsonKey(name: 'foodAndBeverages', defaultValue: [])
      List<BulletDto> foodAndBeverages,
      @JsonKey(name: 'termsAndConditions', defaultValue: [])
      List<TermsAndCondition> termsAndConditions,
      @JsonKey(name: 'faqs', defaultValue: []) List<FAQDto> faqs,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE') String eventStatus,
      @JsonKey(name: 'assets', defaultValue: []) List<AssetDto> assets,
      @JsonKey(name: 'artists', defaultValue: [])
      List<ArtistProfileDto> artists,
      @JsonKey(name: 'eventRules', defaultValue: [])
      List<EventRules> eventRules,
      @JsonKey(name: 'address') AddressDto? address,
      @JsonKey(name: 'pub') PubDto? pub,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(name: 'cancellationPolicy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'isLiked', defaultValue: false) bool isLiked,
      @JsonKey(name: 'isPaused', defaultValue: true) bool isPaused,
      @JsonKey(name: 'expensiveRating', defaultValue: 0) int expensiveRating,
      @JsonKey(name: 'category', defaultValue: []) List<CategoryDto> categories,
      @JsonKey(name: 'eventActivities', defaultValue: [])
      List<EventActivity> eventActivities,
      @JsonKey(name: 'eventTicketCategories', defaultValue: [])
      List<EventTicketCategoryDto> eventTicketCategories,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      bool coverChargeEnabled});

  @override
  $AddressDtoCopyWith<$Res>? get address;
  @override
  $PubDtoCopyWith<$Res>? get pub;
  @override
  $CancellationPolicyCopyWith<$Res>? get cancellationPolicy;
}

/// @nodoc
class __$$EventDtoImplCopyWithImpl<$Res>
    extends _$EventDtoCopyWithImpl<$Res, _$EventDtoImpl>
    implements _$$EventDtoImplCopyWith<$Res> {
  __$$EventDtoImplCopyWithImpl(
      _$EventDtoImpl _value, $Res Function(_$EventDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverImage = null,
    Object? description = null,
    Object? vicinity = null,
    Object? distance = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? priceRangeStart = null,
    Object? priceRangeEnd = freezed,
    Object? lsd = null,
    Object? ambience = null,
    Object? foodAndBeverages = null,
    Object? termsAndConditions = null,
    Object? faqs = null,
    Object? isPaid = null,
    Object? totalCapacity = null,
    Object? bookedSeats = null,
    Object? eventStatus = null,
    Object? assets = null,
    Object? artists = null,
    Object? eventRules = null,
    Object? address = freezed,
    Object? pub = freezed,
    Object? isApplied = null,
    Object? cancellationPolicy = freezed,
    Object? isLiked = null,
    Object? isPaused = null,
    Object? expensiveRating = null,
    Object? categories = null,
    Object? eventActivities = null,
    Object? eventTicketCategories = null,
    Object? coverChargeEnabled = null,
  }) {
    return _then(_$EventDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priceRangeStart: null == priceRangeStart
          ? _value.priceRangeStart
          : priceRangeStart // ignore: cast_nullable_to_non_nullable
              as double,
      priceRangeEnd: freezed == priceRangeEnd
          ? _value.priceRangeEnd
          : priceRangeEnd // ignore: cast_nullable_to_non_nullable
              as double?,
      lsd: null == lsd
          ? _value.lsd
          : lsd // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      ambience: null == ambience
          ? _value.ambience
          : ambience // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      foodAndBeverages: null == foodAndBeverages
          ? _value.foodAndBeverages
          : foodAndBeverages // ignore: cast_nullable_to_non_nullable
              as List<BulletDto>,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as List<TermsAndCondition>,
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FAQDto>,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      eventStatus: null == eventStatus
          ? _value.eventStatus
          : eventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistProfileDto>,
      eventRules: null == eventRules
          ? _value.eventRules
          : eventRules // ignore: cast_nullable_to_non_nullable
              as List<EventRules>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto?,
      pub: freezed == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as PubDto?,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      cancellationPolicy: freezed == cancellationPolicy
          ? _value.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      expensiveRating: null == expensiveRating
          ? _value.expensiveRating
          : expensiveRating // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>,
      eventActivities: null == eventActivities
          ? _value.eventActivities
          : eventActivities // ignore: cast_nullable_to_non_nullable
              as List<EventActivity>,
      eventTicketCategories: null == eventTicketCategories
          ? _value.eventTicketCategories
          : eventTicketCategories // ignore: cast_nullable_to_non_nullable
              as List<EventTicketCategoryDto>,
      coverChargeEnabled: null == coverChargeEnabled
          ? _value.coverChargeEnabled
          : coverChargeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDtoImpl implements _EventDto {
  const _$EventDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE') required this.name,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required this.coverImage,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'vicinity', defaultValue: '') required this.vicinity,
      @JsonKey(name: 'distance', defaultValue: 0) required this.distance,
      @JsonKey(name: 'startDate', defaultValue: '') required this.startDate,
      @JsonKey(name: 'endDate') this.endDate,
      @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
      required this.priceRangeStart,
      @JsonKey(name: 'priceRangeEnd') this.priceRangeEnd,
      @JsonKey(name: 'lsd', defaultValue: []) required this.lsd,
      @JsonKey(name: 'ambience', defaultValue: []) required this.ambience,
      @JsonKey(name: 'foodAndBeverages', defaultValue: [])
      required this.foodAndBeverages,
      @JsonKey(name: 'termsAndConditions', defaultValue: [])
      required this.termsAndConditions,
      @JsonKey(name: 'faqs', defaultValue: []) required this.faqs,
      @JsonKey(name: 'isPaid', defaultValue: false) required this.isPaid,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required this.totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) required this.bookedSeats,
      @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
      required this.eventStatus,
      @JsonKey(name: 'assets', defaultValue: []) required this.assets,
      @JsonKey(name: 'artists', defaultValue: []) required this.artists,
      @JsonKey(name: 'eventRules', defaultValue: []) required this.eventRules,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'pub') this.pub,
      @JsonKey(defaultValue: false) required this.isApplied,
      @JsonKey(name: 'cancellationPolicy') this.cancellationPolicy,
      @JsonKey(name: 'isLiked', defaultValue: false) required this.isLiked,
      @JsonKey(name: 'isPaused', defaultValue: true) required this.isPaused,
      @JsonKey(name: 'expensiveRating', defaultValue: 0)
      required this.expensiveRating,
      @JsonKey(name: 'category', defaultValue: []) required this.categories,
      @JsonKey(name: 'eventActivities', defaultValue: [])
      required this.eventActivities,
      @JsonKey(name: 'eventTicketCategories', defaultValue: [])
      required this.eventTicketCategories,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      required this.coverChargeEnabled});

  factory _$EventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE')
  final String name;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  final String coverImage;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'vicinity', defaultValue: '')
  final String vicinity;
  @override
  @JsonKey(name: 'distance', defaultValue: 0)
  final double distance;
  @override
  @JsonKey(name: 'startDate', defaultValue: '')
  final String startDate;
  @override
  @JsonKey(name: 'endDate')
  final String? endDate;
  @override
  @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
  final double priceRangeStart;
  @override
  @JsonKey(name: 'priceRangeEnd')
  final double? priceRangeEnd;
  @override
  @JsonKey(name: 'lsd', defaultValue: [])
  final List<BulletDto> lsd;
  @override
  @JsonKey(name: 'ambience', defaultValue: [])
  final List<BulletDto> ambience;
  @override
  @JsonKey(name: 'foodAndBeverages', defaultValue: [])
  final List<BulletDto> foodAndBeverages;
  @override
  @JsonKey(name: 'termsAndConditions', defaultValue: [])
  final List<TermsAndCondition> termsAndConditions;
  @override
  @JsonKey(name: 'faqs', defaultValue: [])
  final List<FAQDto> faqs;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  final bool isPaid;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  final int totalCapacity;
  @override
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  final int bookedSeats;
  @override
  @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
  final String eventStatus;
  @override
  @JsonKey(name: 'assets', defaultValue: [])
  final List<AssetDto> assets;
  @override
  @JsonKey(name: 'artists', defaultValue: [])
  final List<ArtistProfileDto> artists;
  @override
  @JsonKey(name: 'eventRules', defaultValue: [])
  final List<EventRules> eventRules;
  @override
  @JsonKey(name: 'address')
  final AddressDto? address;
  @override
  @JsonKey(name: 'pub')
  final PubDto? pub;
  @override
  @JsonKey(defaultValue: false)
  final bool isApplied;
  @override
  @JsonKey(name: 'cancellationPolicy')
  final CancellationPolicy? cancellationPolicy;
  @override
  @JsonKey(name: 'isLiked', defaultValue: false)
  final bool isLiked;
  @override
  @JsonKey(name: 'isPaused', defaultValue: true)
  final bool isPaused;
  @override
  @JsonKey(name: 'expensiveRating', defaultValue: 0)
  final int expensiveRating;
  @override
  @JsonKey(name: 'category', defaultValue: [])
  final List<CategoryDto> categories;
  @override
  @JsonKey(name: 'eventActivities', defaultValue: [])
  final List<EventActivity> eventActivities;
  @override
  @JsonKey(name: 'eventTicketCategories', defaultValue: [])
  final List<EventTicketCategoryDto> eventTicketCategories;
  @override
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  final bool coverChargeEnabled;

  @override
  String toString() {
    return 'EventDto(id: $id, name: $name, coverImage: $coverImage, description: $description, vicinity: $vicinity, distance: $distance, startDate: $startDate, endDate: $endDate, priceRangeStart: $priceRangeStart, priceRangeEnd: $priceRangeEnd, lsd: $lsd, ambience: $ambience, foodAndBeverages: $foodAndBeverages, termsAndConditions: $termsAndConditions, faqs: $faqs, isPaid: $isPaid, totalCapacity: $totalCapacity, bookedSeats: $bookedSeats, eventStatus: $eventStatus, assets: $assets, artists: $artists, eventRules: $eventRules, address: $address, pub: $pub, isApplied: $isApplied, cancellationPolicy: $cancellationPolicy, isLiked: $isLiked, isPaused: $isPaused, expensiveRating: $expensiveRating, categories: $categories, eventActivities: $eventActivities, eventTicketCategories: $eventTicketCategories, coverChargeEnabled: $coverChargeEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.priceRangeStart, priceRangeStart) ||
                other.priceRangeStart == priceRangeStart) &&
            (identical(other.priceRangeEnd, priceRangeEnd) ||
                other.priceRangeEnd == priceRangeEnd) &&
            const DeepCollectionEquality().equals(other.lsd, lsd) &&
            const DeepCollectionEquality().equals(other.ambience, ambience) &&
            const DeepCollectionEquality()
                .equals(other.foodAndBeverages, foodAndBeverages) &&
            const DeepCollectionEquality()
                .equals(other.termsAndConditions, termsAndConditions) &&
            const DeepCollectionEquality().equals(other.faqs, faqs) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.totalCapacity, totalCapacity) ||
                other.totalCapacity == totalCapacity) &&
            (identical(other.bookedSeats, bookedSeats) ||
                other.bookedSeats == bookedSeats) &&
            (identical(other.eventStatus, eventStatus) ||
                other.eventStatus == eventStatus) &&
            const DeepCollectionEquality().equals(other.assets, assets) &&
            const DeepCollectionEquality().equals(other.artists, artists) &&
            const DeepCollectionEquality()
                .equals(other.eventRules, eventRules) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pub, pub) || other.pub == pub) &&
            (identical(other.isApplied, isApplied) ||
                other.isApplied == isApplied) &&
            (identical(other.cancellationPolicy, cancellationPolicy) ||
                other.cancellationPolicy == cancellationPolicy) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.expensiveRating, expensiveRating) ||
                other.expensiveRating == expensiveRating) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.eventActivities, eventActivities) &&
            const DeepCollectionEquality()
                .equals(other.eventTicketCategories, eventTicketCategories) &&
            (identical(other.coverChargeEnabled, coverChargeEnabled) ||
                other.coverChargeEnabled == coverChargeEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        coverImage,
        description,
        vicinity,
        distance,
        startDate,
        endDate,
        priceRangeStart,
        priceRangeEnd,
        const DeepCollectionEquality().hash(lsd),
        const DeepCollectionEquality().hash(ambience),
        const DeepCollectionEquality().hash(foodAndBeverages),
        const DeepCollectionEquality().hash(termsAndConditions),
        const DeepCollectionEquality().hash(faqs),
        isPaid,
        totalCapacity,
        bookedSeats,
        eventStatus,
        const DeepCollectionEquality().hash(assets),
        const DeepCollectionEquality().hash(artists),
        const DeepCollectionEquality().hash(eventRules),
        address,
        pub,
        isApplied,
        cancellationPolicy,
        isLiked,
        isPaused,
        expensiveRating,
        const DeepCollectionEquality().hash(categories),
        const DeepCollectionEquality().hash(eventActivities),
        const DeepCollectionEquality().hash(eventTicketCategories),
        coverChargeEnabled
      ]);

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      __$$EventDtoImplCopyWithImpl<_$EventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDtoImplToJson(
      this,
    );
  }
}

abstract class _EventDto implements EventDto {
  const factory _EventDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE')
      required final String name,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required final String coverImage,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'vicinity', defaultValue: '')
      required final String vicinity,
      @JsonKey(name: 'distance', defaultValue: 0)
      required final double distance,
      @JsonKey(name: 'startDate', defaultValue: '')
      required final String startDate,
      @JsonKey(name: 'endDate') final String? endDate,
      @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
      required final double priceRangeStart,
      @JsonKey(name: 'priceRangeEnd') final double? priceRangeEnd,
      @JsonKey(name: 'lsd', defaultValue: [])
      required final List<BulletDto> lsd,
      @JsonKey(name: 'ambience', defaultValue: [])
      required final List<BulletDto> ambience,
      @JsonKey(name: 'foodAndBeverages', defaultValue: [])
      required final List<BulletDto> foodAndBeverages,
      @JsonKey(name: 'termsAndConditions', defaultValue: [])
      required final List<TermsAndCondition> termsAndConditions,
      @JsonKey(name: 'faqs', defaultValue: []) required final List<FAQDto> faqs,
      @JsonKey(name: 'isPaid', defaultValue: false) required final bool isPaid,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required final int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0)
      required final int bookedSeats,
      @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
      required final String eventStatus,
      @JsonKey(name: 'assets', defaultValue: [])
      required final List<AssetDto> assets,
      @JsonKey(name: 'artists', defaultValue: [])
      required final List<ArtistProfileDto> artists,
      @JsonKey(name: 'eventRules', defaultValue: [])
      required final List<EventRules> eventRules,
      @JsonKey(name: 'address') final AddressDto? address,
      @JsonKey(name: 'pub') final PubDto? pub,
      @JsonKey(defaultValue: false) required final bool isApplied,
      @JsonKey(name: 'cancellationPolicy')
      final CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'isLiked', defaultValue: false)
      required final bool isLiked,
      @JsonKey(name: 'isPaused', defaultValue: true)
      required final bool isPaused,
      @JsonKey(name: 'expensiveRating', defaultValue: 0)
      required final int expensiveRating,
      @JsonKey(name: 'category', defaultValue: [])
      required final List<CategoryDto> categories,
      @JsonKey(name: 'eventActivities', defaultValue: [])
      required final List<EventActivity> eventActivities,
      @JsonKey(name: 'eventTicketCategories', defaultValue: [])
      required final List<EventTicketCategoryDto> eventTicketCategories,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      required final bool coverChargeEnabled}) = _$EventDtoImpl;

  factory _EventDto.fromJson(Map<String, dynamic> json) =
      _$EventDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE')
  String get name;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImage;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'vicinity', defaultValue: '')
  String get vicinity;
  @override
  @JsonKey(name: 'distance', defaultValue: 0)
  double get distance;
  @override
  @JsonKey(name: 'startDate', defaultValue: '')
  String get startDate;
  @override
  @JsonKey(name: 'endDate')
  String? get endDate;
  @override
  @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
  double get priceRangeStart;
  @override
  @JsonKey(name: 'priceRangeEnd')
  double? get priceRangeEnd;
  @override
  @JsonKey(name: 'lsd', defaultValue: [])
  List<BulletDto> get lsd;
  @override
  @JsonKey(name: 'ambience', defaultValue: [])
  List<BulletDto> get ambience;
  @override
  @JsonKey(name: 'foodAndBeverages', defaultValue: [])
  List<BulletDto> get foodAndBeverages;
  @override
  @JsonKey(name: 'termsAndConditions', defaultValue: [])
  List<TermsAndCondition> get termsAndConditions;
  @override
  @JsonKey(name: 'faqs', defaultValue: [])
  List<FAQDto> get faqs;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity;
  @override
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats;
  @override
  @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
  String get eventStatus;
  @override
  @JsonKey(name: 'assets', defaultValue: [])
  List<AssetDto> get assets;
  @override
  @JsonKey(name: 'artists', defaultValue: [])
  List<ArtistProfileDto> get artists;
  @override
  @JsonKey(name: 'eventRules', defaultValue: [])
  List<EventRules> get eventRules;
  @override
  @JsonKey(name: 'address')
  AddressDto? get address;
  @override
  @JsonKey(name: 'pub')
  PubDto? get pub;
  @override
  @JsonKey(defaultValue: false)
  bool get isApplied;
  @override
  @JsonKey(name: 'cancellationPolicy')
  CancellationPolicy? get cancellationPolicy;
  @override
  @JsonKey(name: 'isLiked', defaultValue: false)
  bool get isLiked;
  @override
  @JsonKey(name: 'isPaused', defaultValue: true)
  bool get isPaused;
  @override
  @JsonKey(name: 'expensiveRating', defaultValue: 0)
  int get expensiveRating;
  @override
  @JsonKey(name: 'category', defaultValue: [])
  List<CategoryDto> get categories;
  @override
  @JsonKey(name: 'eventActivities', defaultValue: [])
  List<EventActivity> get eventActivities;
  @override
  @JsonKey(name: 'eventTicketCategories', defaultValue: [])
  List<EventTicketCategoryDto> get eventTicketCategories;
  @override
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  bool get coverChargeEnabled;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
