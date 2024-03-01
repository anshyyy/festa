import 'package:dartz/dartz.dart';

import '../../infrastructure/location/dtos/suggestion/suggestion_dto.dart';

abstract class LocationRepository {
    Future<List<SuggestionDto>> getLocationSuggestions({required String query});
    Future<Either<dynamic, Map<String,dynamic>>> getLocationDetails({required String placeId});

}
