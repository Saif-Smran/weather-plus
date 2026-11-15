import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_plus/features/weather/domain/entities/weather.dart';

void main() {
  group('Searched City Local Time', () {
    test('computes exact local time using positive utcOffsetSeconds (e.g. Tokyo +9h)', () {
      final weather = Weather(
        latitude: 35.68,
        longitude: 139.76,
        timezone: 'Asia/Tokyo',
        utcOffsetSeconds: 32400, // +9 hours
        observedAt: DateTime.parse('2026-11-15T16:30'),
        temperature: 18.0,
        apparentTemperature: 18.0,
        relativeHumidity: 50,
        weatherCode: 0,
        windSpeed: 5.0,
        hourly: const [],
        daily: const [],
      );

      final nowUtc = DateTime.now().toUtc();
      final expectedLocal = nowUtc.add(const Duration(seconds: 32400));
      final actualLocal = weather.currentLocalTime;

      expect(actualLocal.difference(expectedLocal).inSeconds.abs(), lessThan(2));
    });

    test('computes exact local time using negative utcOffsetSeconds (e.g. New York -5h)', () {
      final weather = Weather(
        latitude: 40.71,
        longitude: -74.00,
        timezone: 'America/New_York',
        utcOffsetSeconds: -18000, // -5 hours
        observedAt: DateTime.parse('2026-11-15T02:30'),
        temperature: 8.0,
        apparentTemperature: 6.0,
        relativeHumidity: 65,
        weatherCode: 1,
        windSpeed: 12.0,
        hourly: const [],
        daily: const [],
      );

      final nowUtc = DateTime.now().toUtc();
      final expectedLocal = nowUtc.add(const Duration(seconds: -18000));
      final actualLocal = weather.currentLocalTime;

      expect(actualLocal.difference(expectedLocal).inSeconds.abs(), lessThan(2));
    });

    test('falls back to observedAt when utcOffsetSeconds is null', () {
      final observed = DateTime.parse('2026-11-15T14:45');
      final weather = Weather(
        latitude: 51.50,
        longitude: -0.12,
        timezone: 'Europe/London',
        utcOffsetSeconds: null,
        observedAt: observed,
        temperature: 12.0,
        apparentTemperature: 11.0,
        relativeHumidity: 70,
        weatherCode: 3,
        windSpeed: 10.0,
        hourly: const [],
        daily: const [],
      );

      expect(weather.currentLocalTime, observed);
    });

    test('next24Hours starts with the current local hour and returns 24 items', () {
      final observed = DateTime(2026, 11, 15, 14, 25);
      // Generate 72 hours of hourly forecasts from midnight
      final hourlyList = List.generate(
        72,
        (i) => HourlyForecast(
          time: DateTime(2026, 11, 15, 0, 0).add(Duration(hours: i)),
          temperature: 20.0 + (i % 5),
          precipitationProbability: (i * 3) % 100,
          weatherCode: 1,
        ),
      );

      final weather = Weather(
        latitude: 23.81,
        longitude: 90.41,
        timezone: 'Asia/Dhaka',
        utcOffsetSeconds: null, // will use observedAt
        observedAt: observed,
        temperature: 24.0,
        apparentTemperature: 24.0,
        relativeHumidity: 60,
        weatherCode: 1,
        windSpeed: 8.0,
        hourly: hourlyList,
        daily: const [],
      );

      final next24 = weather.next24Hours;
      expect(next24.length, 24);
      // The first item should start at 14:00 (the current hour)
      expect(next24.first.time, DateTime(2026, 11, 15, 14, 0));
      // The last item should be at 13:00 the next day (+23 hours)
      expect(next24.last.time, DateTime(2026, 11, 16, 13, 0));
    });
  });
}

