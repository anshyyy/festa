
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';

part 'user_tickets_dto.freezed.dart';
part 'user_tickets_dto.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false
)
class UserTicketsDto with _$UserTicketsDto {
  const factory UserTicketsDto({
    @JsonKey(name: 'history',) required List<BookedTicketDetailsDto> bookedTicketsHistory,
    @JsonKey(name: 'upcoming',) required List<BookedTicketDetailsDto> upcomingTickets,
  }) = _UserTicketsDto;

  factory UserTicketsDto.fromJson(Map<String, dynamic> json) =>
      _$UserTicketsDtoFromJson(json);
}
