import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../domain/entities/hourly_forecast.dart';
import 'chart_data_mapper.dart';

class RainChart extends StatelessWidget {
  const RainChart({
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
    final bars = ChartDataMapper.mapRainBars(list);

    return SizedBox(
      height: 180,
      child: BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 50,
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
                interval: 50,
                getTitlesWidget: (value, meta) {
                  return Text(
                    isBengali
                        ? '${l10n.formatNumber(value.toInt())}%'
                        : '${value.toInt()}%',
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
                  // Only display label every 4 hours (matching TemperatureChart)
                  if (index % 4 != 0) {
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
          barGroups: bars,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final time = list[group.x].time;
                final timeStr = group.x == 0
                    ? (isBengali ? 'এখন' : 'Now')
                    : DateFormat('h a', isBengali ? 'bn' : 'en').format(time);
                final rainProb = isBengali
                    ? '${l10n.formatNumber(rod.toY.round())}% বৃষ্টি'
                    : '${rod.toY.round()}% Rain';
                return BarTooltipItem(
                  '$timeStr\n$rainProb',
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

