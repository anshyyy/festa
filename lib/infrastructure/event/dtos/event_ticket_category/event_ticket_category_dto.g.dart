// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_ticket_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTicketCategoryDtoImpl _$$EventTicketCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventTicketCategoryDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      bookedSeats: (json['bookedSeats'] as num?)?.toInt() ?? 0,
      totalCapacity: (json['totalCapacity'] as num?)?.toInt() ?? 0,
      currentTicketsCount: (json['currentTicketsCount'] as num?)?.toInt() ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      priceCurrency: json['priceCurrency'] as String? ?? '',
      maxTicketsToBook: (json['maxTicketsToBook'] as num?)?.toInt() ?? 0,
      bookedByMe: (json['bookedByMe'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EventTicketCategoryDtoImplToJson(
        _$EventTicketCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'bookedSeats': instance.bookedSeats,
      'totalCapacity': instance.totalCapacity,
      'currentTicketsCount': instance.currentTicketsCount,
      'isPaid': instance.isPaid,
      'priceCurrency': instance.priceCurrency,
      'maxTicketsToBook': instance.maxTicketsToBook,
      'bookedByMe': instance.bookedByMe,
    };
