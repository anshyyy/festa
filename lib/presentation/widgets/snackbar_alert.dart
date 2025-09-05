import 'package:flutter/material.dart';

class CustomScaffoldMessenger {
  static Future showSnackBar(
    BuildContext context, {
    required String message,
  }) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: Theme.of(context).textTheme.bodySmall,),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (error) {
      debugPrint("error: ${error.toString()}");
    }
  }

  static Future clearSnackBars(BuildContext context) async {
    try {
      ScaffoldMessenger.of(context).clearSnackBars();
    } catch (error) {
      debugPrint("error: ${error.toString()}");
    }
  }
}
