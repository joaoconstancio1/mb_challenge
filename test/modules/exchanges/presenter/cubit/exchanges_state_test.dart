import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

void main() {
  group('ExchangeState', () {
    test('ExchangeInitial props should be empty', () {
      final state = ExchangeInitial();
      expect(state.props, []);
    });

    test('ExchangeLoading props should be empty', () {
      final state = ExchangeLoading();
      expect(state.props, []);
    });

    test('ExchangesLoaded props should contain exchanges and assetsList', () {
      final exchange = Exchange(id: 1, name: 'Test Exchange');
      final currency = Currency(cryptoId: 1, name: 'US Dollar');
      final state = ExchangesLoaded(
        [exchange],
        assetsList: [
          [currency],
        ],
      );
      expect(state.exchanges, [exchange]);
      expect(state.assetsList, [
        [currency],
      ]);
      expect(state.props, [
        [exchange],
        [
          [currency],
        ],
      ]);
    });

    test('ExchangesLoaded assetsList defaults to empty list', () {
      final exchange = Exchange(id: 1, name: 'Test Exchange');
      final state = ExchangesLoaded([exchange]);
      expect(state.assetsList, []);
    });

    test('ExchangeError props should contain message', () {
      final state = ExchangeError('An error occurred');
      expect(state.message, 'An error occurred');
      expect(state.props, ['An error occurred']);
    });
  });
}
