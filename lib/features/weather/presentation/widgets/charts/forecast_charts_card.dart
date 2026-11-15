import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/weather_atmosphere.dart';
import '../../../../../core/widgets/glass_card.dart';
import '../../../domain/entities/hourly_forecast.dart';
import 'rain_chart.dart';
import 'temperature_chart.dart';

enum ChartType { temperature, precipitation }

class ForecastChartsCard extends StatefulWidget {
  const ForecastChartsCard({
    super.key,
    required this.forecasts,
    this.atmosphere,
    this.isBengali = false,
  });

  final List<HourlyForecast> forecasts;
  final WeatherAtmosphere? atmosphere;
  final bool isBengali;

  @override
  State<ForecastChartsCard> createState() => _ForecastChartsCardState();
}

class _ForecastChartsCardState extends State<ForecastChartsCard> {
  ChartType _selectedChart = ChartType.temperature;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(
        widget.isBengali ? AppLanguage.bengali : AppLanguage.english);

    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(18),
      backgroundColor: widget.atmosphere?.cardBackgroundColor,
      borderColor: widget.atmosphere?.cardBorderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    _selectedChart == ChartType.temperature
                        ? Icons.show_chart_rounded
                        : Icons.bar_chart_rounded,
                    size: 16,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.trendsTitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TabButton(
                      label: l10n.tempTab,
                      icon: Icons.thermostat,
                      isSelected: _selectedChart == ChartType.temperature,
                      onTap: () =>
                          setState(() => _selectedChart = ChartType.temperature),
                    ),
                    _TabButton(
                      label: l10n.rainTab,
                      icon: Icons.water_drop,
                      isSelected: _selectedChart == ChartType.precipitation,
                      onTap: () => setState(
                          () => _selectedChart = ChartType.precipitation),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: _selectedChart == ChartType.temperature
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: TemperatureChart(
              forecasts: widget.forecasts,
              isBengali: widget.isBengali,
            ),
            secondChild: RainChart(
              forecasts: widget.forecasts,
              isBengali: widget.isBengali,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.28)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13,
              color: isSelected ? Colors.white : Colors.white60,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
