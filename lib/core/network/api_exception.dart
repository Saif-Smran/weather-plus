import 'dart:io';

import 'package:dio/dio.dart';

sealed class ApiException implements Exception {
  const ApiException();

  const factory ApiException.noInternet() = NoInternetException;
  const factory ApiException.timeout() = TimeoutException;
  const factory ApiException.server(int statusCode) = ServerException;
  const factory ApiException.unknown() = UnknownException;
}

final class NoInternetException extends ApiException {
  const NoInternetException();
}

final class TimeoutException extends ApiException {
  const TimeoutException();
}

final class ServerException extends ApiException {
  const ServerException(this.statusCode);

  final int statusCode;
}

final class UnknownException extends ApiException {
  const UnknownException();
}

ApiException mapDioException(DioException exception) {
  if (exception.error is SocketException ||
      exception.type == DioExceptionType.connectionError) {
    return const ApiException.noInternet();
  }

  if (exception.type == DioExceptionType.connectionTimeout ||
      exception.type == DioExceptionType.sendTimeout ||
      exception.type == DioExceptionType.receiveTimeout) {
    return const ApiException.timeout();
  }

  final statusCode = exception.response?.statusCode;
  if (statusCode != null && statusCode >= 500) {
    return ApiException.server(statusCode);
  }

  return const ApiException.unknown();
}
