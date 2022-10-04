/// A  class that represents a currency.
class Currency {
  final String code;
  final String country;

  const Currency({required this.code, required this.country});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
        code: json['currency_code'] ?? '',
        country: json['country'] ??
            ''); //Using ?? '' to cope with cases where fields are null
  }
}
