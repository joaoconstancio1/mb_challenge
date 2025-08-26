import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final Exchange exchange;
  final List<Currency> assets;

  ExchangeLoaded(this.exchange, {this.assets = const []});
}

class ExchangeError extends ExchangeState {
  final String message;

  ExchangeError(this.message);
}
