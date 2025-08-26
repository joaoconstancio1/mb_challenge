import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:mb_challenge/modules/exchanges/presenter/cubit/exchanges_cubit.dart';
import 'data/datasources/exchanges_remote_datasource.dart';
import 'data/repositories/exchanges_repository_impl.dart';
import 'domain/repositories/exchanges_repository.dart';

Future<void> initExchangesModule() async {
  final getIt = GetIt.instance;

  if (!getIt.isRegistered<ExchangesRemoteDataSource>()) {
    getIt.registerLazySingleton<ExchangesRemoteDataSource>(
      () => ExchangesRemoteDataSourceImpl(getIt<Dio>()),
    );

    getIt.registerLazySingleton<ExchangeRepository>(
      () => ExchangesRepositoryImpl(
        remoteDataSource: getIt<ExchangesRemoteDataSource>(),
      ),
    );

    getIt.registerFactory(
      () => ExchangeCubit(repository: getIt<ExchangeRepository>()),
    );
  }
}
