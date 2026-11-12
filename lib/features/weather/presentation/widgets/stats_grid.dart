import 'package:flutter/material.dart';

import 'stat_card.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key, required this.stats});

  final List<({String label, String value, IconData icon})> stats;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final stat = stats[index];
        return StatCard(label: stat.label, value: stat.value, icon: stat.icon);
      },
    );
  }
}
