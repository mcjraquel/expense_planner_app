import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bin.dart';
import 'models/transaction.dart';
import 'providers/dark_mode.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkMode()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Financial Tracker App',
        theme: context.watch<DarkMode>().currentTheme,
        home: const MyHomePage(title: 'Summary'),
        routes: {BinDetailScreen.routeName: (ctx) => const BinDetailScreen()});
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MainState();
}

class _MainState extends State<MyHomePage> {
  final List<Bin> bins = [
    Bin(id: '1', type: 'Inflow', name: 'Emergency Fund', total: 8000),
    Bin(id: '2', type: 'Outflow', name: 'Trip Savings', total: 5000)
  ];
  final List<Transaction> transactions = [
    Transaction(
        id: '1',
        type: 'Inflow',
        bin: '1',
        purpose: 'basta',
        amount: 500,
        date: DateTime.now())
  ];

  var _currentTab = 'summary';

  void _changeTab(String tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  void addNewBintoBinsList(String newBinName, String newBinType) {
    final newBin = Bin(id: '3', name: newBinName, type: newBinType, total: 0);
    setState(() {
      bins.add(newBin);
    });
  }

  void addNewTransactiontoTransactionsList(String newTxType,
      String newTxPurpose, String newTxBin, double newTxAmount) {
    newTxAmount = newTxType == 'Inflow' ? newTxAmount : -newTxAmount;
    final newTx = Transaction(
        id: '2',
        type: newTxType,
        purpose: newTxPurpose,
        bin: newTxBin,
        amount: newTxAmount,
        date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
    updateBinTotal(newTxBin, newTxAmount);
  }

  void updateBinTotal(String binToUpdate, double amount) {
    var binObj = bins.singleWhere((bin) => bin.id == binToUpdate);
    var binTransactions = transactions.where((tx) => tx.bin == binObj.id);
    double binTotal =
        binTransactions.map((tx) => tx.amount).reduce((sum, amt) => sum + amt);
    binObj.total = binTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentTab)),
      body: SingleChildScrollView(
        child: _currentTab == 'summary'
            ? SummaryPage(bins: bins, addNewBinFunction: addNewBintoBinsList)
            : TransactionsPage(
                transactions: transactions,
                bins: bins,
                addNewTxFunction: addNewTransactiontoTransactionsList),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 80,
        child: Row(children: <Widget>[
          TextButton(
              onPressed: () => _changeTab('summary'),
              child: const Text("summary")),
          TextButton(
              onPressed: () => _changeTab('transactions'),
              child: const Text("transactions"))
        ]),
      )),
    );
  }
}
