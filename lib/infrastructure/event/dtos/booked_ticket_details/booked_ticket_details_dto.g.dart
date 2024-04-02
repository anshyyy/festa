// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_ticket_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookedTicketDetailsDtoImpl _$$BookedTicketDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BookedTicketDetailsDtoImpl(
      id: json['id'] as int? ?? 0,
      numberOfTickets: json['numberOfTickets'] as int? ?? 0,
      eventTicketDetails: (json['ticketDetails'] as List<dynamic>?)
              ?.map((e) =>
                  EventTicketDetailDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventDetails: EventDto.fromJson(json['event'] as Map<String, dynamic>),
      paymentMethod: json['paymentMethod'] as String? ?? '',
      transactionId: json['transactionId'] as String? ?? '',
      bookingReference: json['bookingReference'] as String? ?? '',
      paymentAmount: json['paymentAmount'] as String? ?? '',
      showTicketDetails: json['showTicketDetails'] as bool? ?? false,
    );

Map<String, dynamic> _$$BookedTicketDetailsDtoImplToJson(
        _$BookedTicketDetailsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numberOfTickets': instance.numberOfTickets,
      'ticketDetails': instance.eventTicketDetails,
      'event': instance.eventDetails,
      'paymentMethod': instance.paymentMethod,
      'transactionId': instance.transactionId,
      'bookingReference': instance.bookingReference,
      'paymentAmount': instance.paymentAmount,
      'showTicketDetails': instance.showTicketDetails,
    };
