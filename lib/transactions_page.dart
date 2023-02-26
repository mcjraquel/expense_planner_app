import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/transaction.dart';
import 'models/bin.dart';
import 'widgets/transaction_card.dart';
import 'providers/transactions.dart';
import 'providers/bins.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

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
            transactions: context.read<Transactions>().transactions,
            bins: context.watch<Bins>().bins,
            addNewTxFunction: context
                .read<Transactions>()
                .addNewTransactiontoTransactionsList),
        ...context
            .watch<Transactions>()
            .transactions
            .map((transaction) => TransactionCard(transaction: transaction))
            .toList(),
      ]),
    ));
  }
}
