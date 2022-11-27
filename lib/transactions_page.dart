import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_card.dart';

class TransactionsPage extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsPage({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(children: <Widget>[
        const AddNewTransactionCard(),
        ...transactions
            .map((transaction) => TransactionCard(transaction: transaction))
            .toList(),
      ]),
    ));
  }
}
