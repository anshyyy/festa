// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../event/event_dto.dart';
import '../event_ticket_details/event_ticket_detail_dto.dart';
part 'booked_ticket_details_dto.freezed.dart';
part 'booked_ticket_details_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BookedTicketDetailsDto with _$BookedTicketDetailsDto {
  const factory BookedTicketDetailsDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'numberOfTickets', defaultValue: 0)
    required int numberOfTickets,
    
    @JsonKey(name: 'remainingAmount', defaultValue: 0)
    required double remainingAmount,
    @JsonKey(name: 'ticketDetails', defaultValue: [])
    required List<EventTicketDetailDto> eventTicketDetails,
    @JsonKey(name: 'event') required EventDto eventDetails,
    @JsonKey(name: 'paymentMethod', defaultValue: '')
    required String paymentMethod,
    @JsonKey(name: 'transactionId', defaultValue: '')
    required String transactionId,
    @JsonKey(name: 'bookingReference', defaultValue: '')
    required String bookingReference,
    @JsonKey(name: 'paymentAmount', defaultValue: '')
    required String paymentAmount,
    @JsonKey(defaultValue: false) required bool showTicketDetails,
  }) = _BookedTicketDetailsDto;

  factory BookedTicketDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$BookedTicketDetailsDtoFromJson(json);
}
