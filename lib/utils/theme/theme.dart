import 'package:e_commerce_web/utils/theme/custom_theme/appbar_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/chip_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/text_field_theme.dart';
import 'package:e_commerce_web/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._(); // Private Constructor
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    fontFamily: 'Urbanist',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    useMaterial3: true,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    scaffoldBackgroundColor: Colors.black,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
  );
}
