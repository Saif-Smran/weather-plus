import 'hourly_forecast.dart';
import 'daily_forecast.dart';

class Weather {
  const Weather({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    this.utcOffsetSeconds,
    required this.observedAt,
    required this.temperature,
    required this.apparentTemperature,
    required this.relativeHumidity,
    required this.weatherCode,
    required this.windSpeed,
    required this.hourly,
    required this.daily,
    this.isFromCache = false,
    this.lastUpdated,
  });

  final double latitude;
  final double longitude;
  final String timezone;
  final int? utcOffsetSeconds;
  final DateTime observedAt;
  final double temperature;
  final double apparentTemperature;
  final int relativeHumidity;
  final int weatherCode;
  final double windSpeed;
  final List<HourlyForecast> hourly;
  final List<DailyForecast> daily;
  final bool isFromCache;
  final DateTime? lastUpdated;

  /// Returns the current local time of the queried location/city.
  /// Uses [utcOffsetSeconds] from the weather provider, falling back to [observedAt].
  DateTime get currentLocalTime {
    if (utcOffsetSeconds != null) {
      return DateTime.now().toUtc().add(Duration(seconds: utcOffsetSeconds!));
    }
    return observedAt;
  }

  /// Returns the 24 hourly forecast items starting with the current local time/hour.
  List<HourlyForecast> get next24Hours {
    if (hourly.isEmpty) return const [];
    final ref = currentLocalTime;

    // 1. Try to find the exact matching hour on the same day
    int startIndex = hourly.indexWhere(
      (h) =>
          h.time.year == ref.year &&
          h.time.month == ref.month &&
          h.time.day == ref.day &&
          h.time.hour == ref.hour,
    );

    // 2. Fallback: find first item after ref - 30 minutes
    if (startIndex == -1) {
      startIndex = hourly.indexWhere(
        (h) => !h.time.isBefore(ref.subtract(const Duration(minutes: 30))),
      );
    }

    // 3. Fallback: find item with minimum absolute time difference
    if (startIndex == -1) {
      int bestIdx = 0;
      int bestDiff = (hourly[0].time.difference(ref)).inMinutes.abs();
      for (int i = 1; i < hourly.length; i++) {
        final diff = (hourly[i].time.difference(ref)).inMinutes.abs();
        if (diff < bestDiff) {
          bestDiff = diff;
          bestIdx = i;
        }
      }
      startIndex = bestIdx;
    }

    final slice = hourly.skip(startIndex).take(24).toList();
    if (slice.isEmpty) {
      return hourly.take(24).toList();
    }
    return slice;
  }
}
