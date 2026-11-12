// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastResponseDto _$ForecastResponseDtoFromJson(Map<String, dynamic> json) =>
    _ForecastResponseDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
      current: CurrentWeatherDto.fromJson(
        json['current'] as Map<String, dynamic>,
      ),
      hourly: HourlyDto.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: DailyDto.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseDtoToJson(
  _ForecastResponseDto instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': instance.timezone,
  'current': instance.current,
  'hourly': instance.hourly,
  'daily': instance.daily,
};
