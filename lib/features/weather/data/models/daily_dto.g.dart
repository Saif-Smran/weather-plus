// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyDto _$DailyDtoFromJson(Map<String, dynamic> json) => _DailyDto(
  time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
  weatherCodes: (json['weather_code'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  maxTemperatures: (json['temperature_2m_max'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  minTemperatures: (json['temperature_2m_min'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  sunrise: (json['sunrise'] as List<dynamic>).map((e) => e as String).toList(),
  sunset: (json['sunset'] as List<dynamic>).map((e) => e as String).toList(),
  uvIndexes: (json['uv_index_max'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$DailyDtoToJson(_DailyDto instance) => <String, dynamic>{
  'time': instance.time,
  'weather_code': instance.weatherCodes,
  'temperature_2m_max': instance.maxTemperatures,
  'temperature_2m_min': instance.minTemperatures,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
  'uv_index_max': instance.uvIndexes,
};
