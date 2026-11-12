import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/constants/api_endpoints.dart';

void main() {
  test('defines the Open-Meteo service endpoints', () {
    expect(ApiEndpoints.forecast, startsWith('https://api.open-meteo.com/'));
    expect(
      ApiEndpoints.geocoding,
      startsWith('https://geocoding-api.open-meteo.com/'),
    );
    expect(
      ApiEndpoints.airQuality,
      startsWith('https://air-quality-api.open-meteo.com/'),
    );
  });
}
