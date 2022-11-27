import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'models/bin.dart';
import 'widgets/transaction_card.dart';

class TransactionsPage extends StatefulWidget {
  final List<Transaction> transactions;
  final List<Bin> bins;
  final Function addNewTxFunction;

  const TransactionsPage(
      {super.key,
      required this.transactions,
      required this.bins,
      required this.addNewTxFunction});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(children: <Widget>[
        AddNewTransactionCard(
            transactions: widget.transactions,
            bins: widget.bins,
            addNewTxFunction: widget.addNewTxFunction),
        ...widget.transactions
            .map((transaction) => TransactionCard(transaction: transaction))
            .toList(),
      ]),
    ));
  }
}
