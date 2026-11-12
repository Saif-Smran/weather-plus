import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_exception.dart';
import 'models/forecast_response_dto.dart';

class WeatherRemoteSource {
  const WeatherRemoteSource(this._dio);

  final Dio _dio;

  Future<ForecastResponseDto> fetchForecast({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.forecast,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'current':
              'temperature_2m,apparent_temperature,relative_humidity_2m,'
              'weather_code,wind_speed_10m',
          'hourly': 'temperature_2m,precipitation_probability,weather_code',
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min,sunrise,'
              'sunset,uv_index_max',
          'timezone': 'auto',
        },
      );

      final data = response.data;
      if (data == null) {
        throw const ApiException.unknown();
      }

      return ForecastResponseDto.fromJson(data);
    } on ApiException {
      rethrow;
    } on DioException catch (exception) {
      throw mapDioException(exception);
    } on FormatException {
      throw const ApiException.unknown();
    }
  }
}
