import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  final ExchangeRepository repository;

  ExchangeCubit({required this.repository}) : super(ExchangeInitial());

  Future<void> getExchange() async {
    int id = 270;
    emit(ExchangeLoading());
    try {
      final exchange = await repository.getExchange(id);
      emit(ExchangeLoaded(exchange));
    } catch (e) {
      emit(ExchangeError(e.toString()));
    }
  }
}
