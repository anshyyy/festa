// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_ticket_category_dto.freezed.dart';
part 'event_ticket_category_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class EventTicketCategory with _$EventTicketCategory {
  const factory EventTicketCategory({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name: 'priceCurrency', defaultValue: '')
    required String priceCurrency,
    @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
    required int maxTicketsToBook,
  }) = _EventTicketCategory;

  factory EventTicketCategory.fromJson(Map<String, dynamic> json) =>
      _$EventTicketCategoryFromJson(json);
}
