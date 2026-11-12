import 'package:flutter/material.dart';

import '../../../../core/utils/weather_code_mapper.dart';
import '../../domain/entities/weather.dart';
import '../../../settings/domain/entities/settings.dart';
import '../../../settings/presentation/utils/weather_formatters.dart';

class CurrentWeatherHeader extends StatelessWidget {
  const CurrentWeatherHeader({
    super.key,
    required this.weather,
    required this.temperatureUnit,
    this.cityName,
  });

  final Weather weather;
  final TemperatureUnit temperatureUnit;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    final condition = weatherCodeInfo(weather.weatherCode);

    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.25),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                cityName ?? 'Current location',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(condition.icon, style: const TextStyle(fontSize: 68)),
          Text(
            formatTemperature(weather.temperature, temperatureUnit),
            style: Theme.of(context).textTheme.displayMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Text(
            condition.description,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            'Feels like '
            '${formatTemperature(weather.apparentTemperature, temperatureUnit)}',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.85)),
          ),
        ],
      ),
    );
  }
}
