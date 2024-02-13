import 'package:flutter/material.dart';

class GenericHelpers {
  bool isValidMobile(String phone) {
    final phoneRegExp = RegExp('[0-9]+\$');
    return phoneRegExp.hasMatch(phone);
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
