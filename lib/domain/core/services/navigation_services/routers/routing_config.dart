import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../presentation/basic_profile/basic_profile_screen.dart';
import '../../../../../presentation/basic_profile/birthday_selection_screen.dart';
import '../../../../../presentation/basic_profile/gender_selection_screen.dart';
import '../../../../../presentation/common/default_widget.dart';
import '../../../../../presentation/common/network_unavailable_screen.dart';
import '../../../../../presentation/home/home_screen.dart';
import '../../../extensions/string_extension.dart';
import 'route_name.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;

  switch (routingData.route) {
    case UserRoutes.mainNavRoute:
      return _getPageRoute(const HomeScreen(), settings);

    default:
      return commonNavigation(settings);
  }
}

Route<dynamic> commonNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case GeneralRoutes.noNetworkAtStart:
      return _getPageRoute(
          NetworkUnavailableScreen(
            routeName: routingData.route,
            queryParams: routingData.queryParameters,
            arguments: settings.arguments,
            isStartRoute: true,
          ),
          settings);

    case GeneralRoutes.noNetwork:
      return _getPageRoute(
          NetworkUnavailableScreen(
            routeName: routingData.route,
            queryParams: routingData.queryParameters,
            arguments: settings.arguments,
          ),
          settings);

    case AuthRoutes.loginRoute:
      return _getPageRoute(const BasicProfileScreen(), settings);

    case AuthRoutes.birthdayRoute:
      return _getPageRoute(const BirthdayScreen(), settings);

    case AuthRoutes.genderRoute:
      return _getPageRoute(const GenderSelectionScreen(), settings);

    default:
      return _getPageRoute(const DefaultWidget(), settings);
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool mainRoute = false,
}) {
  //return CupertinoRoute(enterPage: child);
  if (Platform.isIOS && !mainRoute) {
    return CupertinoPageRoute(builder: (BuildContext context) => child);
  } else {
    return MaterialPageRoute(builder: (BuildContext context) => child);
  }
}
