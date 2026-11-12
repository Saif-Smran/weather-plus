class DailyForecast {
  const DailyForecast({
    required this.date,
    required this.weatherCode,
    required this.maxTemperature,
    required this.minTemperature,
    required this.sunrise,
    required this.sunset,
    required this.uvIndex,
  });

  final DateTime date;
  final int weatherCode;
  final double maxTemperature;
  final double minTemperature;
  final DateTime sunrise;
  final DateTime sunset;
  final double uvIndex;
}
