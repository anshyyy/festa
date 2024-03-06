import 'package:flutter/material.dart';

import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/user/dtos/personalization_menu/personalization_menu_dto.dart';
import '../../../infrastructure/user/dtos/settings_menu/settings_menu_dto.dart';
import '../services/navigation_services/routers/route_name.dart';
import 'asset_constants.dart';
import 'string_constants.dart';

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

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFF1759), Color(0xffBF0036)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static List<SettingsMenuDto> settingsMenu = [
    SettingsMenuDto(
      icon: AssetConstants.accountSettings,
      title: ProfileAndSettingsScreenConstants.accountSettings,
      navigationRoute: UserRoutes.accountSettingsRoute,
    ),
    SettingsMenuDto(
      icon: AssetConstants.notificationSettings,
      title: ProfileAndSettingsScreenConstants.notifications,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.activitiesSettings,
      title: ProfileAndSettingsScreenConstants.yourActivities,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.privacySettings,
      title: ProfileAndSettingsScreenConstants.privacy,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.blockedSettings,
      title: ProfileAndSettingsScreenConstants.blockedUsers,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.heartSettings,
      title: ProfileAndSettingsScreenConstants.tellAFriend,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.helpSettings,
      title: ProfileAndSettingsScreenConstants.help,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.feedbackSettings,
      title: ProfileAndSettingsScreenConstants.feedback,
      navigationRoute: '',

    ),
    SettingsMenuDto(
      icon: AssetConstants.starSettings,
      title: ProfileAndSettingsScreenConstants.rateInPlayStore,
      navigationRoute: '',

    ),
  ];

  static const List<PersonalizationMenuDto> personalizationMenuList = [
    PersonalizationMenuDto(
        icon: AssetConstants.genderIcon,
        title: 'Gender',
        description: 'Who can see your gender'),
    PersonalizationMenuDto(
        icon: AssetConstants.partiesIcon,
        title: 'Parties',
        description: 'Parties I would like to go...'),
    PersonalizationMenuDto(
        icon: AssetConstants.musicIcon,
        title: 'Music',
        description: 'Genres I listen to...'),
    PersonalizationMenuDto(
        icon: AssetConstants.crowdIcon,
        title: 'Crowd',
        description: 'Crowd I like to hangout with...'),
    PersonalizationMenuDto(
        icon: AssetConstants.cuisineIcon,
        title: 'Cuisine',
        description: 'My favourite food...'),
    PersonalizationMenuDto(
        icon: AssetConstants.drinkPersonalizeIcon,
        title: 'Drink',
        description: 'My favourite drink type...'),
  ];
}
