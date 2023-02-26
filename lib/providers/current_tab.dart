import 'package:flutter/material.dart';

import '../summary_page.dart';
import '../transactions_page.dart';
import '../settings_page.dart';

class CurrentTab with ChangeNotifier {
  String _currentTab = 'summary';
  Widget _currentTabWidget = const SummaryPage();

  String get currentTab => _currentTab;
  Widget get currentTabWidget => _currentTabWidget;

  void changeTab(String tab) {
    _currentTab = tab;

    if (_currentTab == 'summary') {
      _currentTabWidget = const SummaryPage();
    } else if (_currentTab == 'transactions') {
      _currentTabWidget = const TransactionsPage();
    } else {
      _currentTabWidget = const SettingsPage();
    }

    notifyListeners();
  }
}
