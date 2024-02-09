import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstants {
  static String appName = 'Festa';
  static String continueText = 'Continue';
  static String updateAvailable = 'Update Available';
  static String ignore = 'Ignore';
  static String andText = 'and';
  static String installNow = 'Install Now';
  static String updateNow = 'Update Now';
  static String pleaseTryAgain = 'Please try again!';
  static String updateMessage =
      'New update of Festa App is available, it comes with lots improvement and features.';
  static String newReleaseUpdate =
      'New update of Festa App available now. Want to update ?';
}

class BasicProfileScreenConstants {
  static String addNameProfile = 'Add your name and photo to your profile';
  static String addProfilePicture = 'Add your profile picture';
  static String addText =
      'Building your profile wil increase visibility and recommendations.';
  static String enterYourName = 'Enter your name';
  static String hintEnterYourName = 'Type here';
  static String continueText = 'Continue';
}

class BirthdayScreenConstants {
  static String addBirthday = 'When\'s your birthday?';
}

class GenderSelectionScreenConstants {
  static String addGenderText = 'What\'s your gender?';
  static String addText =
      'Lorem ipsum dolor sit amet consectetur. Duis aliquet tellus quis risus tincidunt purus enim nec. Vitae tincidunt suspendisse sed urna egestas dui scelerisque massa vitae. ';
}

class TermsAndConditionConstants {
  static String privacyMessage =
      'Your privacy is our top concern and we want you to know how we process your personal information. By continuing you confirm that you\'ve read and accepted our';
  static String privacyText = 'Privacy Policy';
  static String termsText = 'Terms';
  static String authTermsAcceptMessage =
      'By signing up, you agree to our Terms, See how we use\nyour data in our Privacy Policy. We never post to Facebook. ';
}

class LoginScreenConstants {
  static String mobileLoginHeader = 'What\'s your mobile number?';
  static String mobileLoginDescription =
      'We protect our community by making sure everyone on Festa is real.';
  static String mobileLoginPrompt =
      'We never share this with anyone and it won\'t be on your profile.';
  static String phoneConfirmation =
      'I affirm that the provided mobile number belongs to me.';

  static String verifyNumberHeader = 'Verify your number';
  static String verifyNumberDescription =
      'Enter the code we\'re sent by text to ';
  static String resendNow = 'Resend now ';
  static String resendAfter = 'Resend after ';
  static String appleContinue = 'Continue with Apple';
  static String googleContinue = 'Continue with Google';
  static String phoneNumberContinue = 'Use mobile number';
  static String phoneNumberHint = 'Phone number';
}

class ErrorConstants {
  static const String requiredError = 'Required';
  static String unexpectedForMobileNumberError =
      'OTP Request Failed, Please try again';
  static String wrongOTP = 'Invalid OTP, please entered valid OTP!';
  static String failedToLogin = 'Failed to verify phone number!';
  static String invalidMobileNumberError = 'Invalid Phone Number';
  static String sessionExpired =
      'OTP verification code has expired please click on resend';
  static String invalidOtpError = 'Invalid OTP';
  static String invalidUsername = 'Invalid Username';
  static String requiredField = 'Required';
  static String waitForDownload =
      'Can\'t switch during download, Wait for version to download';
  static String failedToFetchVersion = 'Something went wrong, please try again';
  static String networkUnavailable = 'Network Unavailable !';
  static showToast(String errMsg, {Color? backgroundColor}) =>
      Fluttertoast.showToast(
        msg: errMsg,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        webPosition: 'center',
        gravity: ToastGravity.CENTER,
        backgroundColor: backgroundColor ?? Colors.red,
        textColor: Colors.white,
        fontSize: 14,
      );
  static String invalidVideo = 'Invalid Video!';
  static String shortVideo = 'Captured video is too short!';
}

class HomeScreenConstants {
  static String name = 'Hey James, Let’s party!';
  static String pickYourExperience = 'Pick your experience';
  static String explorerAll = 'Explore all';
}

class CartScreenConstants {
  static String addText = 'THE GREYBOT ALL STARS/MIKE DILLON BAND';
}

class EventCardScreenConstants {
  static String appBarTitle = 'THE GREYBOT ALL STARS/MIKE DILLON BAND';
  static String viewOnMaps = 'View on maps';
}
