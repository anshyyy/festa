// ignore_for_file: non_constant_identifier_names

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
  static String filterKey = 'filter';
  static String otherKey = 'other';
  static String rupees = '₹';
  static String search = 'Search';
  static int otpTimer = 30;

  static String dynamicUrl =
      'https://festaworld.page.link/?link=https://www.festa.world/<category>/<id>&apn=com.festaworld.app&isi=6478425501&ibi=com.festaworld.app';
  static String pub = 'pub';
  static String artist = 'artist';
  static String event = 'event';
  static String user = 'user';
}

class MediaType {
  static String IMAGE = 'image';
  static String VIDEO = 'video';
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
  static String addBirthday = 'When\'s your\nbirthday?';
}

class GenderSelectionScreenConstants {
  static String addGenderText = 'What\'s your gender?';
  static String addText = 'Please enter what gender?';
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
  static String affirmationPrompt =
      'I affirm that the provided mobile number belongs to me.';

  static String verifyNumberHeader = 'Verify your number';
  static String verifyNumberDescription = 'Enter the OTP sent to';
  static String appleContinue = 'Continue with Apple';
  static String googleContinue = 'Continue with Google';
  static String phoneNumberContinue = 'Use mobile number';
  static String phoneNumberHint = 'Phone Number';

  static String resendNow = 'Resend now ';
  static String resendAfter = 'Resend after ';
  static String otpSend = 'Code Sent Successfully';
  static String success = 'Login Successful';
}

class UsernameScreenConstants {
  static String chooseYourUsername = 'Choose your username';
  static String typeHere = 'Type here';
}

class ErrorConstants {
  static const String unknownNetworkError = 'Received non 200 status code';

  static const String requiredError = 'Required';
  static String unexpectedForMobileNumberError =
      'OTP Request Failed, Please try again';
  static String wrongOTP = 'Invalid OTP, please entered valid OTP!';
  static String failedToLogin = 'Failed to verify phone number!';
  static String invalidMobileNumberError = 'Invalid Phone Number';
  static String invalidFullNameError = 'Invalid Full Name';
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
  static String invalidEmail = 'Enter a valid Email';
}

class TicketScreenConstants {
  static String yourTickets = 'Your tickets';
  static String upcomingBtnText = 'Upcoming';
  static String historyBtnText = 'History';
}

class BookingScreenConstants {
  static String earlyBird = 'Early Bird';
  static String standard = 'Standard';
  static String add = 'Add';
  static String choosePaymentMode = 'Choose your payment method';
  static String ticketPrice = 'Ticket Price';
  static String quantity = 'Quantity';
  static String title = 'Title';
  static String gst = 'GST';
  static String upi = 'UPI';
  static String debitCredit = 'Debit/Credit Card';
  static String status = 'Status';
  static String successful = 'Succesful';
  static String failed = 'Failed';
  static String noOfTickets = 'Number of tickets';
  static String date = 'Date';
  static String paymentMethod = 'Payment Method';
  static String viewTickets = 'View tickets';
  static String home = 'Home';
  static String followMessage = 'Follow to receive notifications on new events';
}

class FreeBookingScreenConstants {
  static String whatHappenNext = 'What happens next?';
  static String qrCodeAdded = '1. QR code added to the ticket section';
  static String qrCodeAddedDescription =
      "To gain entry to the event, you'll need to present the QR code we sent you via email as well. Please have the QR code ready for scanning at the entrance. Keep in mind that each QR code is valid for a single use.";
  static String markYourCalendar = '2. Mark your calendar';
  static String markYourCalendarDescription =
      'Mark your calendar and turn on your notifications. Your spot in line will be determined on a first come serve basis.';
  static String shareQrWithFriend = 'Share QR code with friends';
  static String gotoTickets = 'Go to tickets';
}

class PaymentScreenConstants {
  static String offersAndBenfit = 'Offers and benefits';
  static String applyCoupon = 'Apply Coupon/Offers';
}

class HomeScreenConstants {
  static String hey = 'Hey';
  static String welcomeText = 'Let’s party!';
  static String pickYourExperience = 'Pick your experience';
  static String explorerAll = 'Explore all';
  static String noEventsFound = 'No events found in your selected ';

  static String editFilters = 'Edit filters';
  static String searchEvent = 'Search events';

  static String filters = 'filters';
  static String area = 'area';
  static String chooseLocation = 'Choose location';
}

class CartScreenConstants {
  static String addText = 'THE GREYBOT ALL STARS/MIKE DILLON BAND';
}

