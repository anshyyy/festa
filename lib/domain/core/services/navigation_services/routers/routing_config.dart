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
import '../../../../../presentation/booking/book_ticket_screen.dart';
import '../../../../../presentation/booking/payment_details_screen.dart';
import '../../../../../presentation/club_profile/club_profile_screen.dart';
import '../../../../../presentation/common/default_widget.dart';
import '../../../../../presentation/common/network_unavailable_screen.dart';
import '../../../../../presentation/event/event_details_screen.dart';
import '../../../../../presentation/home/home_screen.dart';
import '../../../../../presentation/individual_event_card/individual_event_card_screen.dart';
import '../../../../../presentation/ticket/tickets_screen.dart';
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
    
    case UserRoutes.homeScreenRoute:
      return _getPageRoute(const HomeScreen(), settings);

    case UserRoutes.eventDetailsRoutes:
      return _getPageRoute(
          const EventDetailsScreen(
              eventTitle: 'THE GREYBOT ALL STARS',
              date: 'Dec 25, 2023 08:00PM',
              distance: 2.3,
              hostDetails: 'Bobs`s Bar',
              location: 'Great Indian Music Hall, Indira Nagar, Banglore',
              price: 5000.00,
              eventTime: '10:00 AM - 12:30 AM',
              ratings: '5.0 (100 ratings)',
              posters: [
                'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ]),
          settings);

    case UserRoutes.eventCardRoute:
      return _getPageRoute(const EventCardScreen(), settings);

    case UserRoutes.ticketsRoute:
      return _getPageRoute(const TicketScreen(), settings);

    case UserRoutes.bookingRoute:
      return _getPageRoute(const BookTicketScreen(), settings);

    case UserRoutes.paymentDetailsRoute:
      return _getPageRoute(const PaymentDetails(), settings);

    case UserRoutes.clubProfileRoute:
      return _getPageRoute(const ClubProfileScreen(), settings);
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
