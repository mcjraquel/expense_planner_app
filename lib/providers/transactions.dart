import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../models/bin.dart';

class Transactions with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addNewTransactiontoTransactionsList(
      TransactionType newTxType,
      String newTxPurpose,
      String newTxBin,
      double newTxAmount,
      List<Bin> existingBinsList) {
    newTxAmount =
        newTxType == TransactionType.inflow ? newTxAmount : -newTxAmount;
    final newTx = Transaction(
        type: newTxType,
        purpose: newTxPurpose,
        bin: newTxBin,
        amount: newTxAmount,
        date: DateTime.now());
    _transactions.add(newTx);
    updateBinTotal(existingBinsList, newTxBin, newTxAmount);
    notifyListeners();
  }

  void updateBinTotal(List<Bin> bins, String binToUpdate, double amount) {
    var binObj = bins.singleWhere((bin) => bin.id == binToUpdate);
    var binTransactions = transactions.where((tx) => tx.bin == binObj.id);
    double binTotal =
        binTransactions.map((tx) => tx.amount).reduce((sum, amt) => sum + amt);
    binObj.total = binTotal;
    notifyListeners();
  }
}
