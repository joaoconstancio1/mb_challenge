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
    super.countries,
    super.fiats,
    super.tags,
    super.type,
    super.makerFee,
    super.takerFee,
    super.weeklyVisits,
    super.spotVolumeUsd,
    super.spotVolumeLastUpdated,
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
      countries: (json['countries'] as List<dynamic>? ?? []).cast<String>(),
      fiats: (json['fiats'] as List<dynamic>? ?? []).cast<String>(),
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
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
    );
  }
}
