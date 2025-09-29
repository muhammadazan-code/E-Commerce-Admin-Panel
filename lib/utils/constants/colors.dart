import 'package:flutter/material.dart';

class TColor {
  TColor._();
  // App Basic Colors
  static const Color primaryColor = Color(0XFF4B68FF);
  static const Color secondary = Color(0xffffe24b);
  static const Color accent = Color(0xffb0c7ff);

  // Text Color
  static const textPrimary = Color(0xff333333);
  static const textSecondary = Color(0xff6c7570);
  static const textWhite = Colors.white;

  // Background Color
  static const light = Color(0xfff6f6f6);
  static const dark = Color(0xff272727);
  static const primaryBackground = Color(0xfff3f5ff);

  // Background Container Colors
  static const lightContainer = Color(0xfff6f6f6);
  static final darkContainer = TColor.textWhite.withOpacity(0.1);

  // Border Color
  static const borderPrimary = Color(0xffd9d9d9);
  static const borderSecondary = Color(0xffe6e6e6);

  // Button Color
  static const buttonPrmary = Color(0xff4b68ff);
  static const buttonSecondary = Color(0xff6c7570);
  static const buttonDisabled = Color(0xffc4c4c4);

  // Error and Validation Colors
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976D2);

  // Neutral Shades
  static Color black = Color(0xff232323);
  static Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const grey = Color(0xffe0e0e0);
  static const softGrey = Color(0xfff4f4f4);
  static const lightGrey = Color(0xfff9f9f9);
  static const white = Color(0xffffffff);
  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0XFFff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)],
  );
  // Icons Color
  static const Color blackColor = Colors.black;
  static const Color redColor = Colors.red;
}
