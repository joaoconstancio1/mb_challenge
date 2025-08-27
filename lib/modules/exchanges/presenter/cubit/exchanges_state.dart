import 'package:equatable/equatable.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

abstract class ExchangeState extends Equatable {}

class ExchangeInitial extends ExchangeState {
  @override
  List<Object?> get props => [];
}

class ExchangeLoading extends ExchangeState {
  @override
  List<Object?> get props => [];
}

class ExchangesLoaded extends ExchangeState {
  final List<Exchange> exchanges;
  final List<List<Currency>> assetsList;

  ExchangesLoaded(this.exchanges, {this.assetsList = const []});

  @override
  List<Object?> get props => [exchanges, assetsList];
}

class ExchangeError extends ExchangeState {
  final String message;

  ExchangeError(this.message);

  @override
  List<Object?> get props => [message];
}
