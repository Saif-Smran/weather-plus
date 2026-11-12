import 'package:flutter/material.dart';

import '../../features/weather/domain/entities/weather.dart';

enum DayPhase {
  dawn,
  day,
  dusk,
  night;

  bool get isDaytime => this == DayPhase.day || this == DayPhase.dawn;
  bool get isNighttime => this == DayPhase.night || this == DayPhase.dusk;
}

enum WeatherAtmosphereType {
  clear,
  partlyCloudy,
  cloudy,
  fog,
  rain,
  thunderstorm,
  snow,
  unknown,
}

class WeatherAtmosphere {
  const WeatherAtmosphere({
    required this.dayPhase,
    required this.weatherType,
    required this.gradientColors,
    required this.accentColor,
    required this.cardBackgroundColor,
    required this.cardBorderColor,
    required this.textColor,
    required this.subtextColor,
    required this.showStars,
    required this.showSun,
    required this.showMoon,
    required this.showClouds,
    required this.showRain,
    required this.showSnow,
    required this.showLightning,
  });

  final DayPhase dayPhase;
  final WeatherAtmosphereType weatherType;
  final List<Color> gradientColors;
  final Color accentColor;
  final Color cardBackgroundColor;
  final Color cardBorderColor;
  final Color textColor;
  final Color subtextColor;
  final bool showStars;
  final bool showSun;
  final bool showMoon;
  final bool showClouds;
  final bool showRain;
  final bool showSnow;
  final bool showLightning;

