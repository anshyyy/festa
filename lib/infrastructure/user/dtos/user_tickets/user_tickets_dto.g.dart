// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tickets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTicketsDtoImpl _$$UserTicketsDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserTicketsDtoImpl(
      bookedTicketsHistory: (json['history'] as List<dynamic>)
          .map(
              (e) => BookedTicketDetailsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcomingTickets: (json['upcoming'] as List<dynamic>)
          .map(
              (e) => BookedTicketDetailsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserTicketsDtoImplToJson(
        _$UserTicketsDtoImpl instance) =>
    <String, dynamic>{
      'history': instance.bookedTicketsHistory,
      'upcoming': instance.upcomingTickets,
    };
