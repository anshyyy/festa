import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../presentation/basic_profile/basic_profile_screen.dart';
import '../../../../../presentation/basic_profile/birthday_selection_screen.dart';
import '../../../../../presentation/basic_profile/gender_selection_screen.dart';

import '../../../../../presentation/auth/auth_screen.dart';
import '../../../../../presentation/auth/login_with_phone_screen.dart';
import '../../../../../presentation/auth/start_screen.dart';
import '../../../../../presentation/auth/verify_otp_screen.dart';
import '../../../../../presentation/common/default_widget.dart';
import '../../../../../presentation/common/network_unavailable_screen.dart';
import '../../../extensions/string_extension.dart';
import 'route_name.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;

  switch (routingData.route) {
    case AuthRoutes.basicInfoRoute:
      return _getPageRoute(const BasicProfileScreen(), settings);

    case AuthRoutes.birthdayRoute:
      return _getPageRoute(const BirthdayScreen(), settings);

    case AuthRoutes.genderRoute:
      return _getPageRoute(const GenderSelectionScreen(), settings);
    case UserRoutes.mainNavRoute:
      return _getPageRoute(Container(), settings);

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
    case AuthRoutes.startRoute:
      return _getPageRoute(const StarterScreen(), settings);

    case AuthRoutes.authRoute:
      return _getPageRoute(const AuthScreen(), settings);

    case AuthRoutes.loginWithPhoneRoute:
      return _getPageRoute(const LoginPhoneScreen(), settings);

    case AuthRoutes.verifyOTPRoute:
      final routeData = routingData.queryParameters;
      final String verificationCode = routeData['verificationCode'] ?? '';
      final String otpCode = routeData['otpData'] ?? '';

      return _getPageRoute(
          VerifyOtpScreen(
            verificationCode: verificationCode,
            otpCode: otpCode,
          ),
          settings);

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
