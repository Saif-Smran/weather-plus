import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/saved_cities_repository.dart';

final savedCitiesRepositoryProvider = Provider<SavedCitiesRepository>(
  (ref) => SavedCitiesRepository(appDatabase),
);

final savedCitiesProvider = StreamProvider<List<SavedCitySummary>>(
  (ref) => ref.watch(savedCitiesRepositoryProvider).watchAll(),
);
