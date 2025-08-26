import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final Exchange exchange;

  ExchangeLoaded(this.exchange);
}

class ExchangeError extends ExchangeState {
  final String message;

  ExchangeError(this.message);
}
