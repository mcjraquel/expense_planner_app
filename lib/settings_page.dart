import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_picker/currency_picker.dart';

import 'providers/dark_mode.dart';
import 'providers/current_currency.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: const Text('Currency'),
        subtitle: Text(context.watch<CurrentCurrency>().currentCurrencyCode),
        onTap: () {
          showCurrencyPicker(
            context: context,
            showSearchField: true,
            showCurrencyCode: true,
            showFlag: false,
            onSelect: (Currency currency) =>
                context.read<CurrentCurrency>().setCurrency(currency.code),
          );
        },
      ),
      SwitchListTile(
        title: const Text('Dark Mode'),
        value: context.watch<DarkMode>().isDarkMode,
        onChanged: (bool value) =>
            context.read<DarkMode>().toggleDarkMode(value),
      )
    ]);
  }
}
