import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/connectivity_provider.dart';
import '../../../../core/notifications/notification_service.dart';
import '../../../../core/theme/weather_atmosphere.dart';
import '../../../../core/widget/home_widget_service.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../air_quality/presentation/widgets/air_quality_card.dart';
import '../../../city_search/domain/entities/city.dart';
import '../../../saved_cities/presentation/providers/saved_cities_provider.dart';
import '../../../settings/presentation/providers/settings_provider.dart';
import '../../../settings/presentation/utils/weather_formatters.dart';
import '../../data/location_service.dart';
import '../providers/weather_providers.dart';
import '../widgets/charts/forecast_charts_card.dart';
import '../widgets/current_weather_header.dart';
import '../widgets/current_weather_loading.dart';
import '../widgets/daily_forecast_list.dart';
import '../widgets/hourly_forecast_list.dart';
import '../widgets/stats_grid.dart';
import '../widgets/weather_atmosphere_background.dart';

const dhakaCoordinates = (latitude: 23.81, longitude: 90.41);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.cityName, this.latitude, this.longitude});

  final String? cityName;
  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationsProvider);
    final selectedCoordinates = latitude != null && longitude != null
        ? (latitude: latitude!, longitude: longitude!)
        : null;

    final defaultAtmosphere = WeatherAtmosphere.fromWeather(null);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          cityName ?? l10n.appTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          _AppBarIconButton(
            icon: Icons.search,
            tooltip: l10n.searchCitiesTooltip,
            onPressed: () => context.push('/search'),
          ),
          const SizedBox(width: 6),
          _AppBarIconButton(
            icon: Icons.bookmark_outline,
            tooltip: l10n.savedCitiesTooltip,
            onPressed: () => context.push('/saved'),
          ),
          const SizedBox(width: 6),
          _AppBarIconButton(
            icon: Icons.settings_outlined,
            tooltip: l10n.settingsTooltip,
            onPressed: () => context.push('/settings'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: selectedCoordinates != null
          ? _WeatherContent(
              ref: ref,
              coordinates: selectedCoordinates,
              cityName: cityName,
            )
          : ref.watch(currentLocationProvider).when(
                loading: () => WeatherAtmosphereBackground(
                  atmosphere: defaultAtmosphere,
                  child: const SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
                      child: CurrentWeatherLoading(),
                    ),
                  ),
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
                  cityName: cityName ?? 'Dhaka',
                ),
              ),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  const _AppBarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.22),
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        tooltip: tooltip,
        onPressed: onPressed,
        visualDensity: VisualDensity.compact,
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

    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 4,
          left: 16,
          right: 16,
          child: GlassCard(
            borderRadius: 18,
            backgroundColor: const Color(0xCC1E293B),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xFFFFB74D),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onRetry,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF81D4FA),
                  ),
                  child: const Text('Retry'),
                ),
                if (error is PermissionDeniedForever)
                  TextButton(
                    onPressed: onOpenSettings,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF81D4FA),
                    ),
                    child: const Text('Settings'),
                  ),
              ],
            ),
          ),
        ),
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
    final weatherAsync = ref.watch(weatherProvider(coordinates));
    final isOffline = ref.watch(isOfflineProvider);
    final l10n = ref.watch(localizationsProvider);
    final isBengali = l10n.isBengali;

    final defaultAtmosphere = WeatherAtmosphere.fromWeather(null);

    return weatherAsync.when(
      loading: () => WeatherAtmosphereBackground(
        atmosphere: defaultAtmosphere,
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: CurrentWeatherLoading(),
          ),
        ),
      ),
      error: (error, stackTrace) => WeatherAtmosphereBackground(
        atmosphere: defaultAtmosphere,
        child: SafeArea(
          child: ErrorView(
            message: 'Unable to load weather. Please try again.',
            onRetry: () => ref.invalidate(weatherProvider(coordinates)),
          ),
        ),
      ),
      data: (weather) {
        final atmosphere = WeatherAtmosphere.fromWeather(weather);
        final today = weather.daily.isNotEmpty ? weather.daily.first : null;

        // Update home screen widget & check rain alert notifications in background
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final resolvedName = locationName ?? cityName ?? l10n.currentLocation;
          HomeWidgetService.updateWeatherWidget(
            weather: weather,
            cityName: resolvedName,
          );
          ref.read(notificationServiceProvider).checkAndNotifyRain(
            weather: weather,
            cityName: resolvedName,
            isEnabled: settings.rainAlertsEnabled,
            isBengali: isBengali,
          );
        });

        // UV Level text
        final uv = today?.uvIndex ?? 0.0;
        final uvText = uv <= 2
            ? l10n.uvLow
            : uv <= 5
                ? l10n.uvModerate
                : uv <= 7
                    ? l10n.uvHigh
                    : l10n.uvVeryHigh;

        // Humidity description
        final hum = weather.relativeHumidity;
        final humText = hum < 35
            ? l10n.dry
            : hum <= 65
                ? l10n.comfortable
                : l10n.humid;

        return WeatherAtmosphereBackground(
          atmosphere: atmosphere,
          child: SafeArea(
            child: RefreshIndicator(
              color: Colors.white,
              backgroundColor: const Color(0xFF1E293B),
              onRefresh: () async {
                ref.invalidate(weatherProvider(coordinates));
                await ref.read(weatherProvider(coordinates).future);
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                children: [
                  if (isOffline) ...[
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xE6C62828),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.wifi_off, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            l10n.noInternetBanner,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Current weather hero banner
                  CurrentWeatherHeader(
                    weather: weather,
                    temperatureUnit: settings.temperatureUnit,
                    cityName: locationName ?? l10n.currentLocation,
                    atmosphere: atmosphere,
                    isBengali: isBengali,
                  ),

                  const SizedBox(height: 12),

                  // Save City Action Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        final added = await ref
                            .read(savedCitiesRepositoryProvider)
                            .add(
                              City(
                                name: locationName ?? cityName ?? l10n.currentLocation,
                                country: '',
                                adminRegion: null,
                                latitude: coordinates.latitude,
                                longitude: coordinates.longitude,
                              ),
                            );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            content: Text(
                              added == null
                                  ? l10n.cityAlreadySaved
                                  : l10n.citySaved,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.22),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              l10n.saveCity,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Next 24 hours
                  _SectionCard(
                    title: l10n.hourlyForecast,
                    icon: Icons.access_time_rounded,
                    atmosphere: atmosphere,
                    child: HourlyForecastList(
                      forecasts: weather.next24Hours,
                      atmosphere: atmosphere,
                      isBengali: isBengali,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // 24-Hour Trends Chart
                  ForecastChartsCard(
                    forecasts: weather.next24Hours,
                    atmosphere: atmosphere,
                    isBengali: isBengali,
                  ),

                  const SizedBox(height: 18),

                  // 7-day forecast
                  _SectionCard(
                    title: l10n.sevenDayForecast,
                    icon: Icons.calendar_today_rounded,
                    atmosphere: atmosphere,
                    child: DailyForecastList(
                      forecasts: weather.daily,
                      currentTemperature: weather.temperature,
                      atmosphere: atmosphere,
                      isBengali: isBengali,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Air Quality Card
                  AirQualityCard(
                    coordinates: coordinates,
                    atmosphere: atmosphere,
                    isBengali: isBengali,
                  ),

                  const SizedBox(height: 18),

                  // Today at a glance
                  _SectionCard(
                    title: l10n.todayAtAGlance,
                    icon: Icons.dashboard_outlined,
                    atmosphere: atmosphere,
                    child: StatsGrid(
                      atmosphere: atmosphere,
                      stats: [
                        StatItem(
                          label: l10n.humidity,
                          value: '${weather.relativeHumidity}%',
                          icon: Icons.water_drop_outlined,
                          subtitle: humText,
                          iconColor: const Color(0xFF81D4FA),
                        ),
                        StatItem(
                          label: l10n.wind,
                          value: formatWind(weather.windSpeed, settings.windUnit),
                          icon: Icons.air,
                          subtitle: l10n.speedLabel,
                          iconColor: const Color(0xFF80CBC4),
                        ),
                        if (today != null) ...[
                          StatItem(
                            label: l10n.uvIndex,
                            value: today.uvIndex.toStringAsFixed(1),
                            icon: Icons.wb_sunny_outlined,
                            subtitle: uvText,
                            iconColor: const Color(0xFFFFD54F),
                          ),
                          StatItem(
                            label: l10n.sunrise,
                            value: DateFormat.jm(isBengali ? 'bn' : 'en').format(today.sunrise),
                            icon: Icons.wb_twilight,
                            subtitle: l10n.dawnLabel,
                            iconColor: const Color(0xFFFFAB91),
                          ),
                          StatItem(
                            label: l10n.sunset,
                            value: DateFormat.jm(isBengali ? 'bn' : 'en').format(today.sunset),
                            icon: Icons.nightlight_outlined,
                            subtitle: l10n.duskLabel,
                            iconColor: const Color(0xFFCE93D8),
                          ),
                        ],
                        StatItem(
                          label: l10n.updated,
                          value: DateFormat.jm(isBengali ? 'bn' : 'en').format(weather.observedAt),
                          icon: Icons.update,
                          subtitle: l10n.liveDataLabel,
                          iconColor: const Color(0xFFB0BEC5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
    this.icon,
    this.atmosphere,
  });

  final String title;
  final Widget child;
  final IconData? icon;
  final WeatherAtmosphere? atmosphere;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      backgroundColor: atmosphere?.cardBackgroundColor,
      borderColor: atmosphere?.cardBorderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: Colors.white.withValues(alpha: 0.75),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
