import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_cubit.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockExchangeRepository extends Mock implements ExchangeRepository {}

void main() {
  late MockExchangeRepository repository;
  late ExchangeCubit cubit;

  setUp(() {
    repository = MockExchangeRepository();
    cubit = ExchangeCubit(repository: repository);
  });

  final exchange = Exchange(id: 1, name: 'Test Exchange');
  final assets = [Currency(cryptoId: 1, name: 'USD')];

  group('ExchangeCubit', () {
    test('initial state is ExchangeInitial', () {
      expect(cubit.state, ExchangeInitial());
    });

    blocTest<ExchangeCubit, ExchangeState>(
      'emits [ExchangeLoading, ExchangesLoaded] when getExchanges succeeds',
      build: () {
        for (final id in cubit.exchangeIds) {
          when(
            () => repository.getExchange(id),
          ).thenAnswer((_) async => exchange);
          when(
            () => repository.getExchangeAssets(id),
          ).thenAnswer((_) async => assets);
        }
        return cubit;
      },
      act: (cubit) => cubit.getExchanges(),
      expect: () => [ExchangeLoading(), isA<ExchangesLoaded>()],
      verify: (_) {
        for (final id in cubit.exchangeIds) {
          verify(() => repository.getExchange(id)).called(1);
          verify(() => repository.getExchangeAssets(id)).called(1);
        }
      },
    );

    blocTest<ExchangeCubit, ExchangeState>(
      'emits [ExchangeLoading, ExchangeError] when getExchanges throws',
      build: () {
        when(() => repository.getExchange(any())).thenThrow(Exception('error'));
        return cubit;
      },
      act: (cubit) => cubit.getExchanges(),
      expect: () => [ExchangeLoading(), isA<ExchangeError>()],
    );
  });
}
