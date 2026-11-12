import 'package:go_router/go_router.dart';

import '../../features/city_search/presentation/screens/city_search_screen.dart';
import '../../features/saved_cities/presentation/screens/saved_cities_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/weather/presentation/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/search',
      builder: (context, state) => const CitySearchScreen(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const SavedCitiesScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/weather',
      builder: (context, state) => HomeScreen(
        cityName: state.uri.queryParameters['city'],
        latitude: double.tryParse(state.uri.queryParameters['lat'] ?? ''),
        longitude: double.tryParse(state.uri.queryParameters['lon'] ?? ''),
      ),
    ),
  ],
);
