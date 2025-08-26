import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final int? cryptoId;
  final String? name;
  final String? symbol;
  final double? priceUsd;

  const Currency({this.cryptoId, this.name, this.symbol, this.priceUsd});

  @override
  List<Object?> get props => [cryptoId, name, symbol, priceUsd];
}
