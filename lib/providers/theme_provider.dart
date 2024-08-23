import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode selectedTheme = ThemeMode.light;

  set newTheme(ThemeMode newTheme) {
    selectedTheme = newTheme;
    notifyListeners();
  }
}
