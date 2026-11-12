import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/utils/weather_code_mapper.dart';

void main() {
  test('maps clear sky', () {
    final info = weatherCodeInfo(0);

    expect(info.description, 'Clear sky');
    expect(info.icon, '☀️');
  });

  test('maps rain and thunderstorm codes', () {
    expect(weatherCodeInfo(63).description, 'Rain');
    expect(weatherCodeInfo(95).description, 'Thunderstorm');
  });

  test('uses an unknown fallback for unsupported codes', () {
    expect(weatherCodeInfo(999).description, 'Unknown conditions');
  });
}
