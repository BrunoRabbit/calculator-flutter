import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isThemeChanged = false;

  changeTheme() {
    isThemeChanged = !isThemeChanged;
    notifyListeners();
  }
}
