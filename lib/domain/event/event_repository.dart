import 'package:dartz/dartz.dart';

import '../../infrastructure/event/dtos/payment_status/payment_status_dto.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/dtos/event_booking_details/event_booking_details_dto.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';

abstract class EventRepository {
  Future<List<FilterDto>> getFilter();
  Future<List<EventDto>> getEvents(
      {required int page,
      required int limit,
      required double lat,
      required double long,
      int? range,
      String? sort,
      String? otherFilters});

  Future<Either<dynamic, EventDto>> getEventDetails({required int eventId});
  void likeUnlikeEvent({required int eventId, required bool isLiked});

  Future<Either<dynamic, EventBookingDetailsDto>> createBooking({
    required int eventId,
    required List<Map<String, dynamic>> tickets,
  });

  Future<PaymentStatusDto> fetchPaymentStatusById({required int bookingId});
}
