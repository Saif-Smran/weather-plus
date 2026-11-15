import 'dart:convert';

import '../domain/entities/weather.dart';
import '../domain/weather_repository.dart';
import 'models/forecast_mapper.dart';
import 'models/forecast_response_dto.dart';
import 'weather_local_source.dart';
import 'weather_remote_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(
    this._remoteSource, [
    this._localSource,
  ]);

  final WeatherRemoteSource _remoteSource;
  final WeatherLocalSource? _localSource;

  @override
  Future<Weather> getWeather(double latitude, double longitude) async {
    try {
      final dto = await _remoteSource.fetchForecast(
        latitude: latitude,
        longitude: longitude,
      );

      // Save to offline cache if local source is available
      if (_localSource != null) {
        try {
          final jsonString = jsonEncode(dto.toJson());
          await _localSource.saveWeather(
            latitude: latitude,
            longitude: longitude,
            jsonPayload: jsonString,
          );
        } catch (_) {
          // Failure to save cache should not break live weather
        }
      }

      return dto.toEntity(
        isFromCache: false,
        lastUpdated: DateTime.now(),
      );
    } catch (error) {
      // On network failure, try retrieving from offline cache
      if (_localSource != null) {
        final cached = await _localSource.getWeather(
          latitude: latitude,
          longitude: longitude,
        );

        if (cached != null) {
          try {
            final json = jsonDecode(cached.jsonPayload) as Map<String, dynamic>;
            final dto = ForecastResponseDto.fromJson(json);
            return dto.toEntity(
              isFromCache: true,
              lastUpdated: cached.fetchedAt,
            );
          } catch (_) {
            rethrow;
          }
        }
      }
      rethrow;
    }
  }
}
