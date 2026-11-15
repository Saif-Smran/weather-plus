import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';

abstract class WeatherLocalSource {
  Future<void> saveWeather({
    required double latitude,
    required double longitude,
    required String jsonPayload,
  });

  Future<CachedWeather?> getWeather({
    required double latitude,
    required double longitude,
  });
}

class DriftWeatherLocalSource implements WeatherLocalSource {
  const DriftWeatherLocalSource(this._database);

  final AppDatabase _database;

  @override
  Future<void> saveWeather({
    required double latitude,
    required double longitude,
    required String jsonPayload,
  }) async {
    await _database.into(_database.cachedWeathers).insertOnConflictUpdate(
          CachedWeathersCompanion.insert(
            latitude: latitude,
            longitude: longitude,
            jsonPayload: jsonPayload,
            fetchedAt: DateTime.now(),
          ),
        );
  }

  @override
  Future<CachedWeather?> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final query = _database.select(_database.cachedWeathers)
      ..where((row) =>
          row.latitude.equals(latitude) & row.longitude.equals(longitude));
    return query.getSingleOrNull();
  }
}

final weatherLocalSourceProvider = Provider<WeatherLocalSource>((ref) {
  return DriftWeatherLocalSource(appDatabase);
});
