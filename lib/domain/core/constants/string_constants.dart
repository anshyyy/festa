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

  static String seconds = 's';
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
      'By signing up, you agree to our Terms, See how we use your data in our Privacy Policy. We never post to Facebook. ';
}

class LoginScreenConstants {
  static String mobileLoginHeader = 'What\'s your mobile number?';
  static String mobileLoginDescription =
      'We protect our community by making sure everyone on Festa is real.';
  static String mobileLoginPrompt =
      'We never share this with anyone and it won\'t be on your profile.';
  static String phoneConfirmation =
      'I affirm that the provided mobile number belongs to me.';
  static String affirmationPrompt = 'I affirm that the provided mobile number belongs to me.'; 

  static String verifyNumberHeader = 'Verify your number';
  static String verifyNumberDescription = 'Enter the OTP sent to';
  static String appleContinue = 'Continue with Apple';
  static String googleContinue = 'Continue with Google';
  static String phoneNumberContinue = 'Use mobile number';
  static String phoneNumberHint = 'Phone number';

  static String resendNow = 'Resend now ';
  static String resendAfter = 'Resend after ';
  static String otpSend = 'Code Sent Successfully';
  static String success = 'Login Successful';
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

class TicketScreenConstants {
  static String yourTickets = 'Your tickets';
  static String upcomingBtnText = 'Upcoming';
  static String historyBtnText = 'History';
}

class BookingScreenConstants {}

class PaymentScreenConstants{
  static String offersAndBenfit = 'Offers and benefits';
  static String applyCoupon = 'Apply Coupon/Offers';
}

// class BasicProfileScreenConstants {
//   static String addNameProfile = 'Add your name and photo to your profile';
//   static String addProfilePicture = 'Add your profile picture';
//   static String addText =
//       'Building your profile wil increase visibility and recommendations.';
//   static String enterYourName = 'Enter your name';
//   static String hintEnterYourName = 'Type here';
//   static String continueText = 'Continue';
// }

// class BirthdayScreenConstants {
//   static String addBirthday = 'When\'s your birthday?';
// }

// class GenderSelectionScreenConstants {
//   static String addGenderText = 'What\'s your gender?';
//   static String addText =
//       'Lorem ipsum dolor sit amet consectetur. Duis aliquet tellus quis risus tincidunt purus enim nec. Vitae tincidunt suspendisse sed urna egestas dui scelerisque massa vitae. ';
// }

// class TermsAndConditionConstants {
//   static String privacyMessage =
//       'Your privacy is our top concern and we want you to know how we process your personal information. By continuing you confirm that you\'ve read and accepted our';
//   static String privacyText = 'Privacy Policy';
//   static String termsText = 'Terms';
//   static String authTermsAcceptMessage =
//       'By signing up, you agree to our Terms, See how we use\nyour data in our Privacy Policy. We never post to Facebook. ';
// }

// class LoginScreenConstants {
//   static String mobileLoginHeader = 'What\'s your mobile number?';
//   static String mobileLoginDescription =
//       'We protect our community by making sure everyone on Festa is real.';
//   static String mobileLoginPrompt =
//       'We never share this with anyone and it won\'t be on your profile.';
//   static String phoneConfirmation =
//       'I affirm that the provided mobile number belongs to me.';

//   static String verifyNumberHeader = 'Verify your number';
//   static String verifyNumberDescription =
//       'Enter the code we\'re sent by text to ';
//   static String resendNow = 'Resend now ';
//   static String resendAfter = 'Resend after ';
//   static String appleContinue = 'Continue with Apple';
//   static String googleContinue = 'Continue with Google';
//   static String phoneNumberContinue = 'Use mobile number';
//   static String phoneNumberHint = 'Phone number';
// }

// class ErrorConstants {
//   static const String requiredError = 'Required';
//   static String unexpectedForMobileNumberError =
//       'OTP Request Failed, Please try again';
//   static String wrongOTP = 'Invalid OTP, please entered valid OTP!';
//   static String failedToLogin = 'Failed to verify phone number!';
//   static String invalidMobileNumberError = 'Invalid Phone Number';
//   static String sessionExpired =
//       'OTP verification code has expired please click on resend';
//   static String invalidOtpError = 'Invalid OTP';
//   static String invalidUsername = 'Invalid Username';
//   static String requiredField = 'Required';
//   static String waitForDownload =
//       'Can\'t switch during download, Wait for version to download';
//   static String failedToFetchVersion = 'Something went wrong, please try again';
//   static String networkUnavailable = 'Network Unavailable !';
//   static showToast(String errMsg, {Color? backgroundColor}) =>
//       Fluttertoast.showToast(
//         msg: errMsg,
//         toastLength: Toast.LENGTH_SHORT,
//         timeInSecForIosWeb: 1,
//         webPosition: 'center',
//         gravity: ToastGravity.CENTER,
//         backgroundColor: backgroundColor ?? Colors.red,
//         textColor: Colors.white,
//         fontSize: 14,
//       );
//   static String invalidVideo = 'Invalid Video!';
//   static String shortVideo = 'Captured video is too short!';
// }

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
  static String bookTheTickets = 'Book the tickets';
  static String description = 'Description';
  static String descriptionText =
      'Hac amet amet nisl hendrerit metus vivamus a. Rhoncus nulla consequat est et. Dignissim fringilla in posuere lacus suspendisse diam diam pretium scelerisque. sdf . urwthfgn eugerh geurgh gerughr uerhg ergguo hreguhh.';
  static String lsd = 'LSD (Lights, Sound and Dancefloor)';
  static String lightText = 'Filled with pink, red, blue and yellow lights ';
  static String musicText = 'Mellow and its never loud to talk';
  static String danceFloorText = 'Strength 200 people at a time';
  static String ambience = 'Ambience';
  static String ambienceText =
      'Pool, Plants and Sweet Fragrance, Seating alongside pool (Needs reservation), Couple seating available';
  static String foodAndBeverages = 'Food and Beverages';
  static String spicy = 'Spicy Chicken Wings, Panner Tikka, Fish fry';
  static String drinks =
      'Gin Cocktail, Sex on the Beach, Whiskey shots with Ice-Cream';
  static String number = '1.';
  static String fAQs = 'FAQs';
  static String fAQsText =
      'Tempus tellus suspendisse elementum convallis egestas aliquet egestas. Bibendum sagittis fames ut. Tempus tellus suspendisse elementum convallis egestas aliquet egestas. Bibendum sagittis fames ut.';
}
