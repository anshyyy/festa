import 'dart:convert';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/event/event_repository.dart';
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
}
