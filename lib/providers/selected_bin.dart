import 'package:flutter/material.dart';

import '../models/bin.dart';
import '../providers/bins.dart';

class SelectedBin with ChangeNotifier {
  String _selectedBinId = '0';

  String get selectedBinId => _selectedBinId;

  void selectBin(binId) {
    _selectedBinId = binId;
    notifyListeners();
  }
}
