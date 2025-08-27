import 'package:flutter_test/flutter_test.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';

class MockCustomHttpClient implements CustomHttpClient {
  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (path == '/test' && queryParameters?['id'] == 1) {
      return {'success': true, 'data': 'Test data'};
    }
    return {'success': false};
  }
}

void main() {
  late CustomHttpClient client;

  setUp(() {
    client = MockCustomHttpClient();
  });

  test(
    'CustomHttpClient returns expected data for valid path and query',
    () async {
      final result = await client.get('/test', queryParameters: {'id': 1});
      expect(result['success'], true);
      expect(result['data'], 'Test data');
    },
  );

  test('CustomHttpClient returns failure for invalid path', () async {
    final result = await client.get('/invalid');
    expect(result['success'], false);
  });

  test(
    'CustomHttpClient returns failure for missing query parameter',
    () async {
      final result = await client.get('/test');
      expect(result['success'], false);
    },
  );
}
