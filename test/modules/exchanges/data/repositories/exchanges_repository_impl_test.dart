import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/data/models/currency_model.dart';
import 'package:mb_challenge/modules/exchanges/data/models/exchange_model.dart';
import 'package:mb_challenge/modules/exchanges/data/repositories/exchanges_repository_impl.dart';
import 'package:mb_challenge/modules/exchanges/data/datasources/exchanges_remote_datasource.dart';

import 'package:mocktail/mocktail.dart';

class MockExchangesRemoteDataSource extends Mock
    implements ExchangesRemoteDataSource {}

void main() {
  late ExchangesRepositoryImpl repository;
  late MockExchangesRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockExchangesRemoteDataSource();
    repository = ExchangesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  test(
    'getExchange calls remoteDataSource.getExchange and returns Exchange',
    () async {
      final exchange = ExchangeModel(id: 1, name: 'Test Exchange');
      when(
        () => mockRemoteDataSource.getExchange(1),
      ).thenAnswer((_) async => exchange);

      final result = await repository.getExchange(1);

      expect(result, exchange);
      verify(() => mockRemoteDataSource.getExchange(1)).called(1);
    },
  );

  test(
    'getExchangeAssets calls remoteDataSource.getExchangeCurrencies and returns List<Currency>',
    () async {
      final currencies = [
        CurrencyModel(
          cryptoId: 1,
          name: 'Bitcoin',
          symbol: 'BTC',
          priceUsd: 65000.0,
        ),
      ];
      when(
        () => mockRemoteDataSource.getExchangeCurrencies(1),
      ).thenAnswer((_) async => currencies);

      final result = await repository.getExchangeAssets(1);

      expect(result, currencies);
      verify(() => mockRemoteDataSource.getExchangeCurrencies(1)).called(1);
    },
  );
}
