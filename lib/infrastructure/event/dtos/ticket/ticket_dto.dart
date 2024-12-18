import 'package:freezed_annotation/freezed_annotation.dart';

import '../event_ticket/event_ticket.dart';
import '../event_ticket_category/event_ticket_category_dto.dart';

part 'ticket_dto.freezed.dart';
part 'ticket_dto.g.dart';

@freezed
class TicketDto with _$TicketDto {
  factory TicketDto(
    @JsonKey(name: "ENTRY", defaultValue: [])
    List<EventTicketDto> entryTickets,
    @JsonKey(name: "ENTRY_COVER", defaultValue: [])
    List<EventTicketDto> entryCoverTickets,
    @JsonKey(name: "COVER", defaultValue: [])
    List<EventTicketDto> coverTickets,
  ) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}
