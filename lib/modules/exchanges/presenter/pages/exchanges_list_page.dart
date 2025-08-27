import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_cubit.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';
import 'package:mb_challenge/modules/exchanges/presenter/pages/exchange_detail_page.dart';

class ExchangesListPage extends StatelessWidget {
  const ExchangesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExchangeCubit(repository: GetIt.I<ExchangeRepository>())
            ..getExchanges(),
      child: const ExchangesListView(),
    );
  }
}

class ExchangesListView extends StatelessWidget {
  const ExchangesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exchanges')),
      body: BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) {
          if (state is ExchangeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExchangesLoaded) {
            final exchanges = state.exchanges;
            final assetsList = state.assetsList;

            return ListView.builder(
              itemCount: exchanges.length,
              itemBuilder: (context, index) {
                final exchange = exchanges[index];
                final assets = assetsList[index];

                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      exchange.logo ?? '',
                      errorBuilder: (_, __, ___) => const Icon(Icons.image),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  title: Text(exchange.name ?? ''),
                  subtitle: Text(
                    'Volume: \$${exchange.spotVolumeUsd}\nLaunched: ${exchange.formattedDateLaunched}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExchangeDetailPage(
                          exchange: exchange,
                          assets: assets,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ExchangeError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
