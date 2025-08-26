import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    super.cryptoId,
    super.name,
    super.symbol,
    super.priceUsd,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    final currency = json['currency'];
    return CurrencyModel(
      cryptoId: currency['crypto_id'],
      name: currency['name'],
      symbol: currency['symbol'],
      priceUsd: (currency['price_usd'] as num).toDouble(),
    );
  }
}
