import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_dto.freezed.dart';
part 'current_weather_dto.g.dart';

@freezed
abstract class CurrentWeatherDto with _$CurrentWeatherDto {
  const factory CurrentWeatherDto({
    required String time,
    required int interval,
    @JsonKey(name: 'temperature_2m') required double temperature,
    @JsonKey(name: 'apparent_temperature') required double apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity,
    @JsonKey(name: 'weather_code') required int weatherCode,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed,
  }) = _CurrentWeatherDto;

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);
}
