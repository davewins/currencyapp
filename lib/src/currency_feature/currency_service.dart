import 'currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyService {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'api_key': 'a88pyfx7ckzs3bay8yefrawj'
  };

  List parseCurrencies(String responseBody) {
    final jsonResponse = json
        .decode(responseBody)
        .map((responseBody) => Currency.fromJson(responseBody))
        .toList();
    return jsonResponse;
  }

  Future<List> fetchCurrencies() async {
    final response = await http.get(
        Uri.parse(
            'https://emeapresalesnorth.api.mashery.com/3vkhozj5be3oozma5gxycts3net6nf2d/currencies'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      return parseCurrencies(response.body);
    } else {
      throw Exception("Error: " +
          response.statusCode.toString() +
          ': Unable to get date from REST API');
    }
  }
}
