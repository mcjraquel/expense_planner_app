import 'package:flutter/material.dart';

import '../summary_page.dart';
import '../transactions_page.dart';
import '../settings_page.dart';

enum AppTab { summary, transactions, settings }

class CurrentTab with ChangeNotifier {
  AppTab _currentTab = AppTab.summary;
  Widget _currentTabWidget = const SummaryPage();

  AppTab get currentTab => _currentTab;
  Widget get currentTabWidget => _currentTabWidget;

  void changeTab(AppTab tab) {
    _currentTab = tab;

    if (_currentTab == AppTab.summary) {
      _currentTabWidget = const SummaryPage();
    } else if (_currentTab == AppTab.transactions) {
      _currentTabWidget = const TransactionsPage();
    } else {
      _currentTabWidget = const SettingsPage();
    }

    notifyListeners();
  }
}
