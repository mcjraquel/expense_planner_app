import 'package:expense_planner_app/providers/selected_bin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'providers/dark_mode.dart';
import 'providers/bins.dart';
import 'providers/current_currency.dart';
import 'providers/transactions.dart';
import 'providers/current_tab.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkMode()),
    ChangeNotifierProvider(create: (_) => Bins()),
    ChangeNotifierProvider(create: (_) => Transactions()),
    ChangeNotifierProvider(create: (_) => CurrentCurrency()),
    ChangeNotifierProvider(create: (_) => CurrentTab()),
    ChangeNotifierProvider(create: (_) => SelectedBin()),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_currentTab)),
      appBar: AppBar(
          title: Text(context.watch<CurrentTab>().currentTab.toString())),
      body: SingleChildScrollView(
          child: LayoutBuilder(
              builder: (context, constraints) =>
                  context.watch<CurrentTab>().currentTabWidget)),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 80,
        child: Row(children: <Widget>[
          TextButton(
              onPressed: () =>
                  context.read<CurrentTab>().changeTab(AppTab.summary),
              child: const Text("summary")),
          TextButton(
              onPressed: () =>
                  context.read<CurrentTab>().changeTab(AppTab.transactions),
              child: const Text("transactions")),
          TextButton(
              onPressed: () =>
                  context.read<CurrentTab>().changeTab(AppTab.settings),
              child: const Text("settings")),
        ]),
      )),
    );
  }
}
