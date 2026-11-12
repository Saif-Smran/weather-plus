import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/weather/data/models/forecast_mapper.dart';
import 'package:weather_plus/features/weather/data/models/forecast_response_dto.dart';

void main() {
  test('maps parallel forecast arrays into domain objects', () {
    final json = jsonDecode(
      File('test/fixtures/forecast_sample.json').readAsStringSync(),
    ) as Map<String, dynamic>;

    final weather = ForecastResponseDto.fromJson(json).toEntity();

    expect(weather.temperature, 27.1);
    expect(weather.hourly, hasLength(2));
    expect(weather.hourly[1].precipitationProbability, 10);
    expect(weather.daily, hasLength(2));
    expect(weather.daily[0].maxTemperature, 29.5);
  });
}
