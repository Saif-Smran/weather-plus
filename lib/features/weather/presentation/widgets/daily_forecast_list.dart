import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/weather_atmosphere.dart';
import '../../../../core/utils/weather_code_mapper.dart';
import '../../domain/entities/daily_forecast.dart';

class DailyForecastList extends StatelessWidget {
  const DailyForecastList({
    super.key,
    required this.forecasts,
    this.currentTemperature,
    this.atmosphere,
  });

  final List<DailyForecast> forecasts;
  final double? currentTemperature;
  final WeatherAtmosphere? atmosphere;

  @override
  Widget build(BuildContext context) {
    final days = forecasts.take(7).toList();
    if (days.isEmpty) return const SizedBox.shrink();

    // Compute global min & max to scale the temperature range bars
    double minWeekTemp = days.first.minTemperature;
    double maxWeekTemp = days.first.maxTemperature;
    for (final day in days) {
      if (day.minTemperature < minWeekTemp) minWeekTemp = day.minTemperature;
      if (day.maxTemperature > maxWeekTemp) maxWeekTemp = day.maxTemperature;
    }
    final range = (maxWeekTemp - minWeekTemp).clamp(1.0, 100.0);

    return Column(
      children: [
        for (final (index, forecast) in days.indexed)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                // Day name
                SizedBox(
                  width: 58,
                  child: Text(
                    index == 0 ? 'Today' : DateFormat('EEE').format(forecast.date),
                    style: TextStyle(
                      color: index == 0
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.85),
                      fontWeight: index == 0 ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),

                // Weather Icon
                SizedBox(
                  width: 38,
                  child: Center(
                    child: Text(
                      weatherCodeInfo(forecast.weatherCode).icon,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Min temp
                SizedBox(
                  width: 32,
                  child: Text(
                    '${forecast.minTemperature.round()}°',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

                const SizedBox(width: 10),

                // Dynamic Temperature Range Bar
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final totalWidth = constraints.maxWidth;
                      final leftPercent = ((forecast.minTemperature - minWeekTemp) / range).clamp(0.0, 1.0);
                      final rightPercent = ((forecast.maxTemperature - minWeekTemp) / range).clamp(0.0, 1.0);
                      final startX = leftPercent * totalWidth;
                      final barWidth = ((rightPercent - leftPercent) * totalWidth).clamp(12.0, totalWidth);

                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          // Background track
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),

                          // Active temperature gradient bar
                          Positioned(
                            left: startX,
                            child: Container(
                              width: barWidth,
                              height: 6,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF81D4FA),
                                    Color(0xFFFFB74D),
                                    Color(0xFFFF8A65),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),

                          // Current temp dot indicator (if today)
                          if (index == 0 && currentTemperature != null)
                            Positioned(
                              left: (((currentTemperature! - minWeekTemp) / range).clamp(0.0, 1.0) * totalWidth - 4).clamp(0.0, totalWidth - 8),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.4),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(width: 10),

                // Max temp
                SizedBox(
                  width: 32,
                  child: Text(
                    '${forecast.maxTemperature.round()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
