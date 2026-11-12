import 'entities/weather.dart';

abstract interface class WeatherRepository {
  Future<Weather> getWeather(double latitude, double longitude);
}
