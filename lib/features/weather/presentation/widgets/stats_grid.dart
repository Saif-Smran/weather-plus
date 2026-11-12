import 'package:flutter/material.dart';

import '../../../../core/theme/weather_atmosphere.dart';
import 'stat_card.dart';

class StatItem {
  const StatItem({
    required this.label,
    required this.value,
    required this.icon,
    this.subtitle,
    this.iconColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? subtitle;
  final Color? iconColor;
}

class StatsGrid extends StatelessWidget {
  const StatsGrid({
    super.key,
    required this.stats,
    this.atmosphere,
  });

  final List<StatItem> stats;
  final WeatherAtmosphere? atmosphere;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final stat = stats[index];
        return StatCard(
          label: stat.label,
          value: stat.value,
          icon: stat.icon,
          subtitle: stat.subtitle,
          iconColor: stat.iconColor,
          backgroundColor: atmosphere?.cardBackgroundColor,
          borderColor: atmosphere?.cardBorderColor,
        );
      },
    );
  }
}
