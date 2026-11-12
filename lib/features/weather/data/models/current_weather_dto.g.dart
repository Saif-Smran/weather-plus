// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    _CurrentWeatherDto(
      time: json['time'] as String,
      interval: (json['interval'] as num).toInt(),
      temperature: (json['temperature_2m'] as num).toDouble(),
      apparentTemperature: (json['apparent_temperature'] as num).toDouble(),
      relativeHumidity: (json['relative_humidity_2m'] as num).toInt(),
      weatherCode: (json['weather_code'] as num).toInt(),
      windSpeed: (json['wind_speed_10m'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherDtoToJson(_CurrentWeatherDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature_2m': instance.temperature,
      'apparent_temperature': instance.apparentTemperature,
      'relative_humidity_2m': instance.relativeHumidity,
      'weather_code': instance.weatherCode,
      'wind_speed_10m': instance.windSpeed,
    };
