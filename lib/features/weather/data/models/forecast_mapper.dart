import '../../domain/entities/daily_forecast.dart';
import '../../domain/entities/hourly_forecast.dart';
import '../../domain/entities/weather.dart';
import 'forecast_response_dto.dart';

extension ForecastResponseDtoMapper on ForecastResponseDto {
  Weather toEntity() {
    final hourlyCount = hourly.time.length;
    final dailyCount = daily.time.length;

    return Weather(
      latitude: latitude,
      longitude: longitude,
      timezone: timezone,
      observedAt: DateTime.parse(current.time),
      temperature: current.temperature,
      apparentTemperature: current.apparentTemperature,
      relativeHumidity: current.relativeHumidity,
      weatherCode: current.weatherCode,
      windSpeed: current.windSpeed,
      hourly: List.generate(
        hourlyCount,
        (index) => HourlyForecast(
          time: DateTime.parse(hourly.time[index]),
          temperature: hourly.temperatures[index],
          precipitationProbability: hourly.precipitationProbabilities[index],
          weatherCode: hourly.weatherCodes[index],
        ),
      ),
      daily: List.generate(
        dailyCount,
        (index) => DailyForecast(
          date: DateTime.parse(daily.time[index]),
          weatherCode: daily.weatherCodes[index],
          maxTemperature: daily.maxTemperatures[index],
          minTemperature: daily.minTemperatures[index],
          sunrise: DateTime.parse(daily.sunrise[index]),
          sunset: DateTime.parse(daily.sunset[index]),
          uvIndex: daily.uvIndexes[index],
        ),
      ),
    );
  }
}
