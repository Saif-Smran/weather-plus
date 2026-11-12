import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../city_search/domain/entities/city.dart';

class SavedCitySummary {
  const SavedCitySummary({
    required this.id,
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String name;
  final String country;
  final double latitude;
  final double longitude;
}

class SavedCitiesRepository {
  const SavedCitiesRepository(this._database);

  final AppDatabase _database;

  Stream<List<SavedCitySummary>> watchAll() {
    return (_database.select(
      _database.savedCities,
    )..orderBy([(table) => OrderingTerm.desc(table.addedAt)])).watch().map(
      (rows) => rows
          .map(
            (row) => SavedCitySummary(
              id: row.id,
              name: row.name,
              country: row.country,
              latitude: row.latitude,
              longitude: row.longitude,
            ),
          )
          .toList(),
    );
  }

  Future<int?> add(City city) async {
    final duplicate =
        await (_database.select(_database.savedCities)..where(
              (table) =>
                  table.latitude.equals(city.latitude) &
                  table.longitude.equals(city.longitude),
            ))
            .getSingleOrNull();
    if (duplicate != null) return null;

    return _database
        .into(_database.savedCities)
        .insert(
          SavedCitiesCompanion.insert(
            name: city.name,
            country: city.country,
            latitude: city.latitude,
            longitude: city.longitude,
          ),
        );
  }

  Future<void> remove(int id) {
    return (_database.delete(
      _database.savedCities,
    )..where((table) => table.id.equals(id))).go();
  }

  Future<void> restore(SavedCitySummary city) async {
    await _database
        .into(_database.savedCities)
        .insert(
          SavedCitiesCompanion.insert(
            name: city.name,
            country: city.country,
            latitude: city.latitude,
            longitude: city.longitude,
          ),
        );
  }
}