  static DayPhase resolveDayPhase({
    required DateTime time,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    if (sunrise != null && sunset != null) {
      final dawnStart = sunrise.subtract(const Duration(minutes: 45));
      final dawnEnd = sunrise.add(const Duration(minutes: 45));
      final duskStart = sunset.subtract(const Duration(minutes: 45));
      final duskEnd = sunset.add(const Duration(minutes: 45));

      if (time.isAfter(dawnStart) && time.isBefore(dawnEnd)) {
        return DayPhase.dawn;
      }
      if (time.isAfter(duskStart) && time.isBefore(duskEnd)) {
        return DayPhase.dusk;
      }
      if (time.isAfter(dawnEnd) && time.isBefore(duskStart)) {
        return DayPhase.day;
      }
      return DayPhase.night;
    }

    // Fallback to local hour if sunrise/sunset are unavailable
    final hour = time.hour;
    if (hour >= 5 && hour < 7) return DayPhase.dawn;
    if (hour >= 7 && hour < 18) return DayPhase.day;
    if (hour >= 18 && hour < 20) return DayPhase.dusk;
    return DayPhase.night;
  }

  static WeatherAtmosphereType resolveWeatherType(int code) {
    if (code == 0) return WeatherAtmosphereType.clear;
    if (code == 1 || code == 2) return WeatherAtmosphereType.partlyCloudy;
    if (code == 3) return WeatherAtmosphereType.cloudy;
    if (code >= 45 && code <= 48) return WeatherAtmosphereType.fog;
    if ((code >= 51 && code <= 67) || (code >= 80 && code <= 82)) {
      return WeatherAtmosphereType.rain;
    }
    if ((code >= 71 && code <= 77) || code == 85 || code == 86) {
      return WeatherAtmosphereType.snow;
    }
    if (code == 95 || code == 96 || code == 99) {
      return WeatherAtmosphereType.thunderstorm;
    }
    return WeatherAtmosphereType.unknown;
  }

  factory WeatherAtmosphere.fromWeather(Weather? weather) {
    if (weather == null) {
      return WeatherAtmosphere._defaultDay();
    }

    final now = DateTime.now();
    final today = weather.daily.isNotEmpty ? weather.daily.first : null;
    final dayPhase = resolveDayPhase(
      time: now,
      sunrise: today?.sunrise,
      sunset: today?.sunset,
    );
    final weatherType = resolveWeatherType(weather.weatherCode);
    final tempC = weather.temperature;

    return WeatherAtmosphere.build(
      dayPhase: dayPhase,
      weatherType: weatherType,
      temperatureC: tempC,
    );
  }

  factory WeatherAtmosphere._defaultDay() {
    return const WeatherAtmosphere(
      dayPhase: DayPhase.day,
      weatherType: WeatherAtmosphereType.clear,
      gradientColors: [
        Color(0xFF1E88E5),
        Color(0xFF42A5F5),
        Color(0xFF90CAF9),
      ],
      accentColor: Color(0xFFFFB300),
      cardBackgroundColor: Color(0x33FFFFFF),
      cardBorderColor: Color(0x33FFFFFF),
      textColor: Colors.white,
      subtextColor: Color(0xCCFFFFFF),
      showStars: false,
      showSun: true,
      showMoon: false,
      showClouds: false,
      showRain: false,
      showSnow: false,
      showLightning: false,
    );
  }

  factory WeatherAtmosphere.build({
    required DayPhase dayPhase,
    required WeatherAtmosphereType weatherType,
    required double temperatureC,
  }) {
    List<Color> gradientColors;
    Color accentColor;
    bool showStars = false;
    bool showSun = false;
    bool showMoon = false;
    bool showClouds = false;
    bool showRain = false;
    bool showSnow = false;
    bool showLightning = false;

    final isHot = temperatureC >= 28.0;
    final isCold = temperatureC <= 6.0;

    switch (dayPhase) {
      case DayPhase.day:
        showSun = weatherType == WeatherAtmosphereType.clear ||
            weatherType == WeatherAtmosphereType.partlyCloudy;
        showClouds = weatherType != WeatherAtmosphereType.clear;
        showRain = weatherType == WeatherAtmosphereType.rain;
        showSnow = weatherType == WeatherAtmosphereType.snow;
        showLightning = weatherType == WeatherAtmosphereType.thunderstorm;

        switch (weatherType) {
          case WeatherAtmosphereType.clear:
            if (isHot) {
              // Hot sunny day
              gradientColors = const [
                Color(0xFF1565C0),
                Color(0xFF1E88E5),
                Color(0xFFFFA726),
              ];
              accentColor = const Color(0xFFFFD54F);
            } else if (isCold) {
              // Crisp winter sunny day
              gradientColors = const [
                Color(0xFF1565C0),
                Color(0xFF42A5F5),
                Color(0xFFB3E5FC),
              ];
              accentColor = const Color(0xFFE1F5FE);
            } else {
              // Bright pleasant sunny day
              gradientColors = const [
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
                Color(0xFF81D4FA),
              ];
              accentColor = const Color(0xFFFFE082);
            }
            break;

          case WeatherAtmosphereType.partlyCloudy:
            gradientColors = const [
              Color(0xFF1E88E5),
              Color(0xFF64B5F6),
              Color(0xFFB0BEC5),
            ];
            accentColor = const Color(0xFFFFD54F);
            break;

          case WeatherAtmosphereType.cloudy:
            gradientColors = const [
              Color(0xFF37474F),
              Color(0xFF546E7A),
              Color(0xFF78909C),
            ];
            accentColor = const Color(0xFF90A4AE);
            break;

          case WeatherAtmosphereType.fog:
            gradientColors = const [
              Color(0xFF455A64),
              Color(0xFF607D8B),
              Color(0xFF90A4AE),
            ];
            accentColor = const Color(0xFFCFD8DC);
            break;

          case WeatherAtmosphereType.rain:
            gradientColors = const [
              Color(0xFF1C3144),
              Color(0xFF2B4C6F),
              Color(0xFF4A6B82),
            ];
            accentColor = const Color(0xFF80D8FF);
            break;

          case WeatherAtmosphereType.thunderstorm:
            gradientColors = const [
              Color(0xFF1A1A2E),
              Color(0xFF282846),
              Color(0xFF413C58),
            ];
            accentColor = const Color(0xFFE040FB);
            break;

          case WeatherAtmosphereType.snow:
            gradientColors = const [
              Color(0xFF37474F),
              Color(0xFF546E7A),
              Color(0xFFECEFF1),
            ];
            accentColor = const Color(0xFFFFFFFF);
            break;

          case WeatherAtmosphereType.unknown:
            gradientColors = const [
              Color(0xFF1E88E5),
              Color(0xFF42A5F5),
              Color(0xFF90CAF9),
            ];
            accentColor = const Color(0xFFFFD54F);
            break;
        }
        break;

      case DayPhase.dawn:
      case DayPhase.dusk:
        showClouds = weatherType != WeatherAtmosphereType.clear;
        showRain = weatherType == WeatherAtmosphereType.rain;
        showSnow = weatherType == WeatherAtmosphereType.snow;
        showLightning = weatherType == WeatherAtmosphereType.thunderstorm;
        showStars = dayPhase == DayPhase.dusk &&
            weatherType == WeatherAtmosphereType.clear;

        switch (weatherType) {
          case WeatherAtmosphereType.clear:
          case WeatherAtmosphereType.partlyCloudy:
            gradientColors = const [
              Color(0xFF1A1F38),
              Color(0xFF4A1E58),
              Color(0xFFB03A2E),
              Color(0xFFF39C12),
            ];
            accentColor = const Color(0xFFF9A825);
            break;

          case WeatherAtmosphereType.cloudy:
          case WeatherAtmosphereType.fog:
            gradientColors = const [
              Color(0xFF263238),
              Color(0xFF4527A0),
              Color(0xFF6A1B9A),
              Color(0xFF8D6E63),
            ];
            accentColor = const Color(0xFFFFAB91);
            break;

          case WeatherAtmosphereType.rain:
          case WeatherAtmosphereType.thunderstorm:
            gradientColors = const [
              Color(0xFF0F172A),
              Color(0xFF1E1B4B),
              Color(0xFF31103F),
              Color(0xFF4C1D95),
            ];
            accentColor = const Color(0xFFC084FC);
            break;

          case WeatherAtmosphereType.snow:
            gradientColors = const [
              Color(0xFF1E293B),
              Color(0xFF334155),
              Color(0xFF64748B),
              Color(0xFFCBD5E1),
            ];
            accentColor = const Color(0xFFE2E8F0);
            break;

          case WeatherAtmosphereType.unknown:
            gradientColors = const [
              Color(0xFF1A1F38),
              Color(0xFF512DA8),
              Color(0xFFE65100),
            ];
            accentColor = const Color(0xFFFFB74D);
            break;
        }
        break;

      case DayPhase.night:
        showMoon = weatherType == WeatherAtmosphereType.clear ||
            weatherType == WeatherAtmosphereType.partlyCloudy;
        showStars = weatherType == WeatherAtmosphereType.clear ||
            weatherType == WeatherAtmosphereType.partlyCloudy;
        showClouds = weatherType != WeatherAtmosphereType.clear;
        showRain = weatherType == WeatherAtmosphereType.rain;
        showSnow = weatherType == WeatherAtmosphereType.snow;
        showLightning = weatherType == WeatherAtmosphereType.thunderstorm;

        switch (weatherType) {
          case WeatherAtmosphereType.clear:
            if (isCold) {
              // Deep crisp freezing starlit night
              gradientColors = const [
                Color(0xFF040814),
                Color(0xFF0B1426),
                Color(0xFF132238),
              ];
              accentColor = const Color(0xFF80D8FF);
            } else {
              // Deep dark velvety night
              gradientColors = const [
                Color(0xFF060914),
                Color(0xFF0C1322),
                Color(0xFF172033),
              ];
              accentColor = const Color(0xFF82B1FF);
            }
            break;

          case WeatherAtmosphereType.partlyCloudy:
            gradientColors = const [
              Color(0xFF080D1A),
              Color(0xFF10192A),
              Color(0xFF1C283E),
            ];
            accentColor = const Color(0xFF90CAF9);
            break;

          case WeatherAtmosphereType.cloudy:
            gradientColors = const [
              Color(0xFF0B0F17),
              Color(0xFF141A24),
              Color(0xFF1F2633),
            ];
            accentColor = const Color(0xFF78909C);
            break;

          case WeatherAtmosphereType.fog:
            gradientColors = const [
              Color(0xFF0C111A),
              Color(0xFF18202C),
              Color(0xFF263238),
            ];
            accentColor = const Color(0xFFB0BEC5);
            break;

          case WeatherAtmosphereType.rain:
            gradientColors = const [
              Color(0xFF050B14),
              Color(0xFF0D1B2A),
              Color(0xFF1A2B3C),
            ];
            accentColor = const Color(0xFF40C4FF);
            break;

          case WeatherAtmosphereType.thunderstorm:
            gradientColors = const [
              Color(0xFF06060F),
              Color(0xFF100E24),
              Color(0xFF1D173E),
            ];
            accentColor = const Color(0xFFEA80FC);
            break;

          case WeatherAtmosphereType.snow:
            gradientColors = const [
              Color(0xFF080D1A),
              Color(0xFF141F30),
              Color(0xFF223247),
            ];
            accentColor = const Color(0xFFECEFF1);
            break;

          case WeatherAtmosphereType.unknown:
            gradientColors = const [
              Color(0xFF060914),
              Color(0xFF0E1626),
              Color(0xFF1B2538),
            ];
            accentColor = const Color(0xFF82B1FF);
            break;
        }
        break;
    }

    // Glassmorphism styling tuned for high contrast and elegant translucent layers
    final cardBg = dayPhase.isNighttime
        ? const Color(0x2E1E293B)
        : const Color(0x38FFFFFF);
    final cardBorder = dayPhase.isNighttime
        ? const Color(0x3364748B)
        : const Color(0x52FFFFFF);

    return WeatherAtmosphere(
      dayPhase: dayPhase,
      weatherType: weatherType,
      gradientColors: gradientColors,
      accentColor: accentColor,
      cardBackgroundColor: cardBg,
      cardBorderColor: cardBorder,
      textColor: Colors.white,
      subtextColor: const Color(0xD9FFFFFF),
      showStars: showStars,
      showSun: showSun,
      showMoon: showMoon,
      showClouds: showClouds,
      showRain: showRain,
      showSnow: showSnow,
      showLightning: showLightning,
    );
  }
}
