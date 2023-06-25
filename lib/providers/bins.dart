import 'package:flutter/material.dart';
import '../models/bin.dart';

class Bins with ChangeNotifier {
  final List<Bin> _bins = [
    Bin(id: '1', type: 'Inflow', name: 'Emergency Fund', total: 8000),
    Bin(id: '2', type: 'Outflow', name: 'Trip Savings', total: 5000)
  ];

  List<Bin> get bins => _bins;

  void addNewBintoBinsList(String newBinName) {
    final newBin = Bin(name: newBinName, total: 0);
    _bins.add(newBin);
    notifyListeners();
  }
}
