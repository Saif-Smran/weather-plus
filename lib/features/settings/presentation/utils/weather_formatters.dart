import '../../domain/entities/settings.dart';

String formatTemperature(double celsius, TemperatureUnit unit) {
  final value = unit == TemperatureUnit.celsius
      ? celsius
      : (celsius * 9 / 5) + 32;
  return '${value.round()}°${unit == TemperatureUnit.celsius ? 'C' : 'F'}';
}

String formatWind(double kilometersPerHour, WindUnit unit) {
  final value = unit == WindUnit.kilometersPerHour
      ? kilometersPerHour
      : kilometersPerHour * 0.621371;
  return '${value.round()} ${unit == WindUnit.kilometersPerHour ? 'km/h' : 'mph'}';
}
