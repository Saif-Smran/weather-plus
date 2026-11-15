import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../domain/entities/hourly_forecast.dart';
import 'chart_data_mapper.dart';

class TemperatureChart extends StatelessWidget {
  const TemperatureChart({
    super.key,
    required this.forecasts,
    this.isBengali = false,
  });

  final List<HourlyForecast> forecasts;
  final bool isBengali;

  @override
  Widget build(BuildContext context) {
    final list = forecasts.take(24).toList();
    if (list.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations(isBengali ? AppLanguage.bengali : AppLanguage.english);
    final spots = ChartDataMapper.mapTemperatureSpots(list);
    final bounds = ChartDataMapper.getTemperatureBounds(list);

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 23,
          minY: bounds.min,
          maxY: bounds.max,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 5,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white.withValues(alpha: 0.1),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 5,
                getTitlesWidget: (value, meta) {
                  return Text(
                    isBengali
                        ? '${l10n.formatNumber(value.toInt())}°'
                        : '${value.toInt()}°',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 10,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                interval: 4,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= list.length) {
                    return const SizedBox.shrink();
                  }
                  final time = list[index].time;
                  final label = index == 0
                      ? (isBengali ? 'এখন' : 'Now')
                      : DateFormat('ha', isBengali ? 'bn' : 'en').format(time);

                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.35,
              barWidth: 3,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF81D4FA),
                  Color(0xFFFFB74D),
                  Color(0xFFFF8A65),
                ],
              ),
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFFB74D).withValues(alpha: 0.35),
                    const Color(0xFF81D4FA).withValues(alpha: 0.02),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final index = spot.x.toInt();
                  final forecast = list[index];
                  final timeStr = index == 0
                      ? (isBengali ? 'এখন' : 'Now')
                      : DateFormat('h a', isBengali ? 'bn' : 'en').format(forecast.time);
                  final tempStr = isBengali
                      ? '${l10n.formatNumber(spot.y.round())}°'
                      : '${spot.y.round()}°';
                  return LineTooltipItem(
                    '$timeStr\n$tempStr',
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}

