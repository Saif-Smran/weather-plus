import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/air_quality/domain/entities/air_quality.dart';
import 'package:weather_plus/features/air_quality/presentation/providers/air_quality_providers.dart';
import 'package:weather_plus/features/air_quality/presentation/widgets/air_quality_card.dart';

void main() {
  testWidgets('renders air quality AQI value and category label',
      (WidgetTester tester) async {
    const coords = (latitude: 23.81, longitude: 90.41);
    const mockAqi = AirQuality(
      usAqi: 75,
      pm2_5: 22.4,
      pm10: 45.1,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          airQualityProvider(coords)
              .overrideWithValue(const AsyncValue.data(mockAqi)),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: AirQualityCard(coordinates: coords),
          ),
        ),
      ),
    );

    expect(find.text('75'), findsOneWidget);
    expect(find.text('Moderate'), findsOneWidget);
    expect(find.text('AIR QUALITY INDEX'), findsOneWidget);
    expect(find.text('PM2.5'), findsOneWidget);
    expect(find.text('22.4 µg/m³'), findsOneWidget);
  });
}

