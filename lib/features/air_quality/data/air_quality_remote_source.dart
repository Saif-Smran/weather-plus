import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_exception.dart';
import 'models/air_quality_dto.dart';

class AirQualityRemoteSource {
  const AirQualityRemoteSource(this._dio);

  final Dio _dio;

  Future<AirQualityDto> fetchAirQuality({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.airQuality,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'current': 'us_aqi,pm2_5,pm10',
        },
      );

      final data = response.data;
      if (data == null) {
        throw const ApiException.unknown();
      }

      return AirQualityDto.fromJson(data);
    } on ApiException {
      rethrow;
    } on DioException catch (exception) {
      throw mapDioException(exception);
    } on FormatException {
      throw const ApiException.unknown();
    }
  }
}

