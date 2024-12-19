import 'package:hive/hive.dart';

import '../../../../infrastructure/core/dtos/location/location_dto.dart';

class LocationStorageService {
  static const String _boxName = 'locationBox';
  static const String _locationKey = 'currentLocation';

   Future<void> saveLocation(LocationDto location) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_locationKey, location.toJson());
  }

   Future<void> deleteLocation() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_locationKey);
  }

   Future<LocationDto?> getLocation() async {
    final box = await Hive.openBox(_boxName);
    final locationJson = box.get(_locationKey);
    if (locationJson != null) {
      return LocationDto.fromJson(Map<String, dynamic>.from(locationJson));
    }
    return null;
  }
}
