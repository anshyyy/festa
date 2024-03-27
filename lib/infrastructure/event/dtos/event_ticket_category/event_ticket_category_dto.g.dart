// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_ticket_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTicketCategoryImpl _$$EventTicketCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$EventTicketCategoryImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      bookedSeats: json['bookedSeats'] as int? ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      priceCurrency: json['priceCurrency'] as String? ?? '',
      maxTicketsToBook: json['maxTicketsToBook'] as int? ?? 0,
    );

Map<String, dynamic> _$$EventTicketCategoryImplToJson(
        _$EventTicketCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'bookedSeats': instance.bookedSeats,
      'isPaid': instance.isPaid,
      'priceCurrency': instance.priceCurrency,
      'maxTicketsToBook': instance.maxTicketsToBook,
    };
