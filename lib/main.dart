import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bin.dart';
import 'models/transaction.dart';
import 'providers/dark_mode.dart';
import 'providers/bins.dart';
import 'providers/current_currency.dart';
import 'providers/transactions.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkMode()),
    ChangeNotifierProvider(create: (_) => Bins()),
    ChangeNotifierProvider(create: (_) => Transactions()),
    ChangeNotifierProvider(create: (_) => CurrentCurrency()),
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
  var _currentTab = 'summary';

  void _changeTab(String tab) {
    setState(() {
      _currentTab = tab;
    });
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
