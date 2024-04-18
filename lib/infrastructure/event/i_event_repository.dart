import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/event/event_repository.dart';
import 'dtos/event/event_dto.dart';
import 'dtos/event_booking_details/event_booking_details_dto.dart';
import 'dtos/filter/filter_dto.dart';
import 'dtos/payment_status/payment_status_dto.dart';

class IEventRepository extends EventRepository {
  final String serverUrl;
  IEventRepository({required this.serverUrl});

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
      final events = eventsRaw.map((e) => EventDto.fromJson(e)).toList();
      return events;
    } catch (error) {
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
  Future<Either<dynamic, EventBookingDetailsDto>> createBooking(
      {required int eventId,
      required List<Map<String, dynamic>> tickets}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${BookingApiConstants.BOOKING_CREATE}';

      final bodyObj = {
        'eventId': eventId,
        'tickets': tickets,
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
      print(body);
      final paymentStatusRaw = jsonDecode(body);
      final paymentStatus = PaymentStatusDto.fromJson(paymentStatusRaw);
      return paymentStatus;
    } catch (e) {
      return const PaymentStatusDto(isDone: false, reason: '');
    }
  }
}
