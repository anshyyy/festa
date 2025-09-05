// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTicketDtoImpl _$$EventTicketDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventTicketDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      totalCapacity: (json['totalCapacity'] as num?)?.toInt() ?? 0,
      bookedSeats: (json['bookedSeats'] as num?)?.toInt() ?? 0,
      currentTicketsCount: (json['currentTicketsCount'] as num?)?.toInt() ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      priceCurrency: json['priceCurrency'] as String? ?? '',
      coverCharge: (json['coverCharge'] as num?)?.toDouble() ?? 0,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      maxTicketsToBook: (json['maxTicketsToBook'] as num?)?.toInt() ?? 0,
      category: json['category'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      bookedByMe: (json['bookedByMe'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EventTicketDtoImplToJson(
        _$EventTicketDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'totalCapacity': instance.totalCapacity,
      'bookedSeats': instance.bookedSeats,
      'currentTicketsCount': instance.currentTicketsCount,
      'isPaid': instance.isPaid,
      'priceCurrency': instance.priceCurrency,
      'coverCharge': instance.coverCharge,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'maxTicketsToBook': instance.maxTicketsToBook,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bookedByMe': instance.bookedByMe,
    };
