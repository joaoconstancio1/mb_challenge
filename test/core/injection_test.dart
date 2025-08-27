import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mb_challenge/core/injection.dart';
import 'package:mb_challenge/core/network/custom_http_client.dart';
import 'package:mb_challenge/core/network/dio_http_client.dart';

void main() {
  setUp(() async {
    GetIt.I.reset();
  });

  testWidgets('injection registers DioHttpClient as CustomHttpClient', (
    tester,
  ) async {
    await initializeDependencies();
    final client = GetIt.I<CustomHttpClient>();
    expect(client, isA<DioHttpClient>());
  });
}
