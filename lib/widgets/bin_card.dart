import 'package:flutter/material.dart';

import '../../models/bin.dart';

class BinCard extends StatelessWidget {
  final Bin bin;

  BinCard(this.bin);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                  children: <Widget>[
                    Text(
                      bin.name.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      bin.total.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ))));
  }
}

class AddNewBinCard extends StatelessWidget {
  AddNewBinCard();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
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
