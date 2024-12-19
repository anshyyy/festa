import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../services/navigation_services/routers/routing_dto.dart';

extension StringExtension on String {
  RoutingDto get getRoutingData {
    final uriData = Uri.parse(this);
    return RoutingDto(
        route: uriData.path, queryParameters: uriData.queryParameters);
  }

  String get getTestStatus {
    String currentStatus = this;
    currentStatus = currentStatus.replaceAll(RegExp('_'), ' ');
    currentStatus = currentStatus[0].toUpperCase() +
        currentStatus.substring(1).toLowerCase();

    return currentStatus;
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  
  static String durationRange(String startDateTime, String endDateTime) {
    DateTime start = DateTime.parse(startDateTime);
    DateTime end = DateTime.parse(endDateTime);
    // Calculate duration between start and end time
    Duration difference = end.difference(start);
    // Convert to hours and round to nearest hour
    int hours = (difference.inMinutes / 60).round();
    return '${hours}hrs';
  }
  static String formatArea(String area) {
    // print(area);
    List<String> location = area.split(',');
    if (location.length == 1) {
      return location[0];
    }
    if (location.length > 2) {
      return '${location[0]} ${location[1]}';
    }
    return '';
  }

   static String formatDateForNewEventCard(String dateString) {
    // Format the date to include the day with suffix and month
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    String dayWithSuffix = DateFormat('d').format(dateTime) + _getDaySuffix(dateTime.day);
    String month = DateFormat('MMM').format(dateTime);

    // Format the time to 12-hour format with AM/PM
    String time = DateFormat('h a').format(dateTime);

    // Combine the formatted date and time
    return '$dayWithSuffix $month, Starts from $time';
  }
  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String capitalize(String name) {
    if (name.isEmpty) return '';

    List<String> arr = name.split(' ');
    List<String> temp = [];

    for (var word in arr) {
      if (word.isNotEmpty) {
        // Capitalize the first letter and add the rest of the word in lowercase
        String capitalizedWord =
            word[0].toUpperCase() + word.substring(1).toLowerCase();
        temp.add(capitalizedWord);
      }
    }

    return temp.join(' ');
  }

  static String formatDateTimeWithTime(String dateTimeString) {
    try {
      // Parse the input string to DateTime
      DateTime dateTime = DateTime.parse(dateTimeString);

      // Convert to local time zone
      // dateTime = dateTime.toLocal();

      // Format the date and time to 'd MMM yyyy at h:mma'
      DateFormat formatter = DateFormat('d MMM yyyy \'at\' h:mma');

      // Return the formatted string
      return formatter.format(dateTime);
    } catch (e) {
      // Return an error message if parsing fails
      return 'Invalid date format';
    }
  }

  static String formatDateTimeLongNew(DateTime dateTime) {
    return DateFormat('EEE, d MMMM').format(dateTime);
  }

  static String formatDateStringIST(String dateString) {
    try {
      // Parse the input string to DateTime
      // DateTime.parse() can handle ISO 8601 format directly
      // print(dateString);
      DateTime dateTime = DateTime.parse(dateString).toUtc();

      // Convert to IST (UTC+5:30)
      dateTime = dateTime.toUtc().add(const Duration(hours: 5, minutes: 30));
      //print(dateTime);

      // Create a formatter for the desired output
      final DateFormat formatter = DateFormat('EEEE d MMMM yyyy');

      // Format the date and return the result
      return formatter.format(dateTime);
    } catch (e) {
      // Return an error message if parsing fails
      return 'Invalid date format';
    }
  }

  static String formatDateString(String dateString) {
    try {
      // Parse the input string to DateTime
      // DateTime.parse() can handle ISO 8601 format directly
    //  print(dateString);
      DateTime dateTime = DateTime.parse(dateString).toUtc();

      // Convert to local time zone
      DateTime istTime = dateTime.add(Duration(hours: 5, minutes: 30));
      // dateTime = dateTime.toLocal();
   //   print(istTime);

      // Create a formatter for the desired output
      final DateFormat formatter = DateFormat('EEEE d MMMM yyyy');

      // Format the date and return the result
      return formatter.format(istTime);
    } catch (e) {
      // Return an error message if parsing fails
      return 'Invalid date format';
    }
  }
  

  static String formatTimeRange(String startDateTime, String endDateTime) {
    try {
      // Parse the input strings to DateTime
      DateTime start = DateTime.parse(startDateTime).toLocal();
      DateTime end = DateTime.parse(endDateTime).toLocal();

      // Create formatter for 12-hour time
      final timeFormatter = DateFormat('h:mma');

      // Format start and end times
      String startFormatted = timeFormatter.format(start);
      String endFormatted = timeFormatter.format(end);
      startFormatted = startFormatted.replaceFirst(RegExp(r'^0'), '');
      endFormatted = endFormatted.replaceFirst(RegExp(r'^0'), '');

      startFormatted = startFormatted.toUpperCase();
      endFormatted = endFormatted.toUpperCase();

    
      return '$startFormatted - $endFormatted';
    } catch (e) {
      return 'Invalid date format';
    }
  }

  static String formatDateTimeLongWithYear(DateTime dateTime) {
    return DateFormat('EEE, d MMM yyyy').format(dateTime);
  }

  static String formatAmount(int amount) {
    if (amount < 1000) {
      return amount.toString();
    } else if (amount < 1000000) {
      double result = amount / 1000.0;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    } else {
      double result = amount / 1000000.0;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
    }
  }

  String get capitalizeCamel {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1)}';
    } else {
      return this;
    }
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String get getContentTypeImage {
    switch (toLowerCase()) {
      case 'jpe':
        return 'jpeg';
      case 'jpg':
        return 'jpeg';
      case 'jpeg':
        return 'jpeg';
      case 'heic':
        return 'heic';
      default:
        return toLowerCase();
    }
  }

  static String displayAddress(LocationDto location) {
    if (location.area.isNotEmpty) {
      return location.area;
    }
    return location.city;
  }

  static String formatDateTimeNormal(DateTime dateTime) {
    DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime.toLocal());
  }

  static String formatDateTimeWithDash(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime.toLocal());
  }

  static String formatDateTimeLong(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd, yyyy hh:mma');
    return formatter.format(dateTime.toLocal());
  }

  static String formatDateTimeMedium(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd, hh:mma');
    return formatter.format(dateTime.toLocal());
  }

  static String formatDateTimeShort(DateTime dateTime) {
    DateFormat formatter = DateFormat('dd MMM, hh:mma');
    return formatter.format(dateTime.toLocal());
  }

  static String formatDateTimeShortIST(DateTime dateTime) {
    final istDateTime =
        dateTime.toUtc().add(const Duration(hours: 5, minutes: 30));
    final DateFormat formatter = DateFormat('dd MMM, hh:mma');
    return formatter.format(istDateTime);
  }

  static String formatDateTimeWithDay(DateTime dateTime) {
    DateFormat formatter = DateFormat('EEE dd MMM, yyyy   hh:mm a');
    return formatter.format(dateTime.toLocal());
  }
}

class CapitalizeText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toTitleCase());
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
