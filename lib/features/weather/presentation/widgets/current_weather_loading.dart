import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentWeatherLoading extends StatelessWidget {
  const CurrentWeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const _Placeholder(width: 120, height: 28),
          const SizedBox(height: 24),
          const _Placeholder(width: 80, height: 80),
          const SizedBox(height: 16),
          const _Placeholder(width: 160, height: 56),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(
              6,
              (_) => const _Placeholder(width: double.infinity, height: 56),
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
