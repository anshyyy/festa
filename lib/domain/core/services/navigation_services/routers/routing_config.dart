import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../presentation/artist_profile/artist_profile_screen.dart';
import '../../../../../presentation/artist_profile/widgets/artist_community_screen.dart';
import '../../../../../presentation/auth/auth_screen.dart';
import '../../../../../presentation/auth/login_with_phone_screen.dart';
import '../../../../../presentation/auth/start_screen.dart';
import '../../../../../presentation/auth/verify_otp_screen.dart';
import '../../../../../presentation/basic_profile/basic_profile_screen.dart';
import '../../../../../presentation/basic_profile/birthday_selection_screen.dart';
import '../../../../../presentation/basic_profile/gender_selection_screen.dart';
import '../../../../../presentation/basic_profile/set_your_location.dart';
import '../../../../../presentation/basic_profile/username_screen.dart';
import '../../../../../presentation/club_profile/club_profile_screen.dart';
import '../../../../../presentation/club_profile/widgets/club_community_screen.dart';
import '../../../../../presentation/club_profile/widgets/media_viewer_widget.dart';
import '../../../../../presentation/common/default_widget.dart';
import '../../../../../presentation/common/network_unavailable_screen.dart';
import '../../../../../presentation/event/booking/book_ticket_screen.dart';
import '../../../../../presentation/event/booking/free_booking_screen.dart';
import '../../../../../presentation/event/booking/payment_details_screen.dart';
import '../../../../../presentation/event/booking/payment_status_screen.dart';
import '../../../../../presentation/event/event_details_screen.dart';
import '../../../../../presentation/main_nav/main_navigator.dart';
import '../../../../../presentation/notifications/notification_screen.dart';
import '../../../../../presentation/user/other_user_profile_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/account_privacy/account_privacy_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/account_settings_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/date_of_birth/date_of_birth_settings_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/delete_account/delete_account_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/email/email_details_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/email/email_otp_verification.dart';
import '../../../../../presentation/user/profile_settings/account_settings/email/email_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/phone/phone_details_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/phone/phone_otp_verification.dart';
import '../../../../../presentation/user/profile_settings/account_settings/phone/phone_screen.dart';
import '../../../../../presentation/user/profile_settings/account_settings/username/username_settings_screen.dart';
import '../../../../../presentation/user/profile_settings/edit_profile_screen/edit_profile_screen.dart';
import '../../../../../presentation/user/profile_settings/personalise_your_experience/personalise_experience_screen.dart';
import '../../../../../presentation/user/profile_settings/profile_and_settings.dart';
import '../../../../../presentation/user/widgets/user_community_screen.dart';
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

    case UserRoutes.userCommunityScreenRoute:
      final userId = routingData.queryParameters['userId'] ?? '0';
      final username = routingData.queryParameters['username'] ?? '0';
      return _getPageRoute(
          UserCommunity(userId: int.parse(userId), username: username),
          settings);

    case UserRoutes.otherUserProfileRoute:
      final userId = routingData.queryParameters['userId'] ?? '0';
      return _getPageRoute(
          OtherUserProfileScreen(userId: int.parse(userId)), settings);

    case UserRoutes.profileAndSettingsRoute:
      final email = routingData.queryParameters['email'] ?? '';
      //print("this is the $email");
      return _getPageRoute(ProfileAndSettingsScreen(providedEmail: email.toString()), settings);

    case UserRoutes.personalizeExperienceRoute:
      return _getPageRoute(const PersonalizeYourExperienceScreen(), settings);

    case UserRoutes.editProfileRoute:
      final userId = routingData.queryParameters['userId'] ?? '0';

      return _getPageRoute(
          EditProfileScreen(
            userId: int.parse(userId),
          ),
          settings);

    case UserRoutes.accountSettingsRoute:
      final userId = routingData.queryParameters['userId'] ?? '0';
      final email = routingData.queryParameters['email'] ?? '';
      return _getPageRoute(
        AccountSettingScreen(
          userId: int.parse(userId),
          email: email,
        ),
        settings,
      );

    case UserRoutes.accountPrivacyRoute:
      final isPrivateAccount =
          routingData.queryParameters['isPrivateAccount']!.toLowerCase() ==
              'true';
      return _getPageRoute(
          AccountPrivacyScreen(
            isPrivateAccount: isPrivateAccount,
          ),
          settings);

    case UserRoutes.emailScreenRoute:
      return _getPageRoute(const EmailScreen(), settings);

    case UserRoutes.emailOtpVerificationRoute:
      return _getPageRoute(
          EmailOtpVerification(
              emailAddress: routingData.queryParameters['emailAddress'] ?? ''),
          settings);

    case UserRoutes.emailDetailsScreenRoute:
      return _getPageRoute(
          EmailDetailsScreen(
              emailAddress: routingData.queryParameters['emailAddress'] ?? ''),
          settings);

    case UserRoutes.phoneScreenRoute:
      return _getPageRoute(const PhoneScreen(), settings);

    case UserRoutes.phoneOtpVerificationRoute:
      return _getPageRoute(
          PhoneOtpVerification(
              phoneNumber: routingData.queryParameters['phoneNumber'] ?? ''),
          settings);

    case UserRoutes.phoneDetailsScreenRoute:
      return _getPageRoute(
          PhoneDetailsScreen(
              phoneNumber: routingData.queryParameters['phoneNumber'] ?? ''),
          settings);

    case UserRoutes.usernameSettingsScreenRoute:
      final username = routingData.queryParameters['username'];
      return _getPageRoute(
          UsernameSettingsScreen(
            username: username!,
          ),
          settings);

    case UserRoutes.dateOfBirthSettingsScreenRoute:
      final dob = routingData.queryParameters['dob'] ?? '';
      return _getPageRoute(
          DateOfBirthSettingsScreen(
            dob: dob,
          ),
          settings);

    case UserRoutes.deleteAccountScreenRoute:
      return _getPageRoute(const DeleteAccountScreen(), settings);

    case UserRoutes.eventDetailsRoute:
      return _getPageRoute(
          EventDetailsScreen(
            id: routingData.queryParameters['id'] ?? '',
            distance: routingData.queryParameters['distance'] ?? '',
          ),
          settings);

    case UserRoutes.bookingRoute:
      final String eventId = routingData.queryParameters['eventId'] ?? '';
      return _getPageRoute(
          BookTicketScreen(
            eventId: int.parse(eventId),
          ),
          settings);

    case UserRoutes.freeBookingRoute:
      return _getPageRoute(const FreeBookingScreen(), settings);

    case UserRoutes.paymentDetailsRoute:
      return _getPageRoute(
          PaymentDetails(
            arguments: settings.arguments,
          ),
          settings);

    case UserRoutes.paymentStatusScreenRoute:
      final String eventId = routingData.queryParameters['eventId'] ?? '0';
      final bool isPaymentSuccess =
          routingData.queryParameters['isPaymentSuccess'] == 'true';
      final bool isPaymentPending =
          routingData.queryParameters['isPaymentPending'] == 'true';
      final String numberOfTickets =
          routingData.queryParameters['numberOfTickets'] ?? '0';
      final String totalAmount =
          routingData.queryParameters['totalAmount'] ?? '0';

      return _getPageRoute(
          PaymentStatusScreen(
            isPaymentSuccess: isPaymentSuccess,
            isPaymentPending: isPaymentPending,
            numberOfTickets: int.parse(numberOfTickets),
            eventId: int.parse(
              eventId,
            ),
            totalAmount: double.parse(totalAmount),
          ),
          settings);

    case UserRoutes.clubProfileRoute:
      final clubId = routingData.queryParameters['id'] ?? '0';
      return _getPageRoute(
          ClubProfileScreen(
            clubId: int.parse(clubId),
          ),
          settings);

    case UserRoutes.clubCommunityScreenRoute:
      final clubId = routingData.queryParameters['clubId'] ?? '0';
      final clubName = routingData.queryParameters['clubName'] ?? '';
      return _getPageRoute(
          ClubCommunity(
            clubId: int.parse(clubId),
            clubName: clubName,
          ),
          settings);

    case UserRoutes.artistProfileScreenRoute:
      final artistId = routingData.queryParameters['id'] ?? '0';
      return _getPageRoute(
          ArtistProfileScreen(
            artistId: int.parse(artistId),
          ),
          settings);

    case UserRoutes.artistCommunityScreenRoute:
      final artistId = routingData.queryParameters['artistId'] ?? '0';
      final artistName = routingData.queryParameters['artistName'] ?? '0';
      return _getPageRoute(
          ArtistCommunity(
            artistId: int.parse(artistId),
            fullName: artistName,
          ),
          settings);

    case UserRoutes.mainNavRoute:
      return _getPageRoute(
          MainNavigator(
            routeIndex: routingData.queryParameters['routeIndex'] ?? '0',
          ),
          settings);

    case UserRoutes.notificationsRoute:
      return _getPageRoute(const NotificationsScreen(), settings);

    case UserRoutes.mediaViewerWidgetScreen:
      final type = routingData.queryParameters['type'] ?? 'image';
      final url = routingData.queryParameters['url'] ?? '';
      final pubId = routingData.queryParameters['pubId'] ?? '';
      return _getPageRoute(
          MediaViewerWidget(
            type: type,
            url: url,
            pubId: int.parse(pubId),
          ),
          settings);

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
