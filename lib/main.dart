import 'package:flutter/material.dart';

import 'models/bin.dart';
import 'widgets/bin_card.dart';

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
      home: const SummaryPage(title: 'Summary'),
    );
  }
}

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key, required this.title});

  final String title;

  @override
  State<SummaryPage> createState() => _SummaryState();
}

class _SummaryState extends State<SummaryPage> {
  final List<Bin> bins = [
    Bin(id: '1', type: 'Inflow', name: 'Emergency Fund', total: 8000),
    Bin(id: '2', type: 'Outflow', name: 'Trip Savings', total: 5000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Summary')),
        body: Center(
            child: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(children: <Widget>[
            AddNewBinCard(),
            ...bins.map((bin) => BinCard(bin)).toList(),
          ]),
        )));
  }
}
