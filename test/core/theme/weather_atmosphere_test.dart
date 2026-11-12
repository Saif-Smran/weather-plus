import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/theme/weather_atmosphere.dart';

void main() {
  group('WeatherAtmosphere day phase resolution', () {
    final sunrise = DateTime(2026, 11, 12, 6, 0);
    final sunset = DateTime(2026, 11, 12, 17, 30);

    test('resolves day when within daylight hours', () {
      final noon = DateTime(2026, 11, 12, 12, 0);
      final phase = WeatherAtmosphere.resolveDayPhase(
        time: noon,
        sunrise: sunrise,
        sunset: sunset,
      );
      expect(phase, DayPhase.day);
      expect(phase.isDaytime, isTrue);
      expect(phase.isNighttime, isFalse);
    });

    test('resolves night when after sunset and before sunrise', () {
      final midnight = DateTime(2026, 11, 12, 23, 0);
      final phase = WeatherAtmosphere.resolveDayPhase(
        time: midnight,
        sunrise: sunrise,
        sunset: sunset,
      );
      expect(phase, DayPhase.night);
      expect(phase.isNighttime, isTrue);
      expect(phase.isDaytime, isFalse);
    });

    test('resolves dawn around sunrise', () {
      final atSunrise = DateTime(2026, 11, 12, 6, 10);
      final phase = WeatherAtmosphere.resolveDayPhase(
        time: atSunrise,
        sunrise: sunrise,
        sunset: sunset,
      );
      expect(phase, DayPhase.dawn);
    });

    test('resolves dusk around sunset', () {
      final atSunset = DateTime(2026, 11, 12, 17, 40);
      final phase = WeatherAtmosphere.resolveDayPhase(
        time: atSunset,
        sunrise: sunrise,
        sunset: sunset,
      );
      expect(phase, DayPhase.dusk);
    });
  });

  group('WeatherAtmosphere colors and shades', () {
    test('daytime produces bright sky gradient', () {
      final atmosphere = WeatherAtmosphere.build(
        dayPhase: DayPhase.day,
        weatherType: WeatherAtmosphereType.clear,
        temperatureC: 22.0,
      );
      expect(atmosphere.showSun, isTrue);
      expect(atmosphere.showMoon, isFalse);
      expect(atmosphere.gradientColors.first, isNot(equals(const Color(0xFF060914))));
    });

    test('nighttime produces dark shade gradient and moon', () {
      final atmosphere = WeatherAtmosphere.build(
        dayPhase: DayPhase.night,
        weatherType: WeatherAtmosphereType.clear,
        temperatureC: 15.0,
      );
      expect(atmosphere.showMoon, isTrue);
      expect(atmosphere.showSun, isFalse);
      expect(atmosphere.showStars, isTrue);
      // First gradient color is deep nocturnal shade
      expect(atmosphere.gradientColors.first.r, lessThan(0.1));
    });

    test('hot weather introduces warm amber tones', () {
      final atmosphere = WeatherAtmosphere.build(
        dayPhase: DayPhase.day,
        weatherType: WeatherAtmosphereType.clear,
        temperatureC: 34.0,
      );
      expect(atmosphere.gradientColors.last, const Color(0xFFFFA726));
    });

    test('cold weather introduces cool crystalline tones', () {
      final atmosphere = WeatherAtmosphere.build(
        dayPhase: DayPhase.day,
        weatherType: WeatherAtmosphereType.clear,
        temperatureC: 2.0,
      );
      expect(atmosphere.gradientColors.last, const Color(0xFFB3E5FC));
    });
  });
}

