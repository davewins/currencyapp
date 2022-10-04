import 'package:flutter/material.dart';

import 'currency.dart';
import 'currency_service.dart';
import 'currency_details_view.dart';
import '../settings/settings_view.dart';

/// Displays a list of Currencies.
class CurrencyListView extends StatelessWidget {
  CurrencyListView({Key? key}) : super(key: key);

  static const routeName = '/currencies';
  final currencyService = CurrencyService();

  Widget currencyWidget() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot currencySnap) {
        if (!currencySnap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: currencySnap.data.length,
          itemBuilder: (context, index) {
            Currency currency = currencySnap.data[index];
            return Card(
              child: ListTile(
                title: Text(currency.country),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CurrencyDetail(
                            currency: currencySnap.data[index],
                          )));
                },
              ),
            );
          },
        );
      },
      future: currencyService.fetchCurrencies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currencies'), actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Navigate to the settings page. If the user leaves and returns
            // to the app after it has been killed while running in the
            // background, the navigation stack is restored.
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ]),
      body: currencyWidget(),
    );
  }
}