class EventScreenConstants {
  static String event = 'event';
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

class EventDetailsScreenConstants {
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
  static String followArtists = 'Follow artists';
  static String addToCalendar = 'Add to calendar';
  static String shareEvent = 'Share an event';
  static String report = 'Report';
}

class ClubProfileScreenConstants {
  static String parties = 'Parties';
  static String followers = 'Followers';
  static String friends = 'Friends';
  static String follow = 'Follow';
  static String following = 'Following';
  static String am = 'AM';
  static String pm = 'PM';
}

class UserProfileScreenConstants {
  static String uploadYourHighlight = 'Upload your highlight';
  static String follow = 'Follow';
  static String following = 'Following';
  static String followedBy = 'Followed by';
  static String parties = 'Parties';
  static String followers = 'Followers';
  static String friends = 'Friends';
}

class ProfileAndSettingsScreenConstants {
  static String personalizeYourExperience = 'Personalise your experience';
  static String profileAndSettings = 'Profile and settings';
  static String accountSettings = 'Account Settings';
  static String notifications = 'Notifications';
  static String yourActivities = 'Your Activities';
  static String privacy = 'Privacy';
  static String blockedUsers = 'Blocked Users';
  static String tellAFriend = 'Tell a friend';
  static String help = 'Help';
  static String feedback = 'Feedback';
  static String rateInPlayStore = 'Rate in Play Store';
  static String logout = 'Log out';
  static String deleteAccount = 'Delete Account';
  static String yes = 'Yes';
  static String no = 'No';
  static String deleteACWarning = 'Are you sure want to delete this account?';
  static String accountDeleted = 'Account deleted successfully!';
  static String accountDeletionFailed = 'Failed to delete account!';
  static String logoutSuccess = 'Logout successfully!';
  static String logoutFailure = 'Something went wrong, contact admin';
}

class PersonalizeExperienceScreenConstants {
  static String profilePrompt =
      'Let’s take your profile from good to great 😍\nThe details matter!';
  static String changePersonlize =
      'You are free to change the personalisation anytime.';
  static String totallyUptoYouMessage =
      'This is totally up to you and whether you’re comfortable.';
  static String genderSettingChange = 'This is totally up to you and whether you’re comfortable.';
}

class EditProfileScreenConstants {
  static String editProfile = 'Edit Profile';
  static String profile = 'Profile';
  static String bio = 'Bio';
}

class AccountSettingScreenConstants {
  static String accountPrivacy = 'Account Privacy';
  static String email = 'Email';
  static String phone = 'Phone';
  static String username = 'Username';
  static String dateOfBirth = 'Date of Birth';
  static String password = 'Password';
  static String deleteAccount = 'Delete Account';
}

class AccountPrivacyScreenConstants {
  static String privateAccount = 'Private Account';
  static String accountPrivacyDescription =
      "When your account is set to public, your profile and posts are visible to everyone, both on and off Festa, even if they're not Festa users.\n\nIf you choose to go private, only the followers you approve get to see what you share, from photos and videos to hashtags and location Pages, as well as your followers and following lists.";
  static String switchToPublic = 'Switch to public account?';
  static String anyoneCanSeeYourProfile =
      'Anyone can see your posts, videos and highlights.';
  static String thisWontChange =
      'This won’t change who can message, tag or @mention you.';
  static String youCanAlwaysGoPrivate = 'You can always go private in settings';
  static String switchToPublicBtnText = 'Switch to Public';
  static String switchToPrivateBtnText = 'Switch to Private';
  static String cancel = 'Cancel';
  static String switchToPrivate = 'Switch to private account?';
  static String onlyFollowersCanSee =
      'Only followers can see your posts, videos and highlights.';
  static String youCanAlwaysGoPublic = 'You can always go public in settings';
}

class AccountEmailScreenConstants {
  static String title = 'Email Address';
  static String youHaveNotAddedEmail =
      'You have not added your email address yet.\nYou can add the email address below.';
  static String typeNewEmail = 'Type new email address...';
  static String addEmail = 'Add Email';
  static String otpSent = 'We have sent OTP to ';
  static String changeEmail = 'Change email';
  static String enterOtp = 'Enter the OTP here..';
  static String resendNow = 'Resend now ';
  static String resendAfter = 'Resend after ';
  static String youHaveAddedThisEmail =
      'You added this email to this accounts.';
  static String whoCanSeeYourEmailAddress = 'Who can see your email address?';
  static String deleteEmailAddress = 'Delete email address';
  static String submit = 'Submit';
  static String deleteEmailDescription =
      'You’ll no longer be able to use this email address to log in, reset your password or receive notifications.\n\nPlease note that you may not able to delete this email address from accounts where it is the only contact method.';
  static String confirm = 'Confirm';
  static String cancel = 'Cancel';
}

class PhoneScreenConstants {
  static String title = 'Mobile Settings';
  static String youHaveNotAddedContact =
      'You have not added your contact number yet.\nYou can add the number below.';
  static String typeHere = 'Type here';
  static String addNumber = 'Add number';
  static String otpSent = 'We have sent OTP to ';
  static String changeNumber = 'Change number';
  static String enterOtp = 'Enter the OTP here..';
  static String resendNow = 'Resend now ';
  static String resendAfter = 'Resend after ';
  static String youHaveAddedThisNumber =
      'You added this number to this accounts.';
  static String whoCanSeeYourNumber = 'Who can see your number?';
  static String deleteNumber = 'Delete number';
  static String submit = 'Submit';
  static String deletePhoneDescription =
      'You’ll no longer be able to use this number to log in, reset your password or receive notifications.\n\nPlease note that you may not able to delete this number from accounts where it is the only contact method.';
  static String confirm = 'Confirm';
  static String cancel = 'Cancel';
}

class UsernameSettingsScreenConstants {
  static String title = 'Username';
  static String typeHere = 'Type here';
  static String chooseNewUsernameMessage =
      'Choose a new username to represent yourself on Festa.';
  static String usernameCanConsistMessage =
      'Username can consist of 3-15 characters with letters, numbers and underscores.';
  static String inMostCasesMessage =
      'In most cases, you’ll be able to change your username once in 14 days.';
  static String updateUsername = 'Update Username';
  static String cancel = 'Cancel';
  static String userNameIsntAvailable =
      "This username isn't available, please try another.";
  static String userNameUpdated = 'Username updated successfully';
}

class DateOfBirthSettingsScreenConstants {
  static String title = 'Date of Birth';
  static String edit = 'Edit';
  static String dateOfBirthMessage =
      'Providing your date of birth helps make sure that you get the right experience for your age.';
  static String whoCanSeeYourDobMessage = 'Who can see you birthday?';
  static String save = 'Save';
  static String cancel = 'Cancel';
}

class DeleteAccountScreenConstants {
  static String delete = 'delete';
  static String title = 'Delete Account';
  static String whyYouWouldDeleteMessage =
      'Why would you like to delete your account?';
  static String dontWantToUseFesta = 'I don’t want to use Festa anymore';
  static String usingAnotherAccount = 'I am using another account';
  static String worriedAboutMyPrivacy = 'I am worried about my privacy';
  static String sendingMeTooManyNotifications =
      'You’re sending me too many notifications';
  static String theAppIsNotWorking = 'The app is not working properly';
  static String other = 'Others';
  static String accountDeletion = 'Account Deletion';
  static String accountDeletionMessage =
      'You will lose access to any tickets you’ve purchased and our past event attendance records.\n\nAll your events, friends, posts and everything else will be permanently erased.\n\nThis action cannot be reverted.';
  static String cancel = 'Cancel';
  static String confirmDelete = 'Confirm Deletion';
  static String actionCannotBeReverted = 'This action cannot be reverted.';
  static String deleteConfirm = 'Type “delete” to confirm.';
  static String typeHere = 'Type here...';
  static String sadToSeeYouGo = 'Sad to see you go :(';
  static String youWillLoggedOut = 'You will logged out from every device.';
  static String youCanAlwaysJoinMessage =
      'You can always join back using same credentials.';
  static String close = 'Close';

  static List<String> deleteReasons = [
    dontWantToUseFesta,
    usingAnotherAccount,
    worriedAboutMyPrivacy,
    sendingMeTooManyNotifications,
    theAppIsNotWorking
  ];
}

class SetupLocationScreenConstants {
  static String setupYourLocation = 'Set your location';
  static String seeWhatHappening = 'See what’s happening in your city';
  static String useMyLocation = 'Use my location';
  static String save = 'Save';
  static String cancel = 'Cancel';
}

class NotificationsScreenConstants {
  static String notificationsFilter = 'Filter';
  static String notifications = 'Notifications';
  static String noNotifications = 'No Notifications yet';
  static String aboutNotifications =
      'Notifications about your events and friends will show up here.';
}
