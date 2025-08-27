import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/modules/exchanges/data/models/exchange_model.dart';

void main() {
  group('ExchangeModel', () {
    test('fromJson creates correct ExchangeModel', () {
      final mockJson = {
        'id': 1,
        'name': 'Binance',
        'slug': 'binance',
        'logo': 'logo_url',
        'description': 'A crypto exchange',
        'date_launched': '2017-07-14',
        'notice': 'No notice',
        'fiats': ['USD', 'EUR'],
        'type': 'spot',
        'maker_fee': 0.1,
        'taker_fee': 0.2,
        'weekly_visits': 1000000,
        'spot_volume_usd': 50000000.0,
        'spot_volume_last_updated': '2024-06-01',
        'urls': {
          'actual': ['https://binance.com'],
          'fee': ['https://binance.com/fees'],
          'register': ['https://binance.com/register'],
          'twitter': ['https://twitter.com/binance'],
          'chat': ['https://t.me/binance'],
          'website': ['https://binance.com'],
        },
        'por_switch': 'yes',
        'porStatus': 1,
        'porAuditStatus': 2,
        'walletSourceStatus': 3,
        'is_hidden': 0,
        'is_redistributable': 1,
        'on_ramp_direct_deposit': 'yes',
        'on_ramp_card_visa_mastercard': 'yes',
        'on_ramp_google_apple_pay': 'no',
        'on_ramp_third_party': 'no',
        'off_ramp_direct_withdrawal': 'yes',
      };

      final model = ExchangeModel.fromJson(mockJson);

      expect(model.id, 1);
      expect(model.name, 'Binance');
      expect(model.slug, 'binance');
      expect(model.logo, 'logo_url');
      expect(model.description, 'A crypto exchange');
      expect(model.dateLaunched, '2017-07-14');
      expect(model.notice, 'No notice');
      expect(model.fiats, ['USD', 'EUR']);
      expect(model.type, 'spot');
      expect(model.makerFee, 0.1);
      expect(model.takerFee, 0.2);
      expect(model.weeklyVisits, 1000000);
      expect(model.spotVolumeUsd, 50000000.0);
      expect(model.spotVolumeLastUpdated, '2024-06-01');
      expect(model.urls?.actual, ['https://binance.com']);
      expect(model.urls?.fee, ['https://binance.com/fees']);
      expect(model.urls?.register, ['https://binance.com/register']);
      expect(model.urls?.twitter, ['https://twitter.com/binance']);
      expect(model.urls?.chat, ['https://t.me/binance']);
      expect(model.urls?.website, ['https://binance.com']);
      expect(model.porSwitch, 'yes');
      expect(model.porStatus, 1);
      expect(model.porAuditStatus, 2);
      expect(model.walletSourceStatus, 3);
      expect(model.isHidden, 0);
      expect(model.isRedistributable, 1);
      expect(model.onRampDirectDeposit, 'yes');
      expect(model.onRampCardVisaMastercard, 'yes');
      expect(model.onRampGoogleApplePay, 'no');
      expect(model.onRampThirdParty, 'no');
      expect(model.offRampDirectWithdrawal, 'yes');
    });

    test('fromJson handles null and missing fields', () {
      final json = {
        'id': 2,
        'name': 'Coinbase',
        'slug': 'coinbase',
        'fiats': null,
        'maker_fee': null,
        'taker_fee': null,
        'spot_volume_usd': null,
        'urls': null,
      };

      final model = ExchangeModel.fromJson(json);

      expect(model.id, 2);
      expect(model.name, 'Coinbase');
      expect(model.slug, 'coinbase');
      expect(model.logo, '');
      expect(model.fiats, []);
      expect(model.makerFee, null);
      expect(model.takerFee, null);
      expect(model.spotVolumeUsd, null);
      expect(model.urls, null);
    });

    test('UrlsModel fromJson parses lists correctly', () {
      final json = {
        'actual': ['a1', 'a2'],
        'fee': ['f1'],
        'register': null,
        'twitter': [],
        'chat': null,
        'website': ['w1'],
      };

      final urls = UrlsModel.fromJson(json);

      expect(urls.actual, ['a1', 'a2']);
      expect(urls.fee, ['f1']);
      expect(urls.register, null);
      expect(urls.twitter, []);
      expect(urls.chat, null);
      expect(urls.website, ['w1']);
    });
  });
}
