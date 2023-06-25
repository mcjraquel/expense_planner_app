import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/bin.dart';
import '../screens/bin_detail_screen.dart';

import '../providers/current_currency.dart';

class BinCard extends StatelessWidget {
  final Bin bin;

  const BinCard({super.key, required this.bin});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(
        locale: Platform.localeName,
        name: context.watch<CurrentCurrency>().currentCurrencyCode);
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                children: <Widget>[
                  Text(
                    bin.name.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    formatCurrency.format(bin.total),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ))),
    );
  }
}

class AddNewBinCard extends StatelessWidget {
  final List<Bin> bins;
  final Function addNewBinFunction;

  const AddNewBinCard(
      {super.key, required this.bins, required this.addNewBinFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => NewBinForm(
                        bins: bins, addBinFunction: addNewBinFunction),
                  );
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        // To add: Plus icon for adding new bin
                        Text(
                          'ADD NEW BIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    )))));
  }
}

class NewBinForm extends StatefulWidget {
  final List<Bin> bins;
  final Function addBinFunction;

  const NewBinForm(
      {super.key, required this.bins, required this.addBinFunction});

  @override
  State<NewBinForm> createState() => NewBinFormState();
}

class NewBinFormState extends State<NewBinForm> {
  final _newBinName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Add New Bin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Bin Name'),
              controller: _newBinName,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              widget.addBinFunction(_newBinName.text);
              Navigator.of(context).pop();
            },
            child: const Text("ADD"),
          )
        ]);
  }
}
