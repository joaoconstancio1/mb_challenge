import 'package:dio/dio.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/core/utils/constants.dart';

class DioHttpClient implements CustomHttpClient {
  DioHttpClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: Constants.baseUrl,
              headers: {'X-CMC_PRO_API_KEY': Constants.cmcApiKey},
            ),
          );

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);

    return response.data as Map<String, dynamic>;
  }
}
