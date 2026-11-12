import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_plus/features/weather/data/models/forecast_response_dto.dart';
import 'package:weather_plus/features/weather/data/weather_remote_source.dart';
import 'package:weather_plus/features/weather/data/weather_repository_impl.dart';

class MockWeatherRemoteSource extends Mock implements WeatherRemoteSource {}

void main() {
  late MockWeatherRemoteSource remoteSource;
  late WeatherRepositoryImpl repository;

  setUp(() {
    remoteSource = MockWeatherRemoteSource();
    repository = WeatherRepositoryImpl(remoteSource);
  });

  test('maps a remote forecast DTO to a Weather entity', () async {
    final dto = ForecastResponseDto.fromJson({
      'latitude': 23.81,
      'longitude': 90.41,
      'timezone': 'Asia/Dhaka',
      'current': {
        'time': '2026-11-12T19:15',
        'interval': 900,
        'temperature_2m': 27.1,
        'apparent_temperature': 29.0,
        'relative_humidity_2m': 58,
        'weather_code': 0,
        'wind_speed_10m': 7.2,
      },
      'hourly': {
        'time': ['2026-11-12T19:00'],
        'temperature_2m': [27.1],
        'precipitation_probability': [0],
        'weather_code': [0],
      },
      'daily': {
        'time': ['2026-11-12'],
        'weather_code': [0],
        'temperature_2m_max': [29.5],
        'temperature_2m_min': [21.0],
        'sunrise': ['2026-11-12T06:10'],
        'sunset': ['2026-11-12T17:20'],
        'uv_index_max': [7.2],
      },
    });
    when(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .thenAnswer((_) async => dto);

    final weather = await repository.getWeather(23.81, 90.41);

    expect(weather.temperature, 27.1);
    verify(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .called(1);
  });

  test('propagates remote failures', () async {
    when(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .thenThrow(StateError('request failed'));

    expect(
      () => repository.getWeather(23.81, 90.41),
      throwsA(isA<StateError>()),
    );
  });
}
