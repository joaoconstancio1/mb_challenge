import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

void main() {
  group('Exchange Entity', () {
    test('formattedDateLaunched returns formatted date', () {
      final exchange = Exchange(dateLaunched: '2023-06-01');
      expect(exchange.formattedDateLaunched, '01/06/2023');
    });

    test('formattedDateLaunched returns "-" for null or empty', () {
      expect(Exchange(dateLaunched: null).formattedDateLaunched, '-');
      expect(Exchange(dateLaunched: '').formattedDateLaunched, '-');
    });

    test('formattedDateLaunched returns "-" for invalid date', () {
      expect(Exchange(dateLaunched: 'invalid-date').formattedDateLaunched, '-');
    });

    test('props contains all fields', () {
      final urls = Urls(website: ['https://test.com']);
      final exchange = Exchange(
        id: 1,
        name: 'Test',
        slug: 'test',
        logo: 'logo.png',
        description: 'desc',
        dateLaunched: '2023-06-01',
        notice: 'notice',
        fiats: ['USD'],
        type: 'spot',
        makerFee: 0.1,
        takerFee: 0.2,
        weeklyVisits: 1000,
        spotVolumeUsd: 50000.0,
        spotVolumeLastUpdated: '2023-06-02',
        urls: urls,
        porStatus: 1,
        porAuditStatus: 2,
        walletSourceStatus: 3,
        porSwitch: 'on',
        alertType: 1,
        alertLink: 'alert.com',
        isHidden: 0,
        isRedistributable: 1,
        onRampDirectDeposit: 'yes',
        onRampCardVisaMastercard: 'yes',
        onRampGoogleApplePay: 'no',
        onRampThirdParty: 'no',
        onRampP2p: 'yes',
        offRampDirectWithdrawal: 'yes',
        offRampP2p: 'no',
      );
      expect(exchange.props.contains(urls), true);
      expect(exchange.props.contains(1), true);
      expect(exchange.props.contains('Test'), true);
      expect(exchange.props.contains('spot'), true);
      expect(exchange.props.contains(0.1), true);
      expect(exchange.props.contains(0.2), true);
      expect(exchange.props.contains(1000), true);
      expect(exchange.props.contains(50000.0), true);
    });

    test('Urls fields are set correctly', () {
      final urls = Urls(
        actual: ['actual'],
        fee: ['fee'],
        register: ['register'],
        twitter: ['twitter'],
        chat: ['chat'],
        website: ['website'],
      );
      expect(urls.actual, ['actual']);
      expect(urls.fee, ['fee']);
      expect(urls.register, ['register']);
      expect(urls.twitter, ['twitter']);
      expect(urls.chat, ['chat']);
      expect(urls.website, ['website']);
    });
  });
}
