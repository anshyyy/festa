import 'package:dartz/dartz.dart';

import '../../infrastructure/core/dtos/cover/cover_charge_details.dart';
import '../../infrastructure/event/dtos/coupon/coupon_dto.dart';
import '../../infrastructure/event/dtos/cover_balance_history/cover_balance_history_dto.dart';
import '../../infrastructure/event/dtos/event_cordinates/event_cordinates.dart';
import '../../infrastructure/event/dtos/payment_status/payment_status_dto.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/dtos/event_booking_details/event_booking_details_dto.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../infrastructure/event/dtos/ticket/ticket_dto.dart';

abstract class EventRepository {
  Future<List<FilterDto>> getFilter();
  Future<TicketDto> getTickets({required int eventId});

  Future<List<EventCordinates>> getAllEventsCoordinate();
  Future<List<EventDto>> getEvents(
      {required int page,
      required int limit,
      required double lat,
      required double long,
      int? range,
      String? sort,
      String search = '',
      String? otherFilters});

  Future<Either<dynamic, EventDto>> getEventDetails({required int eventId});
  void likeUnlikeEvent({required int eventId, required bool isLiked});

  Future<Either<dynamic, EventBookingDetailsDto>> createBooking({
    required int eventId,
    required List<Map<String, dynamic>> tickets,
    CouponDTO? coupon,
    String? couponCode
  }
  );

  Future<Either<dynamic, List<CoverBalanceHistoryDto>>> getCoverBalanceHistory({required int bookingId});

  Future<PaymentStatusDto> fetchPaymentStatusById({required int bookingId});
   Future<PaymentStatusDto> fetchPaymentStatusByIdForCover({required int bookingId,required int coverId});
  Future<double> fetchCoverBalance({required int bookingId});
  Future<CouponDTO> validateCoupon({required String couponCode, required int eventId});
  Future<CoverChargeDetails> addCoverBalance({required String note,required int coverAmount,required int bookingId});
}
