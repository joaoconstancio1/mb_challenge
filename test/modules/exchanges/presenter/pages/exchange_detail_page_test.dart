import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';
import 'package:mb_challenge/modules/exchanges/presenter/pages/exchange_detail_page.dart';

void main() {
  group('ExchangeDetailPage', () {
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

    final assets = [
      Currency(name: 'Bitcoin', priceUsd: 60000.1234),
      Currency(name: 'Ethereum', priceUsd: 3000.5678),
    ];

    testWidgets('renders exchange info correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: ExchangeDetailPage(exchange: exchange)),
      );

      expect(find.widgetWithText(AppBar, 'Binance'), findsOneWidget);

      expect(
        find.descendant(
          of: find.byType(Column).first,
          matching: find.text('Binance'),
        ),
        findsOneWidget,
      );

      expect(find.text('Exchange Info'), findsOneWidget);
      expect(find.text('ID: '), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Description: '), findsOneWidget);
      expect(find.text('Leading crypto exchange'), findsOneWidget);
      expect(find.text('Website: '), findsOneWidget);
      expect(find.text('https://binance.com'), findsOneWidget);
      expect(find.text('Maker Fee: '), findsOneWidget);
      expect(find.text('0.1'), findsOneWidget);
      expect(find.text('Taker Fee: '), findsOneWidget);
      expect(find.text('0.2'), findsOneWidget);
      expect(find.text('Date Launched: '), findsOneWidget);
      expect(find.text('2017-07-14'), findsOneWidget);
      expect(find.text('Spot Volume USD: '), findsOneWidget);
      expect(find.text('123456789.12'), findsOneWidget);
      expect(find.text('Weekly Visits: '), findsOneWidget);
      expect(find.text('1000000'), findsOneWidget);
    });

    testWidgets('renders coins list when assets are provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ExchangeDetailPage(exchange: exchange, assets: assets),
        ),
      );

      expect(find.text('Coins'), findsOneWidget);
      expect(find.text('Bitcoin'), findsOneWidget);
      expect(find.text('\$60000.1234'), findsOneWidget);
      expect(find.text('Ethereum'), findsOneWidget);
      expect(find.text('\$3000.5678'), findsOneWidget);
    });

    testWidgets('shows "-" for missing values', (WidgetTester tester) async {
      final emptyExchange = Exchange();
      await tester.pumpWidget(
        MaterialApp(home: ExchangeDetailPage(exchange: emptyExchange)),
      );

      expect(find.text('-'), findsWidgets);
    });

    testWidgets('renders logo placeholder', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: ExchangeDetailPage(exchange: exchange)),
      );

      final avatarFinder = find.byType(CircleAvatar);
      expect(avatarFinder, findsOneWidget);
    });

    testWidgets('does not render coins card if assets is empty', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ExchangeDetailPage(exchange: exchange, assets: []),
        ),
      );

      expect(find.text('Coins'), findsNothing);
    });
  });
}
