import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_plus/core/network/dio_client.dart';

void main() {
  test('provides Dio with JSON headers and ten-second timeouts', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);

    expect(dio.options.connectTimeout, const Duration(seconds: 10));
    expect(dio.options.receiveTimeout, const Duration(seconds: 10));
    expect(dio.options.sendTimeout, const Duration(seconds: 10));
    expect(dio.options.headers['Accept'], 'application/json');
    expect(dio.options.responseType, ResponseType.json);
  });
}
