import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLang = 'en';

  set newLang(String newLang) {
    selectedLang = newLang;
    notifyListeners();
  }
}
