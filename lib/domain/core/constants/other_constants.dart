import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/core/dtos/menu/menu_dto.dart';
import 'asset_constants.dart';

class OtherConstants {
  static const int limit = 10;
  static const String termsOfService = 'https://dadlabs.in/terms-of-use';
  static const String privacyPolicy = 'https://dadlabs.in/privacy-policy';
  static const LocationDto defaultLocation = LocationDto(
    latitude: 12.9784,
    longitude: 77.6408,
    area: 'Indira Nagar',
    city: 'Bangalore',
    state: 'Karnataka',
    country: 'India',
    icon: AssetConstants.bangloreIcon,
  );

  static const LocationDto mumbai = LocationDto(
    latitude: 19.0524,
    longitude: 72.8216,
    area: 'Bandra Bandstand',
    city: 'Mumbai',
    state: 'Maharashtra',
    country: 'India',
    icon: AssetConstants.mumbaiIcon,
  );
  static const LocationDto delhi = LocationDto(
    latitude: 28.6818,
    longitude: 77.2290,
    area: 'Central Delhi',
    city: 'Delhi',
    state: 'Delhi',
    country: 'India',
    icon: AssetConstants.delhiIcon,
  );
  static const LocationDto hyderabad = LocationDto(
    latitude: 28.6818,
    longitude: 77.2290,
    area: 'Central Hyderabad',
    city: 'Hyderabad',
    state: 'Hyderabad',
    country: 'India',
    icon: AssetConstants.hyderabadIcon,
  );

  static const MenuDto home = MenuDto(
    id: 1,
    icon: AssetConstants.homeFilled,
  );

  static const MenuDto community = MenuDto(
    id: 2,
    icon: AssetConstants.communityIcon,
  );
  
  static const MenuDto tickets = MenuDto(
    id: 3,
    icon: AssetConstants.ticketsIcon,
  );
  
}
