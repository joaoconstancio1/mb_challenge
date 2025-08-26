import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

import '../../domain/entities/exchange.dart';
import '../../domain/repositories/exchanges_repository.dart';
import '../datasources/exchanges_remote_datasource.dart';

class ExchangesRepositoryImpl implements ExchangeRepository {
  final ExchangesRemoteDataSource remoteDataSource;

  ExchangesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Exchange> getExchange(int id) {
    return remoteDataSource.getExchange(id);
  }

  @override
  Future<List<Currency>> getExchangeAssets(int id) {
    return remoteDataSource.getExchangeCurrencies(id);
  }
}
