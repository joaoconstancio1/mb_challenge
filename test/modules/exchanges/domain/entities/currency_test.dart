import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

void main() {
  group('Currency', () {
    test('should support value equality', () {
      const currency1 = Currency(
        cryptoId: 1,
        name: 'Bitcoin',
        symbol: 'BTC',
        priceUsd: 50000.0,
      );
      const currency2 = Currency(
        cryptoId: 1,
        name: 'Bitcoin',
        symbol: 'BTC',
        priceUsd: 50000.0,
      );
      expect(currency1, equals(currency2));
    });

    test('should have correct props', () {
      const currency = Currency(
        cryptoId: 2,
        name: 'Ethereum',
        symbol: 'ETH',
        priceUsd: 4000.0,
      );
      expect(currency.props, [2, 'Ethereum', 'ETH', 4000.0]);
    });

    test('should allow null values', () {
      const currency = Currency();
      expect(currency.cryptoId, isNull);
      expect(currency.name, isNull);
      expect(currency.symbol, isNull);
      expect(currency.priceUsd, isNull);
    });
  });
}
