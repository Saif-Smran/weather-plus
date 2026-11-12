// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SavedCitiesTable extends SavedCities
    with TableInfo<$SavedCitiesTable, SavedCity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedCitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    country,
    latitude,
    longitude,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_cities';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedCity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedCity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedCity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $SavedCitiesTable createAlias(String alias) {
    return $SavedCitiesTable(attachedDatabase, alias);
  }
}

class SavedCity extends DataClass implements Insertable<SavedCity> {
  final int id;
  final String name;
  final String country;
  final double latitude;
  final double longitude;
  final DateTime addedAt;
  const SavedCity({
    required this.id,
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['country'] = Variable<String>(country);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  SavedCitiesCompanion toCompanion(bool nullToAbsent) {
    return SavedCitiesCompanion(
      id: Value(id),
      name: Value(name),
      country: Value(country),
      latitude: Value(latitude),
      longitude: Value(longitude),
      addedAt: Value(addedAt),
    );
  }

  factory SavedCity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedCity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      country: serializer.fromJson<String>(json['country']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'country': serializer.toJson<String>(country),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  SavedCity copyWith({
    int? id,
    String? name,
    String? country,
    double? latitude,
    double? longitude,
    DateTime? addedAt,
  }) => SavedCity(
    id: id ?? this.id,
    name: name ?? this.name,
    country: country ?? this.country,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    addedAt: addedAt ?? this.addedAt,
  );
  SavedCity copyWithCompanion(SavedCitiesCompanion data) {
    return SavedCity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      country: data.country.present ? data.country.value : this.country,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedCity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('country: $country, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, country, latitude, longitude, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedCity &&
          other.id == this.id &&
          other.name == this.name &&
          other.country == this.country &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.addedAt == this.addedAt);
}

class SavedCitiesCompanion extends UpdateCompanion<SavedCity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> country;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> addedAt;
  const SavedCitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.country = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  SavedCitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String country,
    required double latitude,
    required double longitude,
    this.addedAt = const Value.absent(),
  }) : name = Value(name),
       country = Value(country),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<SavedCity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? country,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (country != null) 'country': country,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  SavedCitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? country,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<DateTime>? addedAt,
  }) {
    return SavedCitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedCitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('country: $country, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavedCitiesTable savedCities = $SavedCitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [savedCities];
}

typedef $$SavedCitiesTableCreateCompanionBuilder =
    SavedCitiesCompanion Function({
      Value<int> id,
      required String name,
      required String country,
      required double latitude,
      required double longitude,
      Value<DateTime> addedAt,
    });
typedef $$SavedCitiesTableUpdateCompanionBuilder =
    SavedCitiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> country,
      Value<double> latitude,
      Value<double> longitude,
      Value<DateTime> addedAt,
    });

class $$SavedCitiesTableFilterComposer
    extends Composer<_$AppDatabase, $SavedCitiesTable> {
  $$SavedCitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedCitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedCitiesTable> {
  $$SavedCitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedCitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedCitiesTable> {
  $$SavedCitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$SavedCitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedCitiesTable,
          SavedCity,
          $$SavedCitiesTableFilterComposer,
          $$SavedCitiesTableOrderingComposer,
          $$SavedCitiesTableAnnotationComposer,
          $$SavedCitiesTableCreateCompanionBuilder,
          $$SavedCitiesTableUpdateCompanionBuilder,
          (
            SavedCity,
            BaseReferences<_$AppDatabase, $SavedCitiesTable, SavedCity>,
          ),
          SavedCity,
          PrefetchHooks Function()
        > {
  $$SavedCitiesTableTableManager(_$AppDatabase db, $SavedCitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedCitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedCitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedCitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => SavedCitiesCompanion(
                id: id,
                name: name,
                country: country,
                latitude: latitude,
                longitude: longitude,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String country,
                required double latitude,
                required double longitude,
                Value<DateTime> addedAt = const Value.absent(),
              }) => SavedCitiesCompanion.insert(
                id: id,
                name: name,
                country: country,
                latitude: latitude,
                longitude: longitude,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SavedCitiesTable, SavedCity>(table),
                  BaseReferences<_$AppDatabase, $SavedCitiesTable, SavedCity>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedCitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedCitiesTable,
      SavedCity,
      $$SavedCitiesTableFilterComposer,
      $$SavedCitiesTableOrderingComposer,
      $$SavedCitiesTableAnnotationComposer,
      $$SavedCitiesTableCreateCompanionBuilder,
      $$SavedCitiesTableUpdateCompanionBuilder,
      (SavedCity, BaseReferences<_$AppDatabase, $SavedCitiesTable, SavedCity>),
      SavedCity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavedCitiesTableTableManager get savedCities =>
      $$SavedCitiesTableTableManager(_db, _db.savedCities);
}
