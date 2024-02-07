import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum AppTheme {
  Default,
}

final appThemeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Inter',
    primaryColor: const Color(0xFFFF1759),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xFFFF1759),
          secondary: const Color(0xFFBF0036),
          background: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFF1F1F1F),
          secondaryContainer: const Color(0xFF9A9A9A),
          onSecondary: const Color(0XFF696969),
        ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
    ),
  ),
};
