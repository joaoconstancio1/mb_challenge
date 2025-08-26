import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mb_challenge/modules/exchanges/domain/repositories/exchanges_repository.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_cubit.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_state.dart';

class ExchangesListPage extends StatelessWidget {
  const ExchangesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExchangeCubit(repository: GetIt.I<ExchangeRepository>())
            ..getExchange(),
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
      body: ListView(
        children: [
          BlocBuilder<ExchangeCubit, ExchangeState>(
            builder: (context, state) {
              if (state is ExchangeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExchangeLoaded) {
                return Text('Exchange: ${state.exchange}');
              } else if (state is ExchangeError) {
                return Text('Error: ${state.message}');
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
