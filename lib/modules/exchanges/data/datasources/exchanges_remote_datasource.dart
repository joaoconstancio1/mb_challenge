import 'package:dio/dio.dart';
import 'package:mb_challenge/core/utils/constants.dart';
import '../models/exchange_model.dart';

abstract class ExchangesRemoteDataSource {
  Future<ExchangeModel> getExchange(int id);
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
      print(response.data);
      return ExchangeModel.fromJson(response.data['data'][id.toString()]);
    } catch (e) {
      print('Error fetching exchange: $e');
      rethrow;
    }
  }
}
