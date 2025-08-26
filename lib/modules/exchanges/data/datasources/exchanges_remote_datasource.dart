import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/core/utils/constants.dart';
import '../models/exchange_model.dart';
import '../models/currency_model.dart';

abstract class ExchangesRemoteDataSource {
  Future<ExchangeModel> getExchange(int id);
  Future<List<CurrencyModel>> getExchangeCurrencies(int id);
}

class ExchangesRemoteDataSourceImpl implements ExchangesRemoteDataSource {
  final CustomHttpClient httpClient;

  ExchangesRemoteDataSourceImpl({required this.httpClient});

  final String baseUrl = Constants.baseUrl;

  @override
  Future<ExchangeModel> getExchange(int id) async {
    final data = await httpClient.get(
      '$baseUrl/v1/exchange/info',
      queryParameters: {'id': id},
    );
    return ExchangeModel.fromJson(data['data'][id.toString()]);
  }

  @override
  Future<List<CurrencyModel>> getExchangeCurrencies(int id) async {
    final data = await httpClient.get(
      '$baseUrl/v1/exchange/assets',
      queryParameters: {'id': id},
    );
    final list = data['data'] as List;
    return list.map((e) => CurrencyModel.fromJson(e)).toList();
  }
}
