import 'hourly_forecast.dart';
import 'daily_forecast.dart';

class Weather {
  const Weather({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.temperature,
    required this.apparentTemperature,
    required this.relativeHumidity,
    required this.weatherCode,
    required this.windSpeed,
    required this.hourly,
    required this.daily,
  });

  final double latitude;
  final double longitude;
  final String timezone;
  final double temperature;
  final double apparentTemperature;
  final int relativeHumidity;
  final int weatherCode;
  final double windSpeed;
  final List<HourlyForecast> hourly;
  final List<DailyForecast> daily;
}
