import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/core/network/dio_http_client.dart';
import 'package:mb_challenge/modules/exchanges/exchanges_injection.dart';

Future<void> initializeDependencies() async {
  GetIt.I.registerLazySingleton<CustomHttpClient>(() => DioHttpClient(Dio()));

  await initExchangesModule();
}
