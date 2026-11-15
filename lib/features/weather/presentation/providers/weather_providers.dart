import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/location_service.dart';
import '../../data/reverse_geocoder.dart';
import '../../data/weather_local_source.dart';
import '../../data/weather_remote_source.dart';
import '../../data/weather_repository_impl.dart';
import '../../domain/entities/weather.dart';
import '../../domain/weather_repository.dart';

final weatherRemoteSourceProvider = Provider<WeatherRemoteSource>((ref) {
  return WeatherRemoteSource(ref.watch(dioProvider));
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    ref.watch(weatherRemoteSourceProvider),
    ref.watch(weatherLocalSourceProvider),
  );
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final reverseGeocoderProvider = Provider<ReverseGeocoder>((ref) {
  return ReverseGeocoder(ref.watch(dioProvider));
});

final locationNameProvider =
    FutureProvider.family<String?, ({double latitude, double longitude})>((
      ref,
      coordinates,
    ) {
      return ref
          .watch(reverseGeocoderProvider)
          .findCity(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude,
          );
    });

final currentLocationProvider = FutureProvider<Position>((ref) {
  return ref.watch(locationServiceProvider).getCurrentPosition();
});

final weatherProvider =
    FutureProvider.family<Weather, ({double latitude, double longitude})>((
      ref,
      coordinates,
    ) {
      return ref
          .watch(weatherRepositoryProvider)
          .getWeather(coordinates.latitude, coordinates.longitude);
    });
