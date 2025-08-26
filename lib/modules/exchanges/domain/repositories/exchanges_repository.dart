import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

abstract class ExchangeRepository {
  Future<Exchange> getExchange(int id);
}
