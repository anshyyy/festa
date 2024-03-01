import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/location/location_repository.dart';
import 'dtos/suggestion/suggestion_dto.dart';

class ILocationRepository extends LocationRepository {
  final String mapsApiKey;

  ILocationRepository({required this.mapsApiKey});

  @override
  Future<List<SuggestionDto>> getLocationSuggestions(
      {required String query}) async {
    try {
      const url = LocationApiConstants.PLACE_AUTOCOMPLETE;

      final Map<String, String> param = {
        'input': query,
        'key': mapsApiKey,
      };

      final response =
          await RESTService.performGETRequest(httpUrl: url, param: param);
      if (response.statusCode != 200) {
        return [];
      }
      final body = response.body;
      final predictionsRaw = jsonDecode(body) as Map;
      final predictions = predictionsRaw['predictions'];

      List<SuggestionDto> resPreds = [];
      predictions.forEach((pred) {
        Map<String, dynamic> data = {
          ...pred,
          'main_text': pred['structured_formatting']['main_text'] ?? '',
        };
        resPreds.add(SuggestionDto.fromJson(data));
      });
      return resPreds;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Either<dynamic,Map<String,dynamic>>> getLocationDetails({required String placeId}) async {
    try {
      const url = LocationApiConstants.PLACE_DETAILS;
      final Map<String, String> param = {
        'place_id': placeId,
        'fields':'geometry',
        'key': mapsApiKey,
      };
      final response =
          await RESTService.performGETRequest(httpUrl: url, param: param);
      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      final responseRaw = jsonDecode(body) as Map;
      final gemoetry = responseRaw['result']['geometry'];
      Map<String,dynamic> location = gemoetry['location'];
      return right(location);
    } catch (e) {
      return left(null);
    }
  }
}
