// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketDtoImpl _$$TicketDtoImplFromJson(Map<String, dynamic> json) =>
    _$TicketDtoImpl(
      (json['ENTRY'] as List<dynamic>?)
              ?.map((e) => EventTicketDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['ENTRY_COVER'] as List<dynamic>?)
              ?.map((e) => EventTicketDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['COVER'] as List<dynamic>?)
              ?.map((e) => EventTicketDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$TicketDtoImplToJson(_$TicketDtoImpl instance) =>
    <String, dynamic>{
      'ENTRY': instance.entryTickets,
      'ENTRY_COVER': instance.entryCoverTickets,
      'COVER': instance.coverTickets,
    };
