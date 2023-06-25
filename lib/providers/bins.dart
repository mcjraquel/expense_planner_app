import 'package:flutter/material.dart';
import '../models/bin.dart';

class Bins with ChangeNotifier {
  final List<Bin> _bins = [];

  List<Bin> get bins => _bins;

  void addNewBintoBinsList(String newBinName) {
    final newBin = Bin(name: newBinName, total: 0);
    _bins.add(newBin);
    notifyListeners();
  }
}
