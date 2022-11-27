import 'package:flutter/material.dart';

import 'models/bin.dart';
import 'widgets/bin_card.dart';

class SummaryPage extends StatelessWidget {
  final List<Bin> bins;

  const SummaryPage(this.bins);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(children: <Widget>[
        AddNewBinCard(),
        ...bins.map((bin) => BinCard(bin)).toList(),
      ]),
    ));
  }
}
