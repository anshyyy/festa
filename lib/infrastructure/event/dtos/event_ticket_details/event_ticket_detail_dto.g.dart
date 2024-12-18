// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_ticket_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTicketDetailDtoImpl _$$EventTicketDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventTicketDetailDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      bookedSeats: (json['bookedSeats'] as num?)?.toInt() ?? 0,
      totalCapacity: (json['totalCapacity'] as num?)?.toInt() ?? 0,
      category: json['category'] as String? ?? '',
      currentTicketsCount: (json['currentTicketsCount'] as num?)?.toInt() ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      coverCharge: json['coverCharge'] as num? ?? 0,
      priceCurrency: json['priceCurrency'] as String? ?? '',
      maxTicketsToBook: (json['maxTicketsToBook'] as num?)?.toInt() ?? 0,
      noOfTickets: (json['noOfTickets'] as num?)?.toInt() ?? 0,
      coverChargeEnabled: json['coverChargeEnabled'] as bool? ?? false,
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
      'category': instance.category,
      'currentTicketsCount': instance.currentTicketsCount,
      'isPaid': instance.isPaid,
      'coverCharge': instance.coverCharge,
      'priceCurrency': instance.priceCurrency,
      'maxTicketsToBook': instance.maxTicketsToBook,
      'noOfTickets': instance.noOfTickets,
      'coverChargeEnabled': instance.coverChargeEnabled,
    };
