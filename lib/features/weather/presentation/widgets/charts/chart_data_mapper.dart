import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/hourly_forecast.dart';

class ChartDataMapper {
  const ChartDataMapper._();

  static List<FlSpot> mapTemperatureSpots(List<HourlyForecast> hourly) {
    final list = hourly.take(24).toList();
    return List.generate(
      list.length,
      (index) => FlSpot(index.toDouble(), list[index].temperature),
    );
  }

  static ({double min, double max}) getTemperatureBounds(
      List<HourlyForecast> hourly) {
    final list = hourly.take(24).toList();
    if (list.isEmpty) return (min: 0.0, max: 40.0);

    double minTemp = list.first.temperature;
    double maxTemp = list.first.temperature;

    for (final item in list) {
      if (item.temperature < minTemp) minTemp = item.temperature;
      if (item.temperature > maxTemp) maxTemp = item.temperature;
    }

    return (
      min: (minTemp - 3).floorToDouble(),
      max: (maxTemp + 3).ceilToDouble(),
    );
  }

  static List<BarChartGroupData> mapRainBars(List<HourlyForecast> hourly) {
    final list = hourly.take(24).toList();
    return List.generate(
      list.length,
      (index) {
        final prob = list[index].precipitationProbability.toDouble();
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: prob,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF80D8FF),
                  Color(0xFF00B0FF),
                  Color(0xFF2979FF),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              width: 7,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            ),
          ],
        );
      },
    );
  }
}

