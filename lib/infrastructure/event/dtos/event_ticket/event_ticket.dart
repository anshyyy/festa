// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_ticket.freezed.dart';
part 'event_ticket.g.dart';

@freezed
class EventTicketDto with _$EventTicketDto {
  const factory EventTicketDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'totalCapacity', defaultValue: 0) required int totalCapacity,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(defaultValue: 0) required int? currentTicketsCount,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name: 'priceCurrency', defaultValue: '') required String priceCurrency,
    @JsonKey(name: 'coverCharge', defaultValue: 0) required double coverCharge,
    @JsonKey(name: 'startDate', defaultValue: '') required String startDate,
    @JsonKey(name: 'endDate', defaultValue: '') required String endDate,
    @JsonKey(name: 'maxTicketsToBook', defaultValue: 0) required int maxTicketsToBook,
    @JsonKey(name: 'category', defaultValue: '') String? category,
    @JsonKey(name: 'createdAt', defaultValue: '') required String createdAt,
    @JsonKey(name: 'updatedAt', defaultValue: '') required String updatedAt,
    @JsonKey(name: 'bookedByMe', defaultValue: 0) required int bookedByMe,
  }) = _EventTicketDto;

  factory EventTicketDto.fromJson(Map<String, dynamic> json) =>
      _$EventTicketDtoFromJson(json);
}

// Extension for custom logic
extension EventTicketDtoExtensions on EventTicketDto {
  int get safeCurrentTicketsCount => currentTicketsCount ?? 0;
}
