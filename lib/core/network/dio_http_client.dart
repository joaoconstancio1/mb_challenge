import 'package:dio/dio.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/core/utils/constants.dart';

class DioHttpClient implements CustomHttpClient {
  final Dio _dio;

  DioHttpClient(this._dio);

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: {'X-CMC_PRO_API_KEY': Constants.cmcApiKey}),
    );

    return response.data as Map<String, dynamic>;
  }
}
