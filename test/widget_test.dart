import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_plus/app.dart';
import 'package:weather_plus/features/weather/presentation/screens/home_screen.dart';
import 'package:weather_plus/features/weather/presentation/providers/weather_providers.dart';

void main() {
  testWidgets('renders the app shell', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentLocationProvider.overrideWithValue(const AsyncValue.loading()),
          weatherProvider(dhakaCoordinates)
              .overrideWithValue(const AsyncValue.loading()),
        ],
        child: const App(),
      ),
    );

    expect(find.text('Weather+'), findsOneWidget);
  });
}
