import '../../domain/entities/air_quality.dart';

class AirQualityDto {
  const AirQualityDto({
    required this.usAqi,
    required this.pm2_5,
    required this.pm10,
  });

  final int usAqi;
  final double pm2_5;
  final double pm10;

  factory AirQualityDto.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>? ?? {};
    return AirQualityDto(
      usAqi: (current['us_aqi'] as num?)?.toInt() ?? 0,
      pm2_5: (current['pm2_5'] as num?)?.toDouble() ?? 0.0,
      pm10: (current['pm10'] as num?)?.toDouble() ?? 0.0,
    );
  }

  AirQuality toEntity() => AirQuality(
        usAqi: usAqi,
        pm2_5: pm2_5,
        pm10: pm10,
      );
}

