import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/weather_code_mapper.dart';
import '../../domain/entities/hourly_forecast.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key, required this.forecasts});

  final List<HourlyForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    final visibleForecasts = forecasts.take(24).toList();
    return SizedBox(
      height: 142,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleForecasts.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final forecast = visibleForecasts[index];
          final condition = weatherCodeInfo(forecast.weatherCode);
          return SizedBox(
            width: 82,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.j().format(forecast.time)),
                    Text(condition.icon, style: const TextStyle(fontSize: 24)),
                    Text('${forecast.temperature.round()}°'),
                    Text(
                      '${forecast.precipitationProbability}%',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
