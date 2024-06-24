// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_ticket_category_dto.freezed.dart';
part 'event_ticket_category_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class EventTicketCategoryDto with _$EventTicketCategoryDto {
  const factory EventTicketCategoryDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(name: 'totalCapacity', defaultValue: 0) required int totalCapacity,
    @JsonKey(defaultValue: 0) required int currentTicketsCount,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name: 'priceCurrency', defaultValue: '')
    required String priceCurrency,
    @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
    required int maxTicketsToBook,
  }) = _EventTicketCategoryDto;

  factory EventTicketCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$EventTicketCategoryDtoFromJson(json);
}
