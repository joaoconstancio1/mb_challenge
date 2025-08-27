import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/data/datasources/exchanges_remote_datasource.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/modules/exchanges/data/models/exchange_model.dart';
import 'package:mb_challenge/modules/exchanges/data/models/currency_model.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomHttpClient extends Mock implements CustomHttpClient {}

void main() {
  late ExchangesRemoteDataSourceImpl dataSource;
  late MockCustomHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockCustomHttpClient();
    dataSource = ExchangesRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  group('getExchange', () {
    test('returns ExchangeModel when httpClient returns valid data', () async {
      const id = 1;
      final mockResponse = {
        'data': {
          '1': {'id': 1, 'name': 'Test Exchange'},
        },
      };
      when(
        () => mockHttpClient.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await dataSource.getExchange(id);

      expect(result, isA<ExchangeModel>());
      expect(result.id, 1);
      expect(result.name, 'Test Exchange');
    });

    test('throws when httpClient throws', () async {
      const id = 1;
      when(
        () => mockHttpClient.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(Exception('Network error'));

      expect(() => dataSource.getExchange(id), throwsException);
    });
  });

  group('getExchangeCurrencies', () {
    test(
      'returns list of CurrencyModel when httpClient returns valid data',
      () async {
        const id = 1;
        final mockResponse = {
          'data': [
            {
              'currency': {
                'crypto_id': 1,
                'name': 'Bitcoin',
                'symbol': 'BTC',
                'price_usd': 65000.0,
              },
            },
            {
              'currency': {
                'crypto_id': 2,
                'name': 'Ethereum',
                'symbol': 'ETH',
                'price_usd': 3500.0,
              },
            },
          ],
        };
        when(
          () => mockHttpClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final result = await dataSource.getExchangeCurrencies(id);

        expect(result, isA<List<CurrencyModel>>());
        expect(result.length, 2);
        expect(result[0].cryptoId, 1);
        expect(result[0].name, 'Bitcoin');
        expect(result[0].symbol, 'BTC');
        expect(result[0].priceUsd, 65000.0);
        expect(result[1].cryptoId, 2);
        expect(result[1].name, 'Ethereum');
        expect(result[1].symbol, 'ETH');
        expect(result[1].priceUsd, 3500.0);
      },
    );

    test('throws when httpClient throws', () async {
      const id = 1;
      when(
        () => mockHttpClient.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(Exception('Network error'));

      expect(() => dataSource.getExchangeCurrencies(id), throwsException);
    });
  });
}
