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
