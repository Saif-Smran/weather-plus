import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/air_quality_remote_source.dart';
import '../../data/air_quality_repository_impl.dart';
import '../../domain/air_quality_repository.dart';
import '../../domain/entities/air_quality.dart';

final airQualityRemoteSourceProvider = Provider<AirQualityRemoteSource>((ref) {
  return AirQualityRemoteSource(ref.watch(dioProvider));
});

final airQualityRepositoryProvider = Provider<AirQualityRepository>((ref) {
  return AirQualityRepositoryImpl(ref.watch(airQualityRemoteSourceProvider));
});

final airQualityProvider =
    FutureProvider.family<AirQuality, ({double latitude, double longitude})>((
  ref,
  coordinates,
) {
  return ref
      .watch(airQualityRepositoryProvider)
      .getAirQuality(coordinates.latitude, coordinates.longitude);
});

