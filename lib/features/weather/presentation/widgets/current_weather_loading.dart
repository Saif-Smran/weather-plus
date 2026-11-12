import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/glass_card.dart';

class CurrentWeatherLoading extends StatelessWidget {
  const CurrentWeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.15),
      highlightColor: Colors.white.withValues(alpha: 0.35),
      child: Column(
        children: [
          // Header placeholder
          GlassCard(
            borderRadius: 28,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                const _Placeholder(width: 140, height: 24),
                const SizedBox(height: 8),
                const _Placeholder(width: 180, height: 14),
                const SizedBox(height: 24),
                const _Placeholder(width: 80, height: 80),
                const SizedBox(height: 16),
                const _Placeholder(width: 120, height: 48),
                const SizedBox(height: 16),
                const _Placeholder(width: 100, height: 24),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Hourly forecast shimmer card
          GlassCard(
            borderRadius: 24,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Placeholder(width: 120, height: 18),
                const SizedBox(height: 14),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (_) => const _Placeholder(width: 60, height: 100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Stats grid shimmer
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              4,
              (_) => const GlassCard(
                borderRadius: 18,
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Placeholder(width: 80, height: 14),
                    SizedBox(height: 10),
                    _Placeholder(width: 60, height: 22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
