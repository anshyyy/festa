import 'package:dartz/dartz.dart';

import '../../infrastructure/core/dtos/location/location_dto.dart';
import '../../infrastructure/location/dtos/suggestion/suggestion_dto.dart';

abstract class LocationRepository {
    Future<List<SuggestionDto>> getLocationSuggestions({required String query});
    Future<Either<dynamic, Map<String,dynamic>>> getLocationDetails({required String placeId});
    Future<Either<dynamic, LocationDto>> getLocationByCoordinates({required double lat, required double lng});
}
