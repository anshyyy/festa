// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../coupon/coupon_dto.dart';
import '../event/event_dto.dart';
import '../event_ticket_details/event_ticket_detail_dto.dart';
part 'event_booking_details_dto.freezed.dart';
part 'event_booking_details_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class EventBookingDetailsDto with _$EventBookingDetailsDto {
  const factory EventBookingDetailsDto({
    @JsonKey(name: 'numberOfTickets', defaultValue: 0)
    required int numberOfTickets,
    @JsonKey(name: 'ticketDetails', defaultValue: [])
    required List<EventTicketDetailDto> eventTicketDetails,
    @JsonKey(name: 'event') required EventDto eventDetails,
    @JsonKey(name: 'paymentMethod') dynamic paymentMethod,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'id', defaultValue: 0)
    required int bookingId,
    @JsonKey(name: 'razorpayOrderId', defaultValue: null)
    String? razorpayOrderId,
    @JsonKey(name:'coupon',defaultValue: null)
    CouponDTO? coupon,
  }) = _EventBookingDetailsDto;

  factory EventBookingDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$EventBookingDetailsDtoFromJson(json);
}
