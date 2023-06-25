import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/selected_bin.dart';
import '../providers/bins.dart';

import '../models/bin.dart';

class BinDetailScreen extends StatelessWidget {
  // final List<Transaction> binTransactions;

  const BinDetailScreen({super.key});

  static const routeName = '/bin-detail-screen';

  @override
  Widget build(BuildContext context) {
    final Bin defaultBin = Bin(name: 'sfsdf', total: 0);
    List<Bin> bins = context.watch<Bins>().bins;
    Bin binToShow = bins.singleWhere(
        (bin) => bin.id == context.watch<SelectedBin>().selectedBinId,
        orElse: () => defaultBin);

    return Scaffold(
      appBar: AppBar(title: Text(binToShow.name)),
    );
  }
}

Route createBinDetailRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BinDetailScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      });
}
