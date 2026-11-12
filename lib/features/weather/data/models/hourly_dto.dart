import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_dto.freezed.dart';
part 'hourly_dto.g.dart';

@freezed
abstract class HourlyDto with _$HourlyDto {
  const factory HourlyDto({
    required List<String> time,
    @JsonKey(name: 'temperature_2m') required List<double> temperatures,
    @JsonKey(name: 'precipitation_probability')
    required List<int> precipitationProbabilities,
    @JsonKey(name: 'weather_code') required List<int> weatherCodes,
  }) = _HourlyDto;

  factory HourlyDto.fromJson(Map<String, dynamic> json) =>
      _$HourlyDtoFromJson(json);
}
