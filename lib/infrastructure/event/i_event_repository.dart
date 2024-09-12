import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/event/event_repository.dart';
import '../core/dtos/cover/cover_charge_details.dart';
import 'dtos/coupon/coupon_dto.dart';
import 'dtos/cover_balance_history/cover_balance_history_dto.dart';
import 'dtos/event/event_dto.dart';
import 'dtos/event_booking_details/event_booking_details_dto.dart';
import 'dtos/filter/filter_dto.dart';
import 'dtos/payment_status/payment_status_dto.dart';

class IEventRepository extends EventRepository {
  final String serverUrl;
  IEventRepository({required this.serverUrl});

  @override
  Future<CouponDTO> validateCoupon(
      {required String couponCode, required int eventId}) async {
    try {
      final url = '$serverUrl${BookingApiConstants.COUPON}/$couponCode';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performPOSTRequest(
          httpUrl: url,
          token: token!,
          isAuth: true,
          param: {'eventId': eventId.toString()});

      if (response.statusCode != 201) {
        throw ErrorConstants.unknownNetworkError;
      }

      var body = jsonDecode(response.body);
      CouponDTO coupon = CouponDTO.fromJson(body);
      return coupon;
    } catch (e) {
      var r = e as Response;
      (r.body);
      rethrow;
    }
  }

  @override
  Future<double> fetchCoverBalance({required int bookingId}) async {
    try {
      final url = '$serverUrl${BookingApiConstants.COVER_CHARGE}/$bookingId';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final parsedBody = jsonDecode(response.body);
      return parsedBody['remainingAmount'].toDouble();
    } catch (e) {
      (e);
      rethrow;
    }
  }

  @override
  Future<Either<dynamic, List<CoverBalanceHistoryDto>>> getCoverBalanceHistory(
      {required int bookingId}) async {
    try {
      final url =
          '$serverUrl${BookingApiConstants.COVER_CHARGE}/$bookingId/history';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final parsedBody = jsonDecode(response.body);
      List<CoverBalanceHistoryDto> covers = (parsedBody as List).map((c) {
        return CoverBalanceHistoryDto.fromJson(c);
      }).toList();
      return right(covers);
    } catch (e) {
      (e);
      return left(null);
    }
  }

  @override
  Future<List<FilterDto>> getFilter() async {
    try {
      final url = '$serverUrl${EventApiConstants.GET_FILTERS}';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final parsedBody = jsonDecode(response.body);
      //(parsedBody);
      //TODO
      List<FilterDto> filters = (parsedBody as List).map((e) {
        final filter = FilterDto.fromJson(e);
        return filter;
      }).toList();
      return filters;
    } catch (error) {
      return [];
    }
  }

  @override
  Future<List<EventDto>> getEvents(
      {required int page,
      required int limit,
      required double lat,
      required double long,
      int? range,
      String? sort,
      String search = '',
      String? otherFilters}) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final url = '$serverUrl${EventApiConstants.EVENTS}';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'lat': lat.toString(),
        'long': long.toString(),
      };
      if (search.isNotEmpty) {
        param['search'] = search;
      }
      if (sort != null) {
        param['sort'] = sort;
      }
      if (range != null) {
        param['range'] = range.toString();
      }
      if (otherFilters != null) {
        param['filter'] = otherFilters;
      }
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return [];
      }
      final body = response.body;
      final eventsRaw = jsonDecode(body) as List;
      (eventsRaw);

      final events = eventsRaw.map((e) => EventDto.fromJson(e)).toList();
      ('serialized $events');
      return events;
    } catch (error) {
      var e = error as Response;

      ('this is error : ${e.body}');
      return [];
    }
  }

  @override
  Future<Either<dynamic, EventDto>> getEventDetails({
    required int eventId,
  }) async {
    try {
      final url = '$serverUrl${EventApiConstants.EVENTS}/$eventId';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);

      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      final eventRaw = jsonDecode(body);
      final eventDetails = EventDto.fromJson(eventRaw);
      return right(eventDetails);
    } catch (e) {
      return left(null);
    }
  }

  @override
  void likeUnlikeEvent({required int eventId, required bool isLiked}) async {
    final url = isLiked
        ? '$serverUrl${EventApiConstants.UNLIKE_EVENT}/$eventId'
        : '$serverUrl${EventApiConstants.LIKE_EVENT}/$eventId';
    String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    await RESTService.performPOSTRequest(
        httpUrl: url, token: token!, isAuth: true);
  }

  @override
  Future<CoverChargeDetails> addCoverBalance({
    required int bookingId,
    required int coverAmount,
    required String note,
  }) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final url = '$serverUrl${BookingApiConstants.COVER_CHARGE}/$bookingId';

      final bodyObj = {
        'note': note,
        'coverAmount': coverAmount,
      };
      (jsonEncode(bodyObj));

      final response = await RESTService.performPOSTRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
        body: jsonEncode(bodyObj),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return const CoverChargeDetails(
            id: 0, razorpayId: '', transactionId: '', bookingId: -1);
      }
      final body = response.body;
      final coverDetailsRaw = jsonDecode(body);
      (coverDetailsRaw);
      CoverChargeDetails coverChargeDetails =
          CoverChargeDetails.fromJson(coverDetailsRaw);
      return coverChargeDetails;
    } catch (e) {
      (e);
      return CoverChargeDetails(
          id: 0, razorpayId: '', transactionId: '', bookingId: -1);
    }
  }

  @override
  Future<Either<dynamic, EventBookingDetailsDto>> createBooking(
      {required int eventId,
      required List<Map<String, dynamic>> tickets,
      CouponDTO? coupon,
      String? couponCode}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final url = '$serverUrl${BookingApiConstants.BOOKING_CREATE}';

      final bodyObj = {
        'eventId': eventId,
        'tickets': tickets,
        'coupon': coupon?.toJson(),
        'couponCode': couponCode
      };

      final response = await RESTService.performPOSTRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
        body: jsonEncode(bodyObj),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return left(null);
      }
      final body = response.body;
      final bookingDetailsRaw = jsonDecode(body);
      final bookingDetails = EventBookingDetailsDto.fromJson(bookingDetailsRaw);
      return right(bookingDetails);
    } catch (e) {
      var r = e as Response;
      (r.body);
      return left(null);
    }
  }

  @override
  Future<PaymentStatusDto> fetchPaymentStatusById(
      {required int bookingId}) async {
    try {
      final url = '$serverUrl${BookingApiConstants.BOOKING_STATUS}/$bookingId';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);

      if (response.statusCode != 200) {
        return const PaymentStatusDto(isDone: false, reason: '');
      }
      final body = response.body;
      final paymentStatusRaw = jsonDecode(body);
      final paymentStatus = PaymentStatusDto.fromJson(paymentStatusRaw);
      return paymentStatus;
    } catch (e) {
      return const PaymentStatusDto(isDone: false, reason: '');
    }
  }
    @override
  Future<PaymentStatusDto> fetchPaymentStatusByIdForCover(
      {required int bookingId, required int coverId}) async {
    try {
      final url = '$serverUrl${BookingApiConstants.BOOKING_STATUS}/$bookingId/cover/$coverId';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true);

      if (response.statusCode != 200) {
        return const PaymentStatusDto(isDone: false, reason: '');
      }
      final body = response.body;
      final paymentStatusRaw = jsonDecode(body);
      final paymentStatus = PaymentStatusDto.fromJson(paymentStatusRaw);
      return paymentStatus;
    } catch (e) {
      return const PaymentStatusDto(isDone: false, reason: '');
    }
  }
}
