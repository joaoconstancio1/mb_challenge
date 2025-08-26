import 'package:dio/dio.dart';
import '../models/exchange_model.dart';
import '../models/currency_model.dart';

abstract class ExchangesRemoteDataSource {
  Future<ExchangeModel> getExchange(int id);
  Future<List<CurrencyModel>> getExchangeCurrencies(int id);
}

class ExchangesRemoteDataSourceImpl implements ExchangesRemoteDataSource {
  final Dio _dio;

  ExchangesRemoteDataSourceImpl(this._dio);

  final baseUrl = 'https://pro-api.coinmarketcap.com';

  @override
  Future<ExchangeModel> getExchange(int id) async {
    try {
      final response = await _dio.get(
        '$baseUrl/v1/exchange/info?id=$id',
        options: Options(
          headers: {
            'X-CMC_PRO_API_KEY': '9706ea51-5750-42ef-88ec-03c5ba978bf8',
          },
        ),
      );

      return ExchangeModel.fromJson(response.data['data'][id.toString()]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getExchangeCurrencies(int id) async {
    try {
      final url = '$baseUrl/v1/exchange/assets?id=$id';

      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'X-CMC_PRO_API_KEY': '9706ea51-5750-42ef-88ec-03c5ba978bf8',
          },
        ),
      );

      final data = response.data['data'] as List;
      return data.map((e) => CurrencyModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
