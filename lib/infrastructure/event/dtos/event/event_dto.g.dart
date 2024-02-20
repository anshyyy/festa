// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDtoImpl _$$EventDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
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
              ?.map((e) => BulletDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      faqs: (json['faqs'] as List<dynamic>?)
              ?.map((e) => FAQDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isPaid: json['isPaid'] as bool? ?? false,
      totalCapacity: json['totalCapacity'] as int? ?? 0,
      bookedSeats: json['bookedSeats'] as int? ?? 0,
      eventStatus: json['eventStatus'] as String? ?? 'ACTIVE',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      address: json['address'] == null
          ? null
          : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      isApplied: json['isApplied'] as bool? ?? false,
    );

Map<String, dynamic> _$$EventDtoImplToJson(_$EventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'coverImageUrl': instance.coverImageUrl,
      'description': instance.description,
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
      'address': instance.address,
      'isApplied': instance.isApplied,
    };
