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
  });

  final Weather weather;
  final TemperatureUnit temperatureUnit;

  @override
  Widget build(BuildContext context) {
    final condition = weatherCodeInfo(weather.weatherCode);

    return Column(
      children: [
        Text('Dhaka', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(condition.icon, style: const TextStyle(fontSize: 64)),
        Text(
          formatTemperature(weather.temperature, temperatureUnit),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(condition.description),
        const SizedBox(height: 4),
        Text(
          'Feels like '
          '${formatTemperature(weather.apparentTemperature, temperatureUnit)}',
        ),
      ],
    );
  }
}
