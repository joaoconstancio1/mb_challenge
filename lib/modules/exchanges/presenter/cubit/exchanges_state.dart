import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangesLoaded extends ExchangeState {
  final List<Exchange> exchanges;
  final List<List<Currency>> assetsList;

  ExchangesLoaded(this.exchanges, {this.assetsList = const []});
}

class ExchangeError extends ExchangeState {
  final String message;

  ExchangeError(this.message);
}
