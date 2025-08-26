import 'package:flutter/material.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/exchange.dart';
import 'package:mb_challenge/modules/exchanges/domain/entities/currency.dart';

class ExchangeDetailPage extends StatelessWidget {
  final Exchange exchange;
  final List<Currency> assets; // lista de moedas passada por argumento

  const ExchangeDetailPage({
    super.key,
    required this.exchange,
    this.assets = const [],
  });

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exchange.name ?? 'Exchange Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(exchange.logo ?? ''),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exchange.name ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Exchange Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildInfoRow('ID', exchange.id?.toString()),
                    _buildInfoRow('Description', exchange.description),
                    _buildInfoRow(
                      'Website',
                      exchange.urls?.website?.first ?? '',
                    ),
                    _buildInfoRow('Maker Fee', exchange.makerFee?.toString()),
                    _buildInfoRow('Taker Fee', exchange.takerFee?.toString()),
                    _buildInfoRow('Date Launched', exchange.dateLaunched),
                    _buildInfoRow(
                      'Spot Volume USD',
                      exchange.spotVolumeUsd?.toStringAsFixed(2),
                    ),
                    _buildInfoRow(
                      'Weekly Visits',
                      exchange.weeklyVisits?.toString(),
                    ),
                  ],
                ),
              ),
            ),
            if (assets.isNotEmpty)
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Coins',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      ...assets.map(
                        (coin) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(coin.name ?? '-'),
                              Text(
                                '\$${coin.priceUsd?.toStringAsFixed(4) ?? '-'}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
