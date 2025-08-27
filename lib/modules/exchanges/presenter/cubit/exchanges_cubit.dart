import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  final ExchangeRepository repository;

  ExchangeCubit({required this.repository}) : super(ExchangeInitial());

  final List<int> exchangeIds = [270, 50, 24, 267];

  Future<void> getExchanges() async {
    emit(ExchangeLoading());

    try {
      final futures = exchangeIds.map((id) async {
        final exchange = await repository.getExchange(id);
        final assets = await repository.getExchangeAssets(id);
        return {'exchange': exchange, 'assets': assets};
      }).toList();

      final results = await Future.wait(futures);

      final exchanges = results.map((r) => r['exchange'] as Exchange).toList();
      final assetsList = results
          .map((r) => r['assets'] as List<Currency>)
          .toList();

      emit(ExchangesLoaded(exchanges, assetsList: assetsList));
    } catch (e) {
      emit(ExchangeError(e.toString()));
    }
  }
}
