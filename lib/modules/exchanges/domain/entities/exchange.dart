import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Exchange extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? notice;
  final String? logo;
  final List<String>? fiats;
  final Urls? urls;
  final String? type;
  final int? porStatus;
  final int? porAuditStatus;
  final int? walletSourceStatus;
  final String? porSwitch;
  final int? alertType;
  final String? alertLink;
  final String? dateLaunched;
  final int? isHidden;
  final int? isRedistributable;
  final double? makerFee;
  final double? takerFee;
  final String? onRampDirectDeposit;
  final String? onRampCardVisaMastercard;
  final String? onRampGoogleApplePay;
  final String? onRampThirdParty;
  final String? onRampP2p;
  final String? offRampDirectWithdrawal;
  final String? offRampP2p;
  final double? spotVolumeUsd;
  final String? spotVolumeLastUpdated;
  final int? weeklyVisits;

  const Exchange({
    this.id,
    this.name,
    this.slug,
    this.logo,
    this.description,
    this.dateLaunched,
    this.notice,
    this.fiats,
    this.type,
    this.makerFee,
    this.takerFee,
    this.weeklyVisits,
    this.spotVolumeUsd,
    this.spotVolumeLastUpdated,
    this.urls,
    this.porStatus,
    this.porAuditStatus,
    this.walletSourceStatus,
    this.porSwitch,
    this.alertType,
    this.alertLink,
    this.isHidden,
    this.isRedistributable,
    this.onRampDirectDeposit,
    this.onRampCardVisaMastercard,
    this.onRampGoogleApplePay,
    this.onRampThirdParty,
    this.onRampP2p,
    this.offRampDirectWithdrawal,
    this.offRampP2p,
  });

  String get formattedDateLaunched {
    if (dateLaunched == null || dateLaunched!.isEmpty) return '-';
    try {
      final dt = DateTime.parse(dateLaunched!);
      return DateFormat('dd/MM/yyyy').format(dt);
    } catch (_) {
      return '-';
    }
  }

  @override
  List<Object?> get props => [
    urls,
    id,
    name,
    slug,
    logo,
    description,
    dateLaunched,
    notice,
    fiats,
    type,
    makerFee,
    takerFee,
    weeklyVisits,
    spotVolumeUsd,
    spotVolumeLastUpdated,
    urls,
    porStatus,
    porAuditStatus,
    walletSourceStatus,
    porSwitch,
    alertType,
    alertLink,
    isHidden,
    isRedistributable,
    onRampDirectDeposit,
    onRampCardVisaMastercard,
    onRampGoogleApplePay,
    onRampThirdParty,
    onRampP2p,
    offRampDirectWithdrawal,
    offRampP2p,
  ];
}

class Urls {
  final List<String>? actual;
  final List<String>? fee;
  final List<String>? register;
  final List<String>? twitter;
  final List<String>? chat;
  final List<String>? website;

  Urls({
    this.actual,
    this.fee,
    this.register,
    this.twitter,
    this.chat,
    this.website,
  });
}
