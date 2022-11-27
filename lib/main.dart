import 'package:flutter/material.dart';

import 'models/bin.dart';
import 'models/transaction.dart';
import 'summary_page.dart';
import 'transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Summary'),
    );
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentTab)),
      body: _currentTab == 'summary'
          ? SummaryPage(bins: bins, addNewBinFunction: addNewBintoBinsList)
          : TransactionsPage(
              transactions: transactions,
              bins: bins,
              addNewTxFunction: addNewTransactiontoTransactionsList),
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
