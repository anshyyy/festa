import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:sizer/sizer.dart';

enum AppTheme {
  Default,
}

final appThemeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Inter',
    primaryColor: const Color(0xFFFF1759),
    scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xFFFF1759),
          secondary: const Color(0xFFBF0036),
          // tertiary: const Color(0xff64C2F5),
          background: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFF1F1F1F),
          // secondaryContainer: Colors.white,
          // tertiaryContainer: const Color(0xffEEEEEE),
          // onTertiaryContainer: const Color(0xFF3A444F),
          // onPrimaryContainer: const Color(0xFFF2F4F7),
          // onSecondaryContainer: const Color(0xFF1AA652),
          // onTertiary: const Color(0xFF54616C),
          // onBackground: const Color(0xFF888888),
          // outline: const Color(0xFFDDE1EE),
          // onPrimary: const Color(0xFF003756),
          // onError: const Color(0xFFF44F40),
          // onSurface: const Color(0xFF1E1E1E),
          // onSecondary: const Color(0xFfD2D2D2),
          // error: const Color(0xFFEA6161),
          // inversePrimary: const Color(0xFFDDDDDD),
          // surface: const Color(0xFFAFD6F5),
          // inverseSurface: const Color(0xFF02101F),
          // onInverseSurface: const Color(0xFF0487E2),
          // shadow: const Color(0xFF3A444F),
          // onErrorContainer: const Color(0xFF0363CA),
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
        fontWeight: FontWeight.w400,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w200,
        color: const Color(0xFF9A9A9A),
        fontFamily: 'Inter',
      ),
    ),
  ),
};
