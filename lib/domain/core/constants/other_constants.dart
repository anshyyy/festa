import 'package:flutter/material.dart';

import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/user/dtos/settings_menu/settings_menu_dto.dart';
import '../services/navigation_services/routers/route_name.dart';
import 'asset_constants.dart';
import 'string_constants.dart';

class OtherConstants {
  static const int limit = 10;
  static const String termsOfService = 'https://dadlabs.in/terms-of-use';
  static const String privacyPolicy = 'https://dadlabs.in/privacy-policy';
  static const LocationDto defaultLocation = 
  
  
  
  
  LocationDto(
    latitude: 12.9715987,
    longitude: 77.5945627,
    area: 'Bangalore',
    city: 'Bangalore',
    state: 'Karnataka',
    country: 'India',
    icon: AssetConstants.bangloreIcon,
  );

  static const LocationDto mumbai = LocationDto(
    latitude: 19.0524,
    longitude: 72.8216,
    area: 'Mumbai',
    city: 'Mumbai',
    state: 'Maharashtra',
    country: 'India',
    icon: AssetConstants.mumbaiIcon,
  );
  static const LocationDto delhi = LocationDto(
    latitude: 28.6818,
    longitude: 77.2290,
    area: 'Delhi',
    city: 'Delhi',
    state: 'Delhi',
    country: 'India',
    icon: AssetConstants.delhiIcon,
  );
  static const LocationDto hyderabad = LocationDto(
    latitude: 17.40636,
    longitude: 78.46875,
    area: 'Hyderabad',
    city: 'Hyderabad',
    state: 'Hyderabad',
    country: 'India',
    icon: AssetConstants.hyderabadIcon,
  );

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFF1759), Color(0xffBF0036)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static List<SettingsMenuDto> settingsMenu = [
     SettingsMenuDto(
      icon: AssetConstants.accountSettings,
      title: ProfileAndSettingsScreenConstants.personalizeYourExperience,
      navigationRoute: UserRoutes.personalizeExperienceRoute,
    ),
     SettingsMenuDto(
      icon: AssetConstants.notificationSettings,
      title: ProfileAndSettingsScreenConstants.rewardsFromFriends,
      navigationRoute: UserRoutes.friendRewardsScreen,
    ),
    SettingsMenuDto(
      icon: AssetConstants.graphIcon,
      title: ProfileAndSettingsScreenConstants.accountSettings,
      navigationRoute: UserRoutes.accountSettingsRoute,
    ),
     SettingsMenuDto(
      icon: AssetConstants.blockIcon,
      title: ProfileAndSettingsScreenConstants.blockedAccount,
      navigationRoute:   UserRoutes.unblockAccountScreenRoute,
    ),
  ];

  static String defaultImage = 'https://images.unsplash.com/photo-1527467779599-34448b3fa6a7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  static String profileImage = 'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg';
}
