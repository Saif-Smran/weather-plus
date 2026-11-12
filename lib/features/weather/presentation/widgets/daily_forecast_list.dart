import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/weather_code_mapper.dart';
import '../../domain/entities/daily_forecast.dart';

class DailyForecastList extends StatelessWidget {
  const DailyForecastList({super.key, required this.forecasts});

  final List<DailyForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (index, forecast) in forecasts.take(7).indexed)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text(
              index == 0 ? 'Today' : DateFormat.E().format(forecast.date),
            ),
            title: Text(weatherCodeInfo(forecast.weatherCode).description),
            subtitle: Text(
              '${forecast.minTemperature.round()}° / '
              '${forecast.maxTemperature.round()}°',
            ),
            trailing: Text(
              weatherCodeInfo(forecast.weatherCode).icon,
              style: const TextStyle(fontSize: 28),
            ),
          ),
      ],
    );
  }
}
