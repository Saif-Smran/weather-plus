import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_plus/core/database/app_database.dart';
import 'package:weather_plus/features/weather/data/models/forecast_response_dto.dart';
import 'package:weather_plus/features/weather/data/weather_local_source.dart';
import 'package:weather_plus/features/weather/data/weather_remote_source.dart';
import 'package:weather_plus/features/weather/data/weather_repository_impl.dart';

class MockWeatherRemoteSource extends Mock implements WeatherRemoteSource {}

class MockWeatherLocalSource extends Mock implements WeatherLocalSource {}

void main() {
  late MockWeatherRemoteSource remoteSource;
  late MockWeatherLocalSource localSource;
  late WeatherRepositoryImpl repository;

  final sampleDto = ForecastResponseDto.fromJson({
    'latitude': 23.81,
    'longitude': 90.41,
    'timezone': 'Asia/Dhaka',
    'utc_offset_seconds': 21600,
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

  setUp(() {
    remoteSource = MockWeatherRemoteSource();
    localSource = MockWeatherLocalSource();
    repository = WeatherRepositoryImpl(remoteSource, localSource);
  });

  test('saves fetched forecast to local cache on network success', () async {
    when(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .thenAnswer((_) async => sampleDto);
    when(() => localSource.saveWeather(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          jsonPayload: any(named: 'jsonPayload'),
        )).thenAnswer((_) async {});

    final weather = await repository.getWeather(23.81, 90.41);

    expect(weather.isFromCache, isFalse);
    expect(weather.temperature, 27.1);
    verify(() => localSource.saveWeather(
          latitude: 23.81,
          longitude: 90.41,
          jsonPayload: any(named: 'jsonPayload'),
        )).called(1);
  });

  test('returns cached forecast when network fails and cache is available',
      () async {
    when(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .thenThrow(Exception('No internet'));

    final cachedItem = CachedWeather(
      latitude: 23.81,
      longitude: 90.41,
      jsonPayload:
          '{"latitude":23.81,"longitude":90.41,"timezone":"Asia/Dhaka","current":{"time":"2026-11-12T19:15","interval":900,"temperature_2m":25.0,"apparent_temperature":26.0,"relative_humidity_2m":60,"weather_code":1,"wind_speed_10m":5.0},"hourly":{"time":["2026-11-12T19:00"],"temperature_2m":[25.0],"precipitation_probability":[0],"weather_code":[1]},"daily":{"time":["2026-11-12"],"weather_code":[1],"temperature_2m_max":[28.0],"temperature_2m_min":[20.0],"sunrise":["2026-11-12T06:10"],"sunset":["2026-11-12T17:20"],"uv_index_max":[6.0]}}',
      fetchedAt: DateTime(2026, 11, 12, 18, 0),
    );

    when(() => localSource.getWeather(latitude: 23.81, longitude: 90.41))
        .thenAnswer((_) async => cachedItem);

    final weather = await repository.getWeather(23.81, 90.41);

    expect(weather.isFromCache, isTrue);
    expect(weather.temperature, 25.0);
    expect(weather.lastUpdated, DateTime(2026, 11, 12, 18, 0));
  });

  test('rethrows exception when network fails and no cached forecast exists',
      () async {
    when(() => remoteSource.fetchForecast(latitude: 23.81, longitude: 90.41))
        .thenThrow(Exception('Server unreachable'));
    when(() => localSource.getWeather(latitude: 23.81, longitude: 90.41))
        .thenAnswer((_) async => null);

    expect(
      () => repository.getWeather(23.81, 90.41),
      throwsA(isA<Exception>()),
    );
  });
}

