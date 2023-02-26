import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _currentTheme = ThemeData(primaryColor: Colors.blue);

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _currentTheme;

  void toggleDarkMode(value) {
    _isDarkMode = value;
    if (_isDarkMode) {
      _currentTheme =
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue);
    } else {
      _currentTheme = ThemeData(primaryColor: Colors.blue);
    }
    notifyListeners();
  }
}
