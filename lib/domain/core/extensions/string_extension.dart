import 'package:flutter/services.dart';

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
