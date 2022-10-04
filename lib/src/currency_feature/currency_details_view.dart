import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'currency.dart';

class CurrencyDetail extends StatelessWidget {
  final Currency currency;

  const CurrencyDetail({Key? key, required this.currency}) : super(key: key);
  static const routeName = '/currencyDetail';

  String getCurrencySymbol(String code) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: code);
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currency.country),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(currency.country),
            subtitle: Text("Currency Code: ${currency.code}"),
            trailing: Text(
                style: const TextStyle(fontFamily: ''),
                getCurrencySymbol(currency.code)),
          )
        ],
      ),
    );
  }
}
