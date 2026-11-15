import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/weather_atmosphere.dart';
import '../../../../core/utils/weather_code_mapper.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/entities/hourly_forecast.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({
    super.key,
    required this.forecasts,
    this.atmosphere,
    this.isBengali = false,
  });

  final List<HourlyForecast> forecasts;
  final WeatherAtmosphere? atmosphere;
  final bool isBengali;

  @override
  Widget build(BuildContext context) {
    final visibleForecasts = forecasts.take(24).toList();

    return SizedBox(
      height: 148,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: visibleForecasts.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final forecast = visibleForecasts[index];
          final isNow = index == 0;
          final isDayHour = forecast.time.hour >= 6 && forecast.time.hour < 18;
          final condition = weatherCodeInfo(
            forecast.weatherCode,
            isDay: isDayHour,
            isBengali: isBengali,
          );

          final timeLabel = isNow
              ? (isBengali ? 'এখন' : 'Now')
              : DateFormat('ha', isBengali ? 'bn' : 'en').format(forecast.time);

          return GlassCard(
            borderRadius: 20,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            backgroundColor: isNow
                ? Colors.white.withValues(alpha: 0.25)
                : atmosphere?.cardBackgroundColor,
            borderColor: isNow
                ? (atmosphere?.accentColor.withValues(alpha: 0.8) ??
                    Colors.white.withValues(alpha: 0.5))
                : atmosphere?.cardBorderColor,
            child: SizedBox(
              width: 68,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    timeLabel,
                    style: TextStyle(
                      color: isNow
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                      fontWeight: isNow ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  Text(
                    condition.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                  Text(
                    '${forecast.temperature.round()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (forecast.precipitationProbability > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          size: 10,
                          color: Color(0xFF80D8FF),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${forecast.precipitationProbability}%',
                          style: const TextStyle(
                            color: Color(0xFF80D8FF),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox(height: 14),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
