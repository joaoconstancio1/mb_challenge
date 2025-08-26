import 'package:equatable/equatable.dart';

class Exchange extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? logo;
  final String? description;
  final String? dateLaunched;
  final String? notice;
  final List<String>? countries;
  final List<String>? fiats;
  final List<String>? tags;
  final String? type;
  final double? makerFee;
  final double? takerFee;
  final int? weeklyVisits;
  final double? spotVolumeUsd;
  final String? spotVolumeLastUpdated;

  const Exchange({
    this.id,
    this.name,
    this.slug,
    this.logo,
    this.description,
    this.dateLaunched,
    this.notice,
    this.countries,
    this.fiats,
    this.tags,
    this.type,
    this.makerFee,
    this.takerFee,
    this.weeklyVisits,
    this.spotVolumeUsd,
    this.spotVolumeLastUpdated,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    logo,
    description,
    dateLaunched,
    notice,
    countries,
    fiats,
    tags,
    type,
    makerFee,
    takerFee,
    weeklyVisits,
    spotVolumeUsd,
    spotVolumeLastUpdated,
  ];
}
