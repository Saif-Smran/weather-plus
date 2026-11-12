import 'package:flutter_test/flutter_test.dart';

import 'package:weather_plus/app.dart';

void main() {
  testWidgets('renders the app shell', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Weather+'), findsOneWidget);
  });
}
