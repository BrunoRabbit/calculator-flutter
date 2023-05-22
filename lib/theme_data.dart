import 'package:calculator/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ActualTheme {
  // ? Light Theme
  static final ThemeData themeLight = ThemeData.from(
    colorScheme: _lightColorScheme,
  );

  static final ColorScheme _lightColorScheme = ThemeData().colorScheme.copyWith(
        primary: AppColors.kLightEqualButton,
        secondary: AppColors.kLightButtonColor,
        tertiary: AppColors.kLightTextColor,
        background: AppColors.kLightBackground,
        brightness: Brightness.light,
      );

  // ? Dark Theme
  static final ThemeData themeDark = ThemeData.from(
    colorScheme: _darkColorScheme,
  );
  static final ColorScheme _darkColorScheme = ThemeData().colorScheme.copyWith(
        primary: AppColors.kButtonEqualBackgroundColor,
        secondary: AppColors.kButtonBackgroundColor,
        tertiary: AppColors.kNumberOperationColor,
        background: AppColors.kBackgroundColor,
        brightness: Brightness.dark,
      );
}
