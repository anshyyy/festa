// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_ticket_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTicketDetailDtoImpl _$$EventTicketDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventTicketDetailDtoImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      bookedSeats: json['bookedSeats'] as int? ?? 0,
      totalCapacity: json['totalCapacity'] as int? ?? 0,
      currentTicketsCount: json['currentTicketsCount'] as int? ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      priceCurrency: json['priceCurrency'] as String? ?? '',
      maxTicketsToBook: json['maxTicketsToBook'] as int? ?? 0,
      noOfTickets: json['noOfTickets'] as int? ?? 0,
    );

Map<String, dynamic> _$$EventTicketDetailDtoImplToJson(
        _$EventTicketDetailDtoImpl instance) =>
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
      'noOfTickets': instance.noOfTickets,
    };
