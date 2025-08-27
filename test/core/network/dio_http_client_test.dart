import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:mb_challenge/core/network/dio_http_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late DioHttpClient httpClient;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    httpClient = DioHttpClient(dio: mockDio);
  });

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: ''));
  });

  group('DioHttpClient', () {
    test('should perform GET request', () async {
      final response = Response(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );
      when(() => mockDio.get('/test')).thenAnswer((_) async => response);

      final result = await httpClient.get('/test');

      expect(result, {'key': 'value'});
      verify(() => mockDio.get('/test')).called(1);
    });

    test('should throw exception on error', () async {
      when(
        () => mockDio.get('/error'),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '/error')));

      expect(() => httpClient.get('/error'), throwsA(isA<Exception>()));
    });
  });
}
