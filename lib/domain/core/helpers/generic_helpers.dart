import 'package:flutter/material.dart';

import '../constants/string_constants.dart';

class GenericHelpers {
  bool isValidMobile(String phone) {
    final phoneRegExp = RegExp('[0-9]+\$');
    return phoneRegExp.hasMatch(phone);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  String getDynamicLink(String category, String id) {
    return AppConstants.dynamicUrl
        .replaceAll('<category>', category)
        .replaceAll('<id>', id);
  }

  DateTime getDatetimeFromString(String date) {
    final List<String> splitDate = date.split('-');
    return DateTime(
      int.parse(splitDate.first),
      int.parse(splitDate[1]),
      int.parse(splitDate.last),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
