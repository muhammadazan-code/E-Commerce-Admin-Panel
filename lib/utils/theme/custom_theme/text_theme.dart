import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  // Customize Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
  );

  // Customize Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
  );
}
