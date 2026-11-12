import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/settings/domain/entities/settings.dart';
import 'package:weather_plus/features/settings/presentation/utils/weather_formatters.dart';

void main() {
  test('formats Celsius and Fahrenheit', () {
    expect(formatTemperature(0, TemperatureUnit.celsius), '0°C');
    expect(formatTemperature(0, TemperatureUnit.fahrenheit), '32°F');
  });

  test('formats kilometers and miles per hour', () {
    expect(formatWind(10, WindUnit.kilometersPerHour), '10 km/h');
    expect(formatWind(10, WindUnit.milesPerHour), '6 mph');
  });
}
