import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/weather_atmosphere.dart';
import '../../../../core/utils/weather_code_mapper.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../settings/domain/entities/settings.dart';
import '../../../settings/presentation/utils/weather_formatters.dart';
import '../../domain/entities/weather.dart';

class CurrentWeatherHeader extends StatelessWidget {
  const CurrentWeatherHeader({
    super.key,
    required this.weather,
    required this.temperatureUnit,
    this.cityName,
    this.atmosphere,
    this.isBengali = false,
  });

  final Weather weather;
  final TemperatureUnit temperatureUnit;
  final String? cityName;
  final WeatherAtmosphere? atmosphere;
  final bool isBengali;

  @override
  Widget build(BuildContext context) {
    final isDay = atmosphere?.dayPhase.isDaytime ?? true;
    final condition = weatherCodeInfo(
      weather.weatherCode,
      isDay: isDay,
      isBengali: isBengali,
    );
    final today = weather.daily.isNotEmpty ? weather.daily.first : null;

    final cityTime = weather.currentLocalTime;
    final formattedDate = DateFormat(
      'EEEE, MMM d • h:mm a',
      isBengali ? 'bn' : 'en',
    ).format(cityTime);

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      borderRadius: 28,
      backgroundColor: atmosphere?.cardBackgroundColor,
      borderColor: atmosphere?.cardBorderColor,
      child: Column(
        children: [
          // Location and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  cityName ?? 'Current location',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            formattedDate,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (weather.isFromCache) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0x33FFA726),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x66FFA726)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cloud_off, size: 12, color: Color(0xFFFFB74D)),
                  const SizedBox(width: 4),
                  Text(
                    'Offline cache (${DateFormat.jm().format(weather.observedAt)})',
                    style: const TextStyle(
                      color: Color(0xFFFFB74D),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          // Weather Icon & Temperature Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                condition.icon,
                style: const TextStyle(fontSize: 64),
              ),
              const SizedBox(width: 14),
              Text(
                formatTemperature(weather.temperature, temperatureUnit),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 68,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                  height: 1.0,
                  shadows: [
                    Shadow(
                      color: Color(0x33000000),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Weather condition description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.25),
                width: 1,
              ),
            ),
            child: Text(
              condition.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // High / Low & Feels like pill
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (today != null) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.white70,
                      size: 14,
                    ),
                    Text(
                      formatTemperature(today.maxTemperature, temperatureUnit),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.white70,
                      size: 14,
                    ),
                    Text(
                      formatTemperature(today.minTemperature, temperatureUnit),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
              Text(
                isBengali
                    ? 'অনুভূত হচ্ছে ${formatTemperature(weather.apparentTemperature, temperatureUnit)}'
                    : 'Feels like ${formatTemperature(weather.apparentTemperature, temperatureUnit)}',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
