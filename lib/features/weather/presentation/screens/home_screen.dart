import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_view.dart';
import '../../../city_search/domain/entities/city.dart';
import '../../../saved_cities/presentation/providers/saved_cities_provider.dart';
import '../../../settings/presentation/providers/settings_provider.dart';
import '../../../settings/presentation/utils/weather_formatters.dart';
import '../../data/location_service.dart';
import '../providers/weather_providers.dart';
import '../widgets/current_weather_header.dart';
import '../widgets/current_weather_loading.dart';
import '../widgets/daily_forecast_list.dart';
import '../widgets/hourly_forecast_list.dart';
import '../widgets/stats_grid.dart';

const dhakaCoordinates = (latitude: 23.81, longitude: 90.41);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.cityName, this.latitude, this.longitude});

  final String? cityName;
  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCoordinates = latitude != null && longitude != null
        ? (latitude: latitude!, longitude: longitude!)
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName ?? 'Weather+'),
        actions: [
          IconButton(
            onPressed: () => context.push('/search'),
            icon: const Icon(Icons.search),
            tooltip: 'Search cities',
          ),
          IconButton(
            onPressed: () => context.push('/saved'),
            icon: const Icon(Icons.bookmark_outline),
            tooltip: 'Saved cities',
          ),
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: selectedCoordinates != null
          ? _WeatherContent(
              ref: ref,
              coordinates: selectedCoordinates,
              cityName: cityName,
            )
          : ref
                .watch(currentLocationProvider)
                .when(
                  loading: () => const SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: CurrentWeatherLoading(),
                  ),
                  error: (error, stackTrace) => _LocationFallback(
                    error: error,
                    onRetry: () => ref.invalidate(currentLocationProvider),
                    onOpenSettings: () =>
                        ref.read(locationServiceProvider).openAppSettings(),
                    child: _WeatherContent(
                      ref: ref,
                      coordinates: dhakaCoordinates,
                      cityName: 'Dhaka',
                    ),
                  ),
                  data: (position) => _WeatherContent(
                    ref: ref,
                    coordinates: (
                      latitude: position.latitude,
                      longitude: position.longitude,
                    ),
                    cityName: cityName,
                  ),
                ),
    );
  }
}

class _LocationFallback extends StatelessWidget {
  const _LocationFallback({
    required this.error,
    required this.onRetry,
    required this.onOpenSettings,
    required this.child,
  });

  final Object error;
  final VoidCallback onRetry;
  final VoidCallback onOpenSettings;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final message = switch (error) {
      PermissionDeniedForever() =>
        'Location permission is permanently denied. Showing Dhaka weather.',
      PermissionDenied() =>
        'Location permission was denied. Showing Dhaka weather.',
      ServiceDisabled() => 'Location services are off. Showing Dhaka weather.',
      _ => 'Your location is unavailable. Showing Dhaka weather.',
    };

    return Column(
      children: [
        MaterialBanner(
          content: Text(message),
          actions: [
            TextButton(onPressed: onRetry, child: const Text('Retry')),
            if (error is PermissionDeniedForever)
              TextButton(
                onPressed: onOpenSettings,
                child: const Text('Open settings'),
              ),
          ],
        ),
        Expanded(child: child),
      ],
    );
  }
}

class _WeatherContent extends StatelessWidget {
  const _WeatherContent({
    required this.ref,
    required this.coordinates,
    this.cityName,
  });

  final WidgetRef ref;
  final ({double latitude, double longitude}) coordinates;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    final locationName = cityName ??
        ref
            .watch(locationNameProvider(coordinates))
            .maybeWhen(data: (value) => value, orElse: () => null);
    final settings = ref.watch(settingsProvider);
    final weather = ref.watch(weatherProvider(coordinates));

    return weather.when(
      loading: () => const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: CurrentWeatherLoading(),
      ),
      error: (error, stackTrace) => ErrorView(
        message: 'Unable to load weather. Please try again.',
        onRetry: () => ref.invalidate(weatherProvider(coordinates)),
      ),
      data: (weather) {
        final today = weather.daily.first;
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(weatherProvider(coordinates));
            await ref.read(weatherProvider(coordinates).future);
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              CurrentWeatherHeader(
                weather: weather,
                temperatureUnit: settings.temperatureUnit,
                cityName: locationName ?? 'Current location',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () async {
                    final added = await ref
                        .read(savedCitiesRepositoryProvider)
                        .add(
                          City(
                            name: cityName ?? 'Current location',
                            country: '',
                            adminRegion: null,
                            latitude: coordinates.latitude,
                            longitude: coordinates.longitude,
                          ),
                        );
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          added == null ? 'City already saved' : 'City saved',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                  label: const Text('Save'),
                ),
              ),
              const SizedBox(height: 24),
              _SectionCard(
                title: 'Today at a glance',
                child: StatsGrid(
                  stats: [
                    (
                      label: 'Humidity',
                      value: '${weather.relativeHumidity}%',
                      icon: Icons.water_drop_outlined,
                    ),
                    (
                      label: 'Wind',
                      value: formatWind(weather.windSpeed, settings.windUnit),
                      icon: Icons.air,
                    ),
                    (
                      label: 'UV index',
                      value: today.uvIndex.toStringAsFixed(1),
                      icon: Icons.wb_sunny_outlined,
                    ),
                    (
                      label: 'Sunrise',
                      value: DateFormat.jm().format(today.sunrise),
                      icon: Icons.wb_twilight,
                    ),
                    (
                      label: 'Sunset',
                      value: DateFormat.jm().format(today.sunset),
                      icon: Icons.nightlight_outlined,
                    ),
                    (
                      label: 'Updated',
                      value: DateFormat.jm().format(weather.observedAt),
                      icon: Icons.update,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _SectionCard(
                title: 'Next 24 hours',
                child: HourlyForecastList(forecasts: weather.hourly),
              ),
              const SizedBox(height: 24),
              _SectionCard(
                title: '7-day forecast',
                child: DailyForecastList(forecasts: weather.daily),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
