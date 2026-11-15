import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class SavedCities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get country => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

class CachedWeathers extends Table {
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get jsonPayload => text()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {latitude, longitude};
}

@DriftDatabase(tables: [SavedCities, CachedWeathers])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'weather_plus'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(cachedWeathers);
          }
        },
      );
}

final appDatabase = AppDatabase();
