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

static String formatDateTimeWithTime(String dateTimeString) {
    try {
      // Parse the input string to DateTime
      DateTime dateTime = DateTime.parse(dateTimeString);

      // Convert to local time zone
      dateTime = dateTime.toLocal();

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

 static  String formatDateString(String dateString) {
  try {
    // Parse the input string to DateTime
    // DateTime.parse() can handle ISO 8601 format directly
    DateTime dateTime = DateTime.parse(dateString);
    
    // Convert to local time zone
    dateTime = dateTime.toLocal();
    
    // Create a formatter for the desired output
    final DateFormat formatter = DateFormat('EEEE d MMMM yyyy');
    
    // Format the date and return the result
    return formatter.format(dateTime);
  } catch (e) {
    // Return an error message if parsing fails
    return 'Invalid date format';
  }
}


static String formatTimeRange(String startDateTime, String endDateTime) {
  try {
    // Parse the input strings to DateTime
    DateTime start = DateTime.parse(startDateTime);
    DateTime end = DateTime.parse(endDateTime);
    
    // Convert to local time zone
    start = start.toLocal();
    end = end.toLocal();
    
    // Create formatter for 12-hour time
    final timeFormatter = DateFormat('h:mma');
    
    // Format start and end times
    String startFormatted = timeFormatter.format(start);
    String endFormatted = timeFormatter.format(end);
    
    // Remove leading zero from hour if present
    startFormatted = startFormatted.replaceFirst(RegExp(r'^0'), '');
    endFormatted = endFormatted.replaceFirst(RegExp(r'^0'), '');
    
    // Capitalize AM/PM
    startFormatted = startFormatted.toUpperCase();
    endFormatted = endFormatted.toUpperCase();
    
    // Return the formatted time range
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
    return formatter.format(dateTime);
  }

  static String formatDateTimeWithDash(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static String formatDateTimeLong(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd, yyyy hh:mma');
    return formatter.format(dateTime);
  }

  static String formatDateTimeMedium(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd, hh:mma');
    return formatter.format(dateTime);
  }

  static String formatDateTimeShort(DateTime dateTime) {
    DateFormat formatter = DateFormat('dd MMM, hh:mma');
    return formatter.format(dateTime);
  }

  static String formatDateTimeWithDay(DateTime dateTime) {
    DateFormat formatter = DateFormat('EEE dd MMM, yyyy   hh:mm a');
    return formatter.format(dateTime);
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
