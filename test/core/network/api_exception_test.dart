import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/network/api_exception.dart';

void main() {
  test('maps connection errors to NoInternet', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/'),
      error: const SocketException('offline'),
    );

    expect(mapDioException(exception), isA<NoInternetException>());
  });

  test('maps timeout errors to Timeout', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/'),
      type: DioExceptionType.receiveTimeout,
    );

    expect(mapDioException(exception), isA<TimeoutException>());
  });

  test('maps server responses to Server with status code', () {
    final exception = DioException(
      requestOptions: RequestOptions(path: '/'),
      response: Response<dynamic>(
        requestOptions: RequestOptions(path: '/'),
        statusCode: 503,
      ),
    );

    final mapped = mapDioException(exception);

    expect(mapped, isA<ServerException>());
    expect((mapped as ServerException).statusCode, 503);
  });
}
