import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_plus/features/weather/presentation/widgets/charts/chart_data_mapper.dart';

void main() {
  group('ChartDataMapper', () {
    final sampleHourly = List.generate(
      24,
      (i) => HourlyForecast(
        time: DateTime(2026, 11, 15, i),
        temperature: 20.0 + (i % 5),
        precipitationProbability: i * 4,
        weatherCode: 0,
      ),
    );

    test('maps hourly temperature to FlSpot list', () {
      final spots = ChartDataMapper.mapTemperatureSpots(sampleHourly);
      expect(spots.length, 24);
      expect(spots[0].x, 0.0);
      expect(spots[0].y, 20.0);
    });

    test('calculates temperature min and max bounds with padding', () {
      final bounds = ChartDataMapper.getTemperatureBounds(sampleHourly);
      // Min temp is 20.0 -> bound <= 17.0
      expect(bounds.min, lessThanOrEqualTo(17.0));
      // Max temp is 24.0 -> bound >= 27.0
      expect(bounds.max, greaterThanOrEqualTo(27.0));
    });

    test('maps hourly rain probability to BarChartGroupData', () {
      final bars = ChartDataMapper.mapRainBars(sampleHourly);
      expect(bars.length, 24);
      expect(bars[0].x, 0);
      expect(bars[0].barRods.first.toY, 0.0);
      expect(bars[5].barRods.first.toY, 20.0);
    });
  });
}

