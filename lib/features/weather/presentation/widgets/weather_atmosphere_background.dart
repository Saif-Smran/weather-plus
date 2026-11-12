import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../../core/theme/weather_atmosphere.dart';

class WeatherAtmosphereBackground extends StatefulWidget {
  const WeatherAtmosphereBackground({
    super.key,
    required this.atmosphere,
    required this.child,
  });

  final WeatherAtmosphere atmosphere;
  final Widget child;

  @override
  State<WeatherAtmosphereBackground> createState() =>
      _WeatherAtmosphereBackgroundState();
}

class _WeatherAtmosphereBackgroundState
    extends State<WeatherAtmosphereBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final atmosphere = widget.atmosphere;

    return Stack(
      children: [
        // Smoothly animated gradient background
        Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: atmosphere.gradientColors,
                stops: atmosphere.gradientColors.length == 4
                    ? const [0.0, 0.35, 0.7, 1.0]
                    : const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        // Custom atmospheric painter for celestial elements
        Positioned.fill(
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return CustomPaint(
                  painter: _SkyAtmospherePainter(
                    atmosphere: atmosphere,
                    progress: _controller.value,
                  ),
                );
              },
            ),
          ),
        ),

        // Foreground content
        Positioned.fill(child: widget.child),
      ],
    );
  }
}

class _SkyAtmospherePainter extends CustomPainter {
  _SkyAtmospherePainter({
    required this.atmosphere,
    required this.progress,
  });

  final WeatherAtmosphere atmosphere;
  final double progress;

  // Deterministic star seed list for stability
  static final List<math.Point<double>> _starPositions = List.generate(45, (i) {
    final random = math.Random(i * 197 + 42);
    return math.Point(random.nextDouble(), random.nextDouble() * 0.55);
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (atmosphere.showSun) {
      _paintSun(canvas, size);
    }

    if (atmosphere.showMoon) {
      _paintMoon(canvas, size);
    }

    if (atmosphere.showStars) {
      _paintStars(canvas, size);
    }

    if (atmosphere.showClouds) {
      _paintClouds(canvas, size);
    }

    if (atmosphere.showRain) {
      _paintRain(canvas, size);
    }

    if (atmosphere.showSnow) {
      _paintSnow(canvas, size);
    }
  }

  void _paintSun(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.76, size.height * 0.16);
    final sunRadius = size.width * 0.13;

    // Outer soft sun aura
    final outerGlowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.amber.withValues(alpha: 0.35),
          Colors.orangeAccent.withValues(alpha: 0.12),
          Colors.transparent,
        ],
        stops: const [0.2, 0.55, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: sunRadius * 2.8));
    canvas.drawCircle(center, sunRadius * 2.8, outerGlowPaint);

    // Inner bright core
    final innerPaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Colors.white,
          Color(0xFFFFF9C4),
          Color(0xFFFFE082),
        ],
        stops: const [0.3, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: sunRadius));
    canvas.drawCircle(center, sunRadius, innerPaint);
  }

  void _paintMoon(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.74, size.height * 0.16);
    final moonRadius = size.width * 0.09;

    // Moon outer glow
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFE0F7FA).withValues(alpha: 0.22),
          const Color(0xFF80DEEA).withValues(alpha: 0.08),
          Colors.transparent,
        ],
        stops: const [0.3, 0.65, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: moonRadius * 2.4));
    canvas.drawCircle(center, moonRadius * 2.4, glowPaint);

    // Crescent Moon path
    final moonPath = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: moonRadius),
        -math.pi / 2,
        math.pi,
      )
      ..arcToPoint(
        Offset(center.dx, center.dy - moonRadius),
        radius: Radius.circular(moonRadius * 1.15),
        clockwise: false,
      );

    final moonPaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFFFFFFFF),
          Color(0xFFECEFF1),
          Color(0xFFCFD8DC),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: moonRadius));
    canvas.drawPath(moonPath, moonPaint);
  }

  void _paintStars(Canvas canvas, Size size) {
    final starPaint = Paint()..color = Colors.white;

    for (var i = 0; i < _starPositions.length; i++) {
      final point = _starPositions[i];
      final x = point.x * size.width;
      final y = point.y * size.height;

      // Twinkle pulsation
      final phaseOffset = (i * 0.3) % (2 * math.pi);
      final alpha = 0.25 + 0.55 * (0.5 + 0.5 * math.sin(progress * 2 * math.pi * 1.5 + phaseOffset));
      starPaint.color = Colors.white.withValues(alpha: alpha.clamp(0.1, 0.9));

      final radius = (i % 3 == 0) ? 1.6 : 1.0;
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }
  }

  void _paintClouds(Canvas canvas, Size size) {
    final cloudPaint = Paint()
      ..color = Colors.white.withValues(
        alpha: atmosphere.dayPhase.isNighttime ? 0.07 : 0.16,
      );

    // Drift offset
    final drift = (progress * size.width * 0.15) % size.width;

    // Atmospheric cloud shapes
    _drawCloudPuff(canvas, cloudPaint, Offset(size.width * 0.2 + drift * 0.5, size.height * 0.16), size.width * 0.22);
    _drawCloudPuff(canvas, cloudPaint, Offset(size.width * 0.7 - drift * 0.3, size.height * 0.22), size.width * 0.28);
    _drawCloudPuff(canvas, cloudPaint, Offset(size.width * 0.05 + drift * 0.2, size.height * 0.28), size.width * 0.20);
  }

  void _drawCloudPuff(Canvas canvas, Paint paint, Offset center, double radius) {
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(Offset(center.dx - radius * 0.5, center.dy + radius * 0.2), radius * 0.7, paint);
    canvas.drawCircle(Offset(center.dx + radius * 0.5, center.dy + radius * 0.1), radius * 0.8, paint);
  }

  void _paintRain(Canvas canvas, Size size) {
    final rainPaint = Paint()
      ..color = const Color(0xFFB3E5FC).withValues(alpha: 0.35)
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;

    final count = 35;
    for (var i = 0; i < count; i++) {
      final rand = math.Random(i * 37);
      final startX = rand.nextDouble() * size.width;
      final startY = ((rand.nextDouble() + progress * 2.5) % 1.0) * size.height;
      final length = 12.0 + rand.nextDouble() * 10;
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX - 3, startY + length),
        rainPaint,
      );
    }
  }

  void _paintSnow(Canvas canvas, Size size) {
    final snowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.65);

    final count = 30;
    for (var i = 0; i < count; i++) {
      final rand = math.Random(i * 73);
      final driftX = math.sin(progress * 2 * math.pi + i) * 6;
      final startX = (rand.nextDouble() * size.width + driftX) % size.width;
      final startY = ((rand.nextDouble() + progress * 0.8) % 1.0) * size.height;
      final radius = 1.5 + (i % 3) * 0.8;
      canvas.drawCircle(Offset(startX, startY), radius, snowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SkyAtmospherePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.atmosphere.weatherType != atmosphere.weatherType ||
        oldDelegate.atmosphere.dayPhase != atmosphere.dayPhase;
  }
}

