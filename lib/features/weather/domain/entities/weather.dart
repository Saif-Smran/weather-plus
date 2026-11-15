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
}
