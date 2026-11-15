import 'package:freezed_annotation/freezed_annotation.dart';

import 'current_weather_dto.dart';
import 'daily_dto.dart';
import 'hourly_dto.dart';

part 'forecast_response_dto.freezed.dart';
part 'forecast_response_dto.g.dart';

@freezed
abstract class ForecastResponseDto with _$ForecastResponseDto {
  const factory ForecastResponseDto({
    required double latitude,
    required double longitude,
    required String timezone,
    @JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds,
    required CurrentWeatherDto current,
    required HourlyDto hourly,
    required DailyDto daily,
  }) = _ForecastResponseDto;

  factory ForecastResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseDtoFromJson(json);
}
