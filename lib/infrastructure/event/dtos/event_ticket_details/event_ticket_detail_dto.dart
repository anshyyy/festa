// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
part 'event_ticket_detail_dto.freezed.dart';
part 'event_ticket_detail_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class EventTicketDetailDto with _$EventTicketDetailDto {
  const factory EventTicketDetailDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(name: 'totalCapacity', defaultValue: 0) required int totalCapacity,
    @JsonKey(name: 'category',defaultValue: '') required String category,
    @JsonKey(defaultValue: 0) required int currentTicketsCount,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name:'coverCharge',defaultValue: 0) required num coverCharge,
    @JsonKey(name: 'priceCurrency', defaultValue: '')
    required String priceCurrency,
    @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
    required int maxTicketsToBook,
    @JsonKey(name: 'noOfTickets', defaultValue: 0) required int noOfTickets,
    @JsonKey(name:'coverChargeEnabled',defaultValue: false) required bool coverChargeEnabled
  }) = _EventTicketDetailDto;

  factory EventTicketDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EventTicketDetailDtoFromJson(json);
}
