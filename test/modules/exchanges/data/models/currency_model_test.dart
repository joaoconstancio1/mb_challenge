import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/data/models/currency_model.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

void main() {
  group('CurrencyModel', () {
    test('fromJson creates correct CurrencyModel', () {
      final json = {
        'currency': {
          'crypto_id': 1,
          'name': 'Bitcoin',
          'symbol': 'BTC',
          'price_usd': 65000.0,
        },
      };

      final model = CurrencyModel.fromJson(json);

      expect(model.cryptoId, 1);
      expect(model.name, 'Bitcoin');
      expect(model.symbol, 'BTC');
      expect(model.priceUsd, 65000.0);
    });

    test('fromJson handles price_usd as int', () {
      final json = {
        'currency': {
          'crypto_id': 1,
          'name': 'Ethereum',
          'symbol': 'ETH',
          'price_usd': 3500,
        },
      };

      final model = CurrencyModel.fromJson(json);

      expect(model.priceUsd, 3500.0);
    });

    test('CurrencyModel is a Currency', () {
      final model = CurrencyModel(
        cryptoId: 1,
        name: 'Dogecoin',
        symbol: 'DOGE',
        priceUsd: 0.25,
      );

      expect(model, isA<CurrencyModel>());
      expect(model, isA<Currency>());
    });
  });
}
