import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

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
                          transaction.amount.toString(),
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
  const AddNewTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
            child: InkWell(
                onTap: () {
                  print('add new transaction');
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
