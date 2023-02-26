import 'package:flutter/material.dart';

class CurrentCurrency with ChangeNotifier {
  String _currentCurrencyCode = 'USD';

  String get currentCurrencyCode => _currentCurrencyCode;

  void setCurrency(String code) {
    _currentCurrencyCode = code;
    notifyListeners();
  }
}
