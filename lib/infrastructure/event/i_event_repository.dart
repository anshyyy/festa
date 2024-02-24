import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/event/event_repository.dart';
import 'dtos/event/event_dto.dart';
import 'dtos/filter/filter_dto.dart';

class IEventRepository extends EventRepository {
  final String serverUrl;
  IEventRepository({required this.serverUrl});

  @override
  Future<List<FilterDto>> getFilter() async {
    try {
      final url = '$serverUrl${EventApiConstants.GET_FILTERS}';
      final response = await RESTService.performGETRequest(httpUrl: url);
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
      String? otherFilters}) async {
    try {
      final url = '$serverUrl${EventApiConstants.EVENTS}';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'lat': lat.toString(),
        'long': long.toString(),
      };
      if (sort != null) {
        param['sort'] = sort;
      }
      if (range != null) {
        param['range'] = range.toString();
      }
      if (otherFilters != null) {
        param['filter'] = otherFilters;
      }
      final response =
          await RESTService.performGETRequest(httpUrl: url, param: param);
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
    final response = await RESTService.performGETRequest(httpUrl: url);
    if (response.statusCode != 200) {
      return left(null);
    }
    final body = response.body;
    final eventRaw = jsonDecode(body);

    return right(EventDto.fromJson(eventRaw));
    } catch (e) {
      return left(null);
    }
  }
}
