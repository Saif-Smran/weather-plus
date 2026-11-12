import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_exception.dart';
import '../domain/entities/city.dart';

class CityRemoteSource {
  const CityRemoteSource(this._dio);

  final Dio _dio;

  Future<List<City>> search(String query) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.geocoding,
        queryParameters: {'name': query, 'count': 10},
      );
      final results = response.data?['results'];
      if (results is! List) return const [];

      return results
          .whereType<Map<String, dynamic>>()
          .map(
            (json) => City(
              name: json['name'] as String? ?? '',
              country: json['country'] as String? ?? '',
              adminRegion: json['admin1'] as String?,
              latitude: (json['latitude'] as num).toDouble(),
              longitude: (json['longitude'] as num).toDouble(),
            ),
          )
          .toList();
    } on ApiException {
      rethrow;
    } on DioException catch (exception) {
      throw mapDioException(exception);
    } on FormatException {
      throw const ApiException.unknown();
    }
  }
}
