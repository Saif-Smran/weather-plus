import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_exception.dart';

class ReverseGeocoder {
  const ReverseGeocoder(this._dio);

  final Dio _dio;

  Future<String?> findCity({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.reverseGeocoding,
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'format': 'jsonv2',
          'zoom': 10,
          'addressdetails': 1,
        },
        options: Options(
          headers: const {
            'Accept': 'application/json',
            'User-Agent': 'WeatherPlus/1.0 (weather app)',
          },
        ),
      );
      final address = response.data?['address'];
      if (address is! Map) return null;

      for (final key in const [
        'city',
        'town',
        'village',
        'municipality',
        'county',
      ]) {
        final value = address[key];
        if (value is String && value.trim().isNotEmpty) return value;
      }
      return null;
    } on DioException catch (exception) {
      throw mapDioException(exception);
    } on FormatException {
      throw const ApiException.unknown();
    }
  }
}
