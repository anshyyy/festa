import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../presentation/auth/auth_screen.dart';
import '../../../../../presentation/auth/login_with_phone_screen.dart';
import '../../../../../presentation/auth/start_screen.dart';
import '../../../../../presentation/auth/verify_otp_screen.dart';
import '../../../../../presentation/basic_profile/basic_profile_screen.dart';
import '../../../../../presentation/basic_profile/birthday_selection_screen.dart';
import '../../../../../presentation/basic_profile/gender_selection_screen.dart';
import '../../../../../presentation/basic_profile/set_your_location.dart';
import '../../../../../presentation/basic_profile/username_screen.dart';
import '../../../../../presentation/booking/book_ticket_screen.dart';
import '../../../../../presentation/booking/payment_details_screen.dart';
import '../../../../../presentation/club_profile/club_profile_screen.dart';
import '../../../../../presentation/common/default_widget.dart';
import '../../../../../presentation/common/network_unavailable_screen.dart';
import '../../../../../presentation/event/event_details_screen.dart';
import '../../../../../presentation/home/home_screen.dart';
import '../../../../../presentation/main_nav/main_navigator.dart';
import '../../../../../presentation/notifications/notification_screen.dart';
import '../../../../../presentation/ticket/tickets_screen.dart';
import '../../../../../presentation/user/edit_profile_screen/edit_profile_screen.dart';
import '../../../../../presentation/user/personalise_your_experience/personalise_experience_screen.dart';
import '../../../../../presentation/user/profile_and_settings.dart';
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


 case AuthRoutes.usernameRoute:
      return _getPageRoute(const UsernameScreen(), settings);

 case AuthRoutes.locationSetupRoute:
      return _getPageRoute(const SetYourLocation(), settings);


    case UserRoutes.homeScreenRoute:
      return _getPageRoute(const HomeScreen(), settings);

    case UserRoutes.userProfileRoute:
      return _getPageRoute(const ProfileAndSettingsScreen(), settings);

    case UserRoutes.personalizeExperienceRoute:
      return _getPageRoute(const PersonalizeYourExperienceScreen(), settings);

    case UserRoutes.editProfileRoute:
      return _getPageRoute(const EditProfileScreen(), settings);

    case UserRoutes.eventDetailsRoute:
      return _getPageRoute(
          EventDetailsScreen(
            id: routingData.queryParameters['id'] ?? '',
          ),
          settings);

    // case UserRoutes.eventCardRoute:
    //   return _getPageRoute(const EventCardScreen(), settings);

    case UserRoutes.ticketsRoute:
      return _getPageRoute(const TicketScreen(), settings);

    case UserRoutes.bookingRoute:
      return _getPageRoute(const BookTicketScreen(), settings);

    case UserRoutes.paymentDetailsRoute:
      return _getPageRoute(const PaymentDetails(), settings);

    case UserRoutes.clubProfileRoute:
      return _getPageRoute(const ClubProfileScreen(), settings);

    case UserRoutes.mainNavRoute:
      return _getPageRoute(const MainNavigator(), settings);

    case UserRoutes.notificationsRoute:
      return _getPageRoute(const NotificationsScreen(), settings);

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
      final String dialCode = routeData['dialCode'] ?? '';
      final String phoneNumber = routeData['phoneNumber'] ?? '';

      return _getPageRoute(
          VerifyOtpScreen(
            verificationCode: verificationCode,
            dialCode: dialCode,
            phoneNumber: phoneNumber.trim(),
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
