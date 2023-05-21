import 'package:calculator/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ActualTheme {
  // static final
  ThemeData themeLight = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kLightEqualButton,
          secondary: AppColors.kLightButtonColor,
          tertiary: AppColors.kLightTextColor,
          background: AppColors.kLightBackground,
          brightness: Brightness.light,
        ),
  );

  // static final
  ThemeData themeDark = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kButtonEqualBackgroundColor,
          secondary: AppColors.kButtonBackgroundColor,
          tertiary: AppColors.kNumberOperationColor,
          background: AppColors.kBackgroundColor,
          brightness: Brightness.dark,
        ),

    // colorScheme: ColorScheme.fromSwatch(
    //   accentColor: Colors.yellow,
    //   backgroundColor: Colors.green,
    //   cardColor: Colors.brown,
    //   primaryColorDark: Colors.purple,
    //   primarySwatch: Colors.red,
    // ),
    // primaryColor: Colors.red,
  );
  // primaryColor: AppColors.kButtonEqualBackgroundColor,

  // colorScheme: ColorScheme.dark().copyWith(background: Colors.red),
}
