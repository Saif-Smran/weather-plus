import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/weather_atmosphere.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/utils/aqi_mapper.dart';
import '../providers/air_quality_providers.dart';

class AirQualityCard extends ConsumerWidget {
  const AirQualityCard({
    super.key,
    required this.coordinates,
    this.atmosphere,
  });

  final ({double latitude, double longitude}) coordinates;
  final WeatherAtmosphere? atmosphere;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aqiAsync = ref.watch(airQualityProvider(coordinates));

    return aqiAsync.when(
      loading: () => GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(18),
        backgroundColor: atmosphere?.cardBackgroundColor,
        borderColor: atmosphere?.cardBorderColor,
        child: const SizedBox(
          height: 90,
          child: Center(
            child: CircularProgressIndicator(color: Colors.white70),
          ),
        ),
      ),
      error: (error, stack) => const SizedBox.shrink(),
      data: (aqi) {
        final info = mapAqiCategory(aqi.usAqi);

        // Calculate progress percentage along AQI spectrum (0 to 300)
        final progress = (aqi.usAqi / 300).clamp(0.0, 1.0);

        return GlassCard(
          borderRadius: 24,
          padding: const EdgeInsets.all(18),
          backgroundColor: atmosphere?.cardBackgroundColor,
          borderColor: atmosphere?.cardBorderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row: AQI value and Category badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${aqi.usAqi}',
                          style: TextStyle(
                            color: info.color,
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'AIR QUALITY INDEX',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: info.color.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: info.color.withValues(alpha: 0.6),
                        width: 1.2,
                      ),
                    ),
                    child: Text(
                      info.label,
                      style: TextStyle(
                        color: info.color,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Visual Spectrum Bar
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4CAF50), // Good
                              Color(0xFFFFEB3B), // Moderate
                              Color(0xFFFF9800), // Sensitive
                              Color(0xFFE53935), // Unhealthy
                              Color(0xFF8E24AA), // Very Unhealthy
                              Color(0xFFB71C1C), // Hazardous
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: (progress * (width - 12)).clamp(0.0, width - 12),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black45, width: 1.5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 14),

              // Advisory description
              Text(
                info.description,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 14),
              const Divider(color: Colors.white12, height: 1),
              const SizedBox(height: 12),

              // Pollutants row: PM2.5 and PM10
              Row(
                children: [
                  Expanded(
                    child: _PollutantMetric(
                      label: 'PM2.5',
                      value: '${aqi.pm2_5.toStringAsFixed(1)} µg/m³',
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 24,
                    color: Colors.white12,
                  ),
                  Expanded(
                    child: _PollutantMetric(
                      label: 'PM10',
                      value: '${aqi.pm10.toStringAsFixed(1)} µg/m³',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PollutantMetric extends StatelessWidget {
  const _PollutantMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
