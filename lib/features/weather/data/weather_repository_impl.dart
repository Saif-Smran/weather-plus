import '../domain/entities/weather.dart';
import '../domain/weather_repository.dart';
import 'models/forecast_mapper.dart';
import 'weather_remote_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(this._remoteSource);

  final WeatherRemoteSource _remoteSource;

  @override
  Future<Weather> getWeather(double latitude, double longitude) async {
    final dto = await _remoteSource.fetchForecast(
      latitude: latitude,
      longitude: longitude,
    );
    return dto.toEntity();
  }
}
