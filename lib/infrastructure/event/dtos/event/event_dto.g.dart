// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDtoImpl _$$EventDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['fullName'] as String? ?? 'BE ISSUE',
      coverImage: json['coverImageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
      vicinity: json['vicinity'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String?,
      priceRangeStart: (json['priceRangeStart'] as num?)?.toDouble() ?? 0.0,
      priceRangeEnd: (json['priceRangeEnd'] as num?)?.toDouble(),
      lsd: (json['lsd'] as List<dynamic>?)
              ?.map((e) => BulletDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ambience: (json['ambience'] as List<dynamic>?)
              ?.map((e) => BulletDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      foodAndBeverages: (json['foodAndBeverages'] as List<dynamic>?)
              ?.map((e) => BulletDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      termsAndConditions: (json['termsAndConditions'] as List<dynamic>?)
              ?.map(
                  (e) => TermsAndCondition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      faqs: (json['faqs'] as List<dynamic>?)
              ?.map((e) => FAQDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isPaid: json['isPaid'] as bool? ?? false,
      totalCapacity: (json['totalCapacity'] as num?)?.toInt() ?? 0,
      bookedSeats: (json['bookedSeats'] as num?)?.toInt() ?? 0,
      eventStatus: json['eventStatus'] as String? ?? 'ACTIVE',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => ArtistProfileDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventRules: (json['eventRules'] as List<dynamic>?)
              ?.map((e) => EventRules.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      address: json['address'] == null
          ? null
          : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      pub: json['pub'] == null
          ? null
          : PubDto.fromJson(json['pub'] as Map<String, dynamic>),
      isApplied: json['isApplied'] as bool? ?? false,
      cancellationPolicy: json['cancellationPolicy'] == null
          ? null
          : CancellationPolicy.fromJson(
              json['cancellationPolicy'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool? ?? false,
      isPaused: json['isPaused'] as bool? ?? true,
      expensiveRating: (json['expensiveRating'] as num?)?.toInt() ?? 0,
      categories: (json['category'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventActivities: (json['eventActivities'] as List<dynamic>?)
              ?.map((e) => EventActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventTicketCategories: (json['eventTicketCategories'] as List<dynamic>?)
              ?.map((e) =>
                  EventTicketCategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      coverChargeEnabled: json['coverChargeEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$EventDtoImplToJson(_$EventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.name,
      'coverImageUrl': instance.coverImage,
      'description': instance.description,
      'vicinity': instance.vicinity,
      'distance': instance.distance,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'priceRangeStart': instance.priceRangeStart,
      'priceRangeEnd': instance.priceRangeEnd,
      'lsd': instance.lsd,
      'ambience': instance.ambience,
      'foodAndBeverages': instance.foodAndBeverages,
      'termsAndConditions': instance.termsAndConditions,
      'faqs': instance.faqs,
      'isPaid': instance.isPaid,
      'totalCapacity': instance.totalCapacity,
      'bookedSeats': instance.bookedSeats,
      'eventStatus': instance.eventStatus,
      'assets': instance.assets,
      'artists': instance.artists,
      'eventRules': instance.eventRules,
      'address': instance.address,
      'pub': instance.pub,
      'isApplied': instance.isApplied,
      'cancellationPolicy': instance.cancellationPolicy,
      'isLiked': instance.isLiked,
      'isPaused': instance.isPaused,
      'expensiveRating': instance.expensiveRating,
      'category': instance.categories,
      'eventActivities': instance.eventActivities,
      'eventTicketCategories': instance.eventTicketCategories,
      'coverChargeEnabled': instance.coverChargeEnabled,
    };
