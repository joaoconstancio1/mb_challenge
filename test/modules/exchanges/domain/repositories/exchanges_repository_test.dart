import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';

class MockExchangeRepository implements ExchangeRepository {
  @override
  Future<Exchange> getExchange(int id) async {
    return Exchange(id: id, name: 'Mock Exchange');
  }

  @override
  Future<List<Currency>> getExchangeAssets(int id) async {
    return [
      Currency(cryptoId: 1, name: 'USD'),
      Currency(cryptoId: 2, name: 'EUR'),
    ];
  }
}

void main() {
  late ExchangeRepository repository;

  setUp(() {
    repository = MockExchangeRepository();
  });

  test('getExchange returns correct Exchange', () async {
    final exchange = await repository.getExchange(1);
    expect(exchange, isA<Exchange>());
    expect(exchange.id, 1);
    expect(exchange.name, 'Mock Exchange');
  });

  test('getExchangeAssets returns list of Currency', () async {
    final assets = await repository.getExchangeAssets(1);
    expect(assets, isA<List<Currency>>());
    expect(assets.length, 2);
    expect(assets[0].name, 'USD');
    expect(assets[1].name, 'EUR');
  });
}
