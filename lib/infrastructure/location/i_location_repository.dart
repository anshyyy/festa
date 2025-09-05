import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/location/location_repository.dart';
import '../core/dtos/location/location_dto.dart';
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
  
  @override
  Future<Either<dynamic,LocationDto>> getLocationByCoordinates({required double lat, required double lng}) async{
  try {
      const url = LocationApiConstants.LOCATION_BY_COORDINATES;
      final Map<String, String> param = {
        'latlng': '$lat, $lng',
        'key': mapsApiKey,
      };
      final response =
          await RESTService.performGETRequest(httpUrl: url, param: param);
      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      final responseRaw = jsonDecode(body) as Map;

      if (responseRaw['status'] == 'OK') {
          final results = responseRaw['results'] as List<dynamic>;
          if (results.isNotEmpty) {
            final firstResult = results[0];
              final address = firstResult['formatted_address'] ?? '';
              final city = _findAddressComponent(firstResult, 'locality') ;
              final state = _findAddressComponent(firstResult, 'administrative_area_level_1') ;
              final country = _findAddressComponent(firstResult, 'country') ;

              return right(LocationDto(latitude: lat, longitude: lng, area: address, city: city, state: state, country: country,));
          }
        }
      return left(null);
    } catch (e) {
      return left(null);
    }

    
  }

  String _findAddressComponent(Map<String, dynamic> result, String componentType) {
    final List<dynamic> addressComponents = result['address_components'];
    final component = addressComponents.firstWhere(
      (element) => element['types'].contains(componentType),
      orElse: () => null,
    );
    return component != null ? component['long_name'] : '';
  }
}
