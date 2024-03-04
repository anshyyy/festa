import 'package:flutter/material.dart';

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
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
