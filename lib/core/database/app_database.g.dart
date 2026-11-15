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

class $CachedWeathersTable extends CachedWeathers
    with TableInfo<$CachedWeathersTable, CachedWeather> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedWeathersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _jsonPayloadMeta = const VerificationMeta(
    'jsonPayload',
  );
  @override
  late final GeneratedColumn<String> jsonPayload = GeneratedColumn<String>(
    'json_payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    latitude,
    longitude,
    jsonPayload,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_weathers';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedWeather> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('json_payload')) {
      context.handle(
        _jsonPayloadMeta,
        jsonPayload.isAcceptableOrUnknown(
          data['json_payload']!,
          _jsonPayloadMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jsonPayloadMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {latitude, longitude};
  @override
  CachedWeather map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedWeather(
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      jsonPayload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_payload'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $CachedWeathersTable createAlias(String alias) {
    return $CachedWeathersTable(attachedDatabase, alias);
  }
}

class CachedWeather extends DataClass implements Insertable<CachedWeather> {
  final double latitude;
  final double longitude;
  final String jsonPayload;
  final DateTime fetchedAt;
  const CachedWeather({
    required this.latitude,
    required this.longitude,
    required this.jsonPayload,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['json_payload'] = Variable<String>(jsonPayload);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  CachedWeathersCompanion toCompanion(bool nullToAbsent) {
    return CachedWeathersCompanion(
      latitude: Value(latitude),
      longitude: Value(longitude),
      jsonPayload: Value(jsonPayload),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory CachedWeather.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedWeather(
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      jsonPayload: serializer.fromJson<String>(json['jsonPayload']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'jsonPayload': serializer.toJson<String>(jsonPayload),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  CachedWeather copyWith({
    double? latitude,
    double? longitude,
    String? jsonPayload,
    DateTime? fetchedAt,
  }) => CachedWeather(
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    jsonPayload: jsonPayload ?? this.jsonPayload,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  CachedWeather copyWithCompanion(CachedWeathersCompanion data) {
    return CachedWeather(
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      jsonPayload: data.jsonPayload.present
          ? data.jsonPayload.value
          : this.jsonPayload,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedWeather(')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('jsonPayload: $jsonPayload, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(latitude, longitude, jsonPayload, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedWeather &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.jsonPayload == this.jsonPayload &&
          other.fetchedAt == this.fetchedAt);
}

class CachedWeathersCompanion extends UpdateCompanion<CachedWeather> {
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> jsonPayload;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const CachedWeathersCompanion({
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.jsonPayload = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedWeathersCompanion.insert({
    required double latitude,
    required double longitude,
    required String jsonPayload,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : latitude = Value(latitude),
       longitude = Value(longitude),
       jsonPayload = Value(jsonPayload),
       fetchedAt = Value(fetchedAt);
  static Insertable<CachedWeather> custom({
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? jsonPayload,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (jsonPayload != null) 'json_payload': jsonPayload,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedWeathersCompanion copyWith({
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? jsonPayload,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return CachedWeathersCompanion(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      jsonPayload: jsonPayload ?? this.jsonPayload,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (jsonPayload.present) {
      map['json_payload'] = Variable<String>(jsonPayload.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedWeathersCompanion(')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('jsonPayload: $jsonPayload, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavedCitiesTable savedCities = $SavedCitiesTable(this);
  late final $CachedWeathersTable cachedWeathers = $CachedWeathersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    savedCities,
    cachedWeathers,
  ];
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
typedef $$CachedWeathersTableCreateCompanionBuilder =
    CachedWeathersCompanion Function({
      required double latitude,
      required double longitude,
      required String jsonPayload,
      required DateTime fetchedAt,
      Value<int> rowid,
    });
typedef $$CachedWeathersTableUpdateCompanionBuilder =
    CachedWeathersCompanion Function({
      Value<double> latitude,
      Value<double> longitude,
      Value<String> jsonPayload,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $$CachedWeathersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedWeathersTable> {
  $$CachedWeathersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonPayload => $composableBuilder(
    column: $table.jsonPayload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedWeathersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedWeathersTable> {
  $$CachedWeathersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonPayload => $composableBuilder(
    column: $table.jsonPayload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedWeathersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedWeathersTable> {
  $$CachedWeathersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get jsonPayload => $composableBuilder(
    column: $table.jsonPayload,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$CachedWeathersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedWeathersTable,
          CachedWeather,
          $$CachedWeathersTableFilterComposer,
          $$CachedWeathersTableOrderingComposer,
          $$CachedWeathersTableAnnotationComposer,
          $$CachedWeathersTableCreateCompanionBuilder,
          $$CachedWeathersTableUpdateCompanionBuilder,
          (
            CachedWeather,
            BaseReferences<_$AppDatabase, $CachedWeathersTable, CachedWeather>,
          ),
          CachedWeather,
          PrefetchHooks Function()
        > {
  $$CachedWeathersTableTableManager(
    _$AppDatabase db,
    $CachedWeathersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedWeathersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedWeathersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedWeathersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> jsonPayload = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedWeathersCompanion(
                latitude: latitude,
                longitude: longitude,
                jsonPayload: jsonPayload,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required double latitude,
                required double longitude,
                required String jsonPayload,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedWeathersCompanion.insert(
                latitude: latitude,
                longitude: longitude,
                jsonPayload: jsonPayload,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CachedWeathersTable, CachedWeather>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CachedWeathersTable,
                    CachedWeather
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedWeathersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedWeathersTable,
      CachedWeather,
      $$CachedWeathersTableFilterComposer,
      $$CachedWeathersTableOrderingComposer,
      $$CachedWeathersTableAnnotationComposer,
      $$CachedWeathersTableCreateCompanionBuilder,
      $$CachedWeathersTableUpdateCompanionBuilder,
      (
        CachedWeather,
        BaseReferences<_$AppDatabase, $CachedWeathersTable, CachedWeather>,
      ),
      CachedWeather,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavedCitiesTableTableManager get savedCities =>
      $$SavedCitiesTableTableManager(_db, _db.savedCities);
  $$CachedWeathersTableTableManager get cachedWeathers =>
      $$CachedWeathersTableTableManager(_db, _db.cachedWeathers);
}
