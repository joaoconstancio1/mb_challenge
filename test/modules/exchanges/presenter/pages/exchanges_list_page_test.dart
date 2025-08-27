import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_cubit.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';
import 'package:mb_challenge/modules/exchanges/presenter/pages/exchanges_list_page.dart';
import 'package:mb_challenge/modules/exchanges/presenter/pages/exchange_detail_page.dart';

class MockExchangeCubit extends Mock implements ExchangeCubit {}

void main() {
  late ExchangeCubit mockCubit;

  final exchange = Exchange(
    id: 1,
    name: 'Binance',
    logo: null,
    description: 'Leading crypto exchange',
    urls: Urls(website: ['https://binance.com']),
    makerFee: 0.1,
    takerFee: 0.2,
    dateLaunched: '2017-07-14',
    spotVolumeUsd: 123456789.12,
    weeklyVisits: 1000000,
  );

  final assets = [Currency(name: 'Bitcoin', priceUsd: 60000.1234)];

  setUp(() {
    mockCubit = MockExchangeCubit();

    when(() => mockCubit.stream).thenAnswer(
      (_) => Stream<ExchangeState>.fromIterable([ExchangeLoading()]),
    );

    when(() => mockCubit.state).thenReturn(ExchangeLoading());
  });

  testWidgets('shows loading indicator when state is ExchangeLoading', (
    tester,
  ) async {
    when(() => mockCubit.state).thenReturn(ExchangeLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ExchangeCubit>.value(
          value: mockCubit,
          child: const ExchangesListView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders list of exchanges when state is ExchangesLoaded', (
    tester,
  ) async {
    when(
      () => mockCubit.state,
    ).thenReturn(ExchangesLoaded([exchange], assetsList: [assets]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ExchangeCubit>.value(
          value: mockCubit,
          child: const ExchangesListView(),
        ),
      ),
    );

    expect(find.text('Binance'), findsOneWidget);
    expect(find.textContaining('Volume:'), findsOneWidget);
    expect(find.textContaining('Launched:'), findsOneWidget);
  });

  testWidgets('shows error message when state is ExchangeError', (
    tester,
  ) async {
    when(() => mockCubit.state).thenReturn(ExchangeError('Failed to load'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ExchangeCubit>.value(
          value: mockCubit,
          child: const ExchangesListView(),
        ),
      ),
    );

    expect(find.text('Error: Failed to load'), findsOneWidget);
  });

  testWidgets('navigates to ExchangeDetailPage when tapping an item', (
    tester,
  ) async {
    when(
      () => mockCubit.state,
    ).thenReturn(ExchangesLoaded([exchange], assetsList: [assets]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ExchangeCubit>.value(
          value: mockCubit,
          child: const ExchangesListView(),
        ),
      ),
    );

    final binanceTile = find.widgetWithText(ListTile, 'Binance');
    await tester.tap(binanceTile);
    await tester.pumpAndSettle();

    expect(find.byType(ExchangeDetailPage), findsOneWidget);
    expect(find.text('Binance'), findsWidgets);
  });
}
