// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HourlyDto _$HourlyDtoFromJson(Map<String, dynamic> json) => _HourlyDto(
  time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
  temperatures: (json['temperature_2m'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  precipitationProbabilities:
      (json['precipitation_probability'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  weatherCodes: (json['weather_code'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$HourlyDtoToJson(_HourlyDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperatures,
      'precipitation_probability': instance.precipitationProbabilities,
      'weather_code': instance.weatherCodes,
    };
