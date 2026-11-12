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

@DriftDatabase(tables: [SavedCities])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'weather_plus'));

  @override
  int get schemaVersion => 1;
}

final appDatabase = AppDatabase();
