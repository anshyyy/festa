// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_booking_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventBookingDetailsDtoImpl _$$EventBookingDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EventBookingDetailsDtoImpl(
      numberOfTickets: json['numberOfTickets'] as int? ?? 0,
      eventTicketDetails: (json['ticketDetails'] as List<dynamic>?)
              ?.map((e) =>
                  EventTicketDetailDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventDetails: EventDto.fromJson(json['event'] as Map<String, dynamic>),
      status: json['status'] as String? ?? '',
      bookingId: json['id'] as int? ?? 0,
      razorpayOrderId: json['razorpayOrderId'] as String?,
    );

Map<String, dynamic> _$$EventBookingDetailsDtoImplToJson(
        _$EventBookingDetailsDtoImpl instance) =>
    <String, dynamic>{
      'numberOfTickets': instance.numberOfTickets,
      'ticketDetails': instance.eventTicketDetails,
      'event': instance.eventDetails,
      'status': instance.status,
      'id': instance.bookingId,
      'razorpayOrderId': instance.razorpayOrderId,
    };
