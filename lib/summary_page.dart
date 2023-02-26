import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/bin_card.dart';

import 'providers/bins.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

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
            bins: context.watch<Bins>().bins,
            addNewBinFunction: context.read<Bins>().addNewBintoBinsList),
        ...context.watch<Bins>().bins.map((bin) => BinCard(bin: bin)).toList(),
      ]),
    ));
  }
}
