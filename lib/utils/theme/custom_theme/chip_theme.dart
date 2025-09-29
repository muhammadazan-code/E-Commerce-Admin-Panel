import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColor.grey.withOpacity(.4),
    labelStyle: TextStyle(color: TColor.black),
    selectedColor: TColor.primaryColor,
    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
    checkmarkColor: TColor.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: TColor.darkerGrey,
    labelStyle: TextStyle(color: TColor.white),
    selectedColor: TColor.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: TColor.white,
  );
}
