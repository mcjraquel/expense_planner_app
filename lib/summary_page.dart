import 'package:flutter/material.dart';

import 'models/bin.dart';
import 'widgets/bin_card.dart';

class SummaryPage extends StatefulWidget {
  final List<Bin> bins;
  final Function addNewBinFunction;

  const SummaryPage(
      {super.key, required this.bins, required this.addNewBinFunction});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(children: <Widget>[
        AddNewBinCard(
            bins: widget.bins, addNewBinFunction: widget.addNewBinFunction),
        ...widget.bins.map((bin) => BinCard(bin: bin)).toList(),
      ]),
    ));
  }
}
