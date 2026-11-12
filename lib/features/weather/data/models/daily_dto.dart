import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_dto.freezed.dart';
part 'daily_dto.g.dart';

@freezed
abstract class DailyDto with _$DailyDto {
  const factory DailyDto({
    required List<String> time,
    @JsonKey(name: 'weather_code') required List<int> weatherCodes,
    @JsonKey(name: 'temperature_2m_max') required List<double> maxTemperatures,
    @JsonKey(name: 'temperature_2m_min') required List<double> minTemperatures,
    required List<String> sunrise,
    required List<String> sunset,
    @JsonKey(name: 'uv_index_max') required List<double> uvIndexes,
  }) = _DailyDto;

  factory DailyDto.fromJson(Map<String, dynamic> json) =>
      _$DailyDtoFromJson(json);
}
