import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';

class ExchangeModel extends Exchange {
  const ExchangeModel({
    super.id,
    super.name,
    super.slug,
    super.logo,
    super.description,
    super.dateLaunched,
    super.notice,
    super.fiats,
    super.type,
    super.makerFee,
    super.takerFee,
    super.weeklyVisits,
    super.spotVolumeUsd,
    super.spotVolumeLastUpdated,
    super.urls,
    super.porSwitch,
    super.porStatus,
    super.porAuditStatus,
    super.walletSourceStatus,
    super.isHidden,
    super.isRedistributable,
    super.onRampDirectDeposit,
    super.onRampCardVisaMastercard,
    super.onRampGoogleApplePay,
    super.onRampThirdParty,
    super.offRampDirectWithdrawal,
  });

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      logo: json['logo'] ?? '',
      description: json['description'],
      dateLaunched: json['date_launched'],
      notice: json['notice'],
      fiats: (json['fiats'] as List<dynamic>? ?? []).cast<String>(),
      type: json['type'],
      makerFee: (json['maker_fee'] != null)
          ? (json['maker_fee'] as num).toDouble()
          : null,
      takerFee: (json['taker_fee'] != null)
          ? (json['taker_fee'] as num).toDouble()
          : null,
      weeklyVisits: json['weekly_visits'],
      spotVolumeUsd: (json['spot_volume_usd'] != null)
          ? (json['spot_volume_usd'] as num).toDouble()
          : null,
      spotVolumeLastUpdated: json['spot_volume_last_updated'],
      urls: json['urls'] != null ? UrlsModel.fromJson(json['urls']) : null,
      porSwitch: json['por_switch'],
      porStatus: json['porStatus'],
      porAuditStatus: json['porAuditStatus'],
      walletSourceStatus: json['walletSourceStatus'],
      isHidden: json['is_hidden'],
      isRedistributable: json['is_redistributable'],
      onRampDirectDeposit: json['on_ramp_direct_deposit'],
      onRampCardVisaMastercard: json['on_ramp_card_visa_mastercard'],
      onRampGoogleApplePay: json['on_ramp_google_apple_pay'],
      onRampThirdParty: json['on_ramp_third_party'],
      offRampDirectWithdrawal: json['off_ramp_direct_withdrawal'],
    );
  }
}

class UrlsModel extends Urls {
  UrlsModel({
    super.actual,
    super.fee,
    super.register,
    super.twitter,
    super.chat,
    super.website,
  });

  factory UrlsModel.fromJson(Map<String, dynamic> json) {
    return UrlsModel(
      actual: (json['actual'] as List<dynamic>?)?.cast<String>(),
      fee: (json['fee'] as List<dynamic>?)?.cast<String>(),
      register: (json['register'] as List<dynamic>?)?.cast<String>(),
      twitter: (json['twitter'] as List<dynamic>?)?.cast<String>(),
      chat: (json['chat'] as List<dynamic>?)?.cast<String>(),
      website: (json['website'] as List<dynamic>?)?.cast<String>(),
    );
  }
}
