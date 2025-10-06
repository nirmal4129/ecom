import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: TColors.grey.withValues(alpha: 0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: TColors.primary,
      padding: EdgeInsets.all(12),
      checkmarkColor: Colors.white
  );
  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: TColors.darkerGrey,
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: TColors.primary,
      padding: EdgeInsets.all(12),
      checkmarkColor: Colors.white
  );
}