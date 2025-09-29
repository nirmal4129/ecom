import 'package:ecom/utils/theme/customthemes/app_bar_theme.dart';
import 'package:ecom/utils/theme/customthemes/bottom_sheet_theme.dart';
import 'package:ecom/utils/theme/customthemes/check_box_theme.dart';
import 'package:ecom/utils/theme/customthemes/chip_theme.dart';
import 'package:ecom/utils/theme/customthemes/elevated_button_theme.dart';
import 'package:ecom/utils/theme/customthemes/outlined_button_theme.dart';
import 'package:ecom/utils/theme/customthemes/text_field_theme.dart';
import 'package:ecom/utils/theme/customthemes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: TColors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}
