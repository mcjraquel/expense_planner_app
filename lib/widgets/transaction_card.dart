import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';
import '../../models/bin.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.purpose.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            DateFormat("yyyy-MM-dd HH:mm:ss")
                                .parseUTC(transaction.date.toString())
                                .toLocal()
                                .toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          transaction.amount.toStringAsFixed(2),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}

class AddNewTransactionCard extends StatelessWidget {
  final List<Transaction> transactions;
  final List<Bin> bins;
  final Function addNewTxFunction;

  const AddNewTransactionCard(
      {super.key,
      required this.transactions,
      required this.bins,
      required this.addNewTxFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => NewTxForm(
                        transactions: transactions,
                        bins: bins,
                        addTxFunction: addNewTxFunction),
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
                          'ADD NEW TRANSACTION',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    )))));
  }
}

class NewTxForm extends StatefulWidget {
  final List<Transaction> transactions;
  final List<Bin> bins;
  final Function addTxFunction;

  const NewTxForm(
      {super.key,
      required this.transactions,
      required this.bins,
      required this.addTxFunction});

  @override
  State<NewTxForm> createState() => NewTxFormState();
}

class NewTxFormState extends State<NewTxForm> {
  final _newTxPurpose = TextEditingController();
  String _newTxType = 'Inflow';
  String _newTxBin = '1';
  final _newTxAmount = TextEditingController();
  var txTypes = ['Inflow', 'Outflow'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Add New Transaction'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                DropdownButton(
                    value: _newTxType,
                    items: txTypes.map((String txType) {
                      return DropdownMenuItem(
                        value: txType,
                        child: Text(txType),
                      );
                    }).toList(),
                    onChanged: (String? newTxTypeValue) {
                      setState(() {
                        _newTxType = newTxTypeValue!;
                      });
                    }),
                DropdownButton(
                    value: _newTxBin,
                    items: widget.bins.map((Bin txBin) {
                      return DropdownMenuItem(
                        value: txBin.id.toString(),
                        child: Text(txBin.name),
                      );
                    }).toList(),
                    onChanged: (String? newTxBinValue) {
                      setState(() {
                        _newTxBin = newTxBinValue!;
                      });
                    }),
              ],
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Purpose'),
              controller: _newTxPurpose,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: _newTxAmount,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              widget.addTxFunction(_newTxType, _newTxPurpose.text, _newTxBin,
                  double.parse(_newTxAmount.text));
              Navigator.of(context).pop();
            },
            child: const Text("ADD"),
          )
        ]);
  }
}
