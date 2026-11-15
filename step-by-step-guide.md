# Weather+ : Step-by-Step Build Guide

Rules for yourself:
- Finish each step's "Done when" before moving on.
- Commit at the end of every step.
- When stuck for more than 45 minutes, read the official docs for that package, not a random tutorial.
- Do not copy package versions from old tutorials. Use `flutter pub add <name>` so you get current ones.

---

## Step 0: Environment setup

**Do, in order:**
1. Install Flutter SDK and Android Studio (for the Android SDK and emulator).
2. Run `flutter doctor` and fix every red item.
3. Install VS Code or Android Studio Flutter and Dart plugins.
4. Create an emulator, and if you have an Android phone, enable USB debugging so you can test GPS on a real device.
5. Create an empty GitHub repo named `weather-plus`.

**Done when:** `flutter doctor` is clean and a default Flutter app runs on your emulator or phone.

**Resources:**
- Flutter install: https://docs.flutter.dev/get-started/install
- Android Studio: https://developer.android.com/studio
- Run on a real Android device: https://docs.flutter.dev/get-started/test-drive
- Git basics if needed: https://docs.github.com/en/get-started/start-your-journey/hello-world

---

## Step 1: Project, lints, folder skeleton

**Do, in order:**
1. `flutter create weather_plus --org com.yourname --platforms android` (add `ios` if you can test on it).
2. Open `analysis_options.yaml` and make sure `flutter_lints` is included. Add `prefer_const_constructors` and `avoid_print` rules.
3. Create the full folder tree from `requirements.md` section 7. Empty folders will not commit, so add a placeholder file or fill them as you go.
4. Delete the default counter app code. Keep `main.dart` minimal: `runApp(ProviderScope(child: App()))` comes in Step 2.
5. First commit and push.

**Done when:** `flutter analyze` is clean and the folder skeleton exists.

**Resources:**
- Flutter app architecture guide (official): https://docs.flutter.dev/app-architecture
- Feature-first Riverpod architecture (Andrea Bizzotto): https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/
- flutter_lints: https://pub.dev/packages/flutter_lints

---

## Step 2: Core setup (Riverpod, theme, router shell)

**Do, in order:**
1. Add packages: `flutter pub add flutter_riverpod riverpod_annotation go_router` and `flutter pub add --dev riverpod_generator build_runner`.
2. Wrap the app in `ProviderScope` in `main.dart`.
3. Create `app.dart` with `MaterialApp.router`.
4. Create `core/theme/app_theme.dart` with light and dark `ThemeData` using Material 3 and `ColorScheme.fromSeed`.
5. Create `core/router/app_router.dart` with one route (`/`) pointing to a placeholder `HomeScreen`.
6. Create `core/widgets/loading_view.dart` and `error_view.dart` (message plus Retry button). You will reuse these everywhere.
7. Run `dart run build_runner watch -d` in a separate terminal and leave it running.

**Done when:** app launches with a themed placeholder home screen and switching the phone to dark mode changes the theme.

**Resources:**
- Riverpod docs: https://riverpod.dev
- flutter_riverpod: https://pub.dev/packages/flutter_riverpod
- riverpod_generator: https://pub.dev/packages/riverpod_generator
- go_router: https://pub.dev/packages/go_router
- Material 3 in Flutter: https://docs.flutter.dev/ui/design/material
- Color tooling: https://m3.material.io/styles/color/overview

---

## Step 3: Networking layer (Dio)

**Do, in order:**
1. `flutter pub add dio`.
2. Create `core/constants/api_endpoints.dart` with the three base URLs (forecast, geocoding, air quality).
3. Create `core/network/dio_client.dart`: a Riverpod provider that returns a configured `Dio` (timeouts of about 10 s, JSON headers).
4. Add a logging interceptor that only logs in debug mode.
5. Create `core/network/api_exception.dart`: a sealed class with cases like `NoInternet`, `Timeout`, `Server(statusCode)`, `Unknown`.
6. Write a small function that maps `DioException` to `ApiException`. You will use it in every remote source.
7. Open one Open-Meteo URL from `requirements.md` in your browser and read the real JSON before writing any model.

**Done when:** a temporary test call prints raw forecast JSON to the console, and turning airplane mode on produces a `NoInternet` exception.

**Resources:**
- dio: https://pub.dev/packages/dio
- Dio interceptors: https://pub.dev/packages/dio#interceptors
- Dart sealed classes: https://dart.dev/language/class-modifiers#sealed
- Open-Meteo forecast docs: https://open-meteo.com/en/docs

---

## Step 4: Models (freezed and json_serializable)

**Do, in order:**
1. `flutter pub add freezed_annotation json_annotation` and `flutter pub add --dev freezed json_serializable`.
2. Create DTO models in `features/weather/data/models/`: `current_weather_dto`, `hourly_dto`, `daily_dto`, and a top-level `forecast_response_dto`. Match the JSON shape exactly. Open-Meteo returns hourly and daily data as parallel arrays, not a list of objects.
3. Create domain entities in `features/weather/domain/entities/`: `Weather`, `HourlyForecast`, `DailyForecast`. Clean, UI-friendly, no JSON annotations.
4. Write mapper functions DTO to entity (parallel arrays become lists of objects here).
5. Create `core/utils/weather_code_mapper.dart`: WMO weather code to description and icon. The code table is on the Open-Meteo forecast docs page.
6. Write unit tests for the mapper and the DTO to entity mapping using a saved JSON sample in `test/fixtures/`.

**Done when:** build_runner generates without errors and mapper tests pass.

**Resources:**
- freezed: https://pub.dev/packages/freezed
- json_serializable: https://pub.dev/packages/json_serializable
- JSON and serialization in Flutter: https://docs.flutter.dev/data-and-backend/serialization/json
- WMO weather codes: https://open-meteo.com/en/docs (search "WMO Weather interpretation codes")
- Testing basics: https://docs.flutter.dev/cookbook/testing/unit/introduction

---

## Step 5: Weather repository and providers

**Do, in order:**
1. Define `abstract class WeatherRepository` in `domain/` with `Future<Weather> getWeather(double lat, double lon)`.
2. Create `weather_remote_source.dart` in `data/`: calls Dio, parses the DTO, throws `ApiException`.
3. Create `weather_repository_impl.dart`: calls the remote source and maps DTO to entity.
4. Create Riverpod providers: remote source, repository, and a `weatherProvider(lat, lon)` that returns `AsyncValue<Weather>`.
5. Write a repository unit test with `mocktail` that mocks the remote source for success and failure.

**Done when:** a throwaway screen shows `ref.watch(weatherProvider(...))` with `.when(loading, error, data)` and real Dhaka data appears.

**Resources:**
- Riverpod AsyncValue: https://riverpod.dev/docs/essentials/first_request
- Riverpod code generation: https://riverpod.dev/docs/concepts/about_code_generation
- mocktail: https://pub.dev/packages/mocktail
- Repository pattern (Flutter official): https://docs.flutter.dev/app-architecture/design-patterns/repository-pattern

---

## Step 6: Home screen UI (current weather)

**Do, in order:**
1. Sketch the layout on paper first: city name, big temperature, condition, then a row of small stat cards (feels like, humidity, wind, UV, sunrise, sunset).
2. Build it as small widgets in `presentation/widgets/`: `CurrentWeatherHeader`, `StatCard`, `StatsGrid`.
3. Use hardcoded Dhaka coordinates for now.
4. Use your `LoadingView` and `ErrorView` for the other states. Add `shimmer` placeholders for loading.
5. Format temperature, time, and dates with `intl`.

**Done when:** home screen shows real current weather with proper loading and error states. Test the error state by turning off the internet.

**Resources:**
- Flutter layout guide: https://docs.flutter.dev/ui/layout
- shimmer: https://pub.dev/packages/shimmer
- intl: https://pub.dev/packages/intl
- Weather icons idea: https://pub.dev/packages/lottie and free animations at https://lottiefiles.com

---

## Step 7: Device location (geolocator)

**Do, in order:**
1. `flutter pub add geolocator`.
2. Add the location permissions to `android/app/src/main/AndroidManifest.xml` (`ACCESS_COARSE_LOCATION` and `ACCESS_FINE_LOCATION`). For iOS, add the usage strings to `Info.plist`.
3. Create a `location_service.dart` with: check services enabled, check and request permission, get current position.
4. Create a `currentLocationProvider` that returns the position or a typed failure (`PermissionDenied`, `PermissionDeniedForever`, `ServiceDisabled`).
5. Chain it: home screen watches location, then weather for that location.
6. For denied cases, show a message with two buttons: Retry, and Open Settings (`Geolocator.openAppSettings()`). Fall back to a default city (Dhaka).
7. Test on a real device if you can: allow, deny, deny forever, and GPS off.

**Done when:** all four permission cases behave correctly and never crash.

**Resources:**
- geolocator: https://pub.dev/packages/geolocator
- Android permission setup is in the geolocator README (same link)
- Android emulator location controls: https://developer.android.com/studio/run/emulator-console#geo

---

## Step 8: Hourly and daily forecast UI

**Do, in order:**
1. Build `HourlyForecastList`: a horizontal `ListView.builder`, 24 items, each with time, icon, temperature, rain probability.
2. Build `DailyForecastList`: 7 rows with day name (Today, Tue, Wed), icon, min, max.
3. Compose the home screen as a `CustomScrollView` with slivers so everything scrolls smoothly.
4. Add `RefreshIndicator` for pull to refresh (calls `ref.invalidate(...)`).

**Done when:** the home screen shows current, hourly, and daily sections and pull to refresh works.

**Resources:**
- Slivers: https://docs.flutter.dev/ui/layout/scrolling/slivers
- RefreshIndicator: https://api.flutter.dev/flutter/material/RefreshIndicator-class.html
- Lists cookbook: https://docs.flutter.dev/cookbook/lists/horizontal-list

---

## Step 9: City search with debounce

**Do, in order:**
1. Create the `city_search` feature with data, domain, presentation, same pattern as weather.
2. Model: `City` (name, country, admin region, latitude, longitude). Parse the geocoding response.
3. Remote source calls `geocoding-api.open-meteo.com/v1/search?name=...&count=10`.
4. Search screen with a `TextField`. Implement debounce (400 ms) with a `Timer` in a Riverpod notifier. Cancel the previous timer on every keystroke.
5. Handle: empty query, no results, loading, error.
6. Tapping a result opens that city's weather. Route with go_router, passing lat and lon.

**Done when:** typing "Chitt" shows Chittagong results after a short pause, and only one request fires per pause (check the Dio log).

**Resources:**
- Open-Meteo geocoding docs: https://open-meteo.com/en/docs/geocoding-api
- Riverpod Notifier: https://riverpod.dev/docs/essentials/side_effects
- go_router parameters: https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html
- Debounce idea in Dart: https://api.dart.dev/stable/dart-async/Timer-class.html

---

## Step 10: Saved cities (Drift database)

**Do, in order:**
1. `flutter pub add drift drift_flutter path_provider` and `flutter pub add --dev drift_dev`.
2. Define a `SavedCities` table: id, name, country, latitude, longitude, addedAt.
3. Create the database class and a Riverpod provider for it. Run build_runner.
4. Create the `saved_cities` feature: repository with `watchAll()` (a Stream), `add(city)`, `remove(id)`.
5. UI: saved cities list with weather summary per city, swipe to delete with `Dismissible`, and an Undo snackbar.
6. Add a "Save" button in search results and on the weather screen.
7. Block duplicates (same lat and lon).

**Done when:** saved cities survive an app restart and delete with undo works.

**Resources:**
- Drift docs: https://drift.simonbinder.eu
- drift_flutter: https://pub.dev/packages/drift_flutter
- Dismissible cookbook: https://docs.flutter.dev/cookbook/gestures/dismissible

---

## Step 11: Settings (units and theme)

**Do, in order:**
1. `flutter pub add shared_preferences`.
2. Create the `settings` feature with a `Settings` entity: temperature unit, wind unit, theme mode.
3. Notifier loads from and saves to `shared_preferences`.
4. Settings screen with segmented buttons or switches.
5. Apply units at the presentation layer with a formatter (store API data in metric, convert on display). Do not refetch when units change.
6. `MaterialApp.router` reads `themeMode` from the settings provider.

**Done when:** units and theme change instantly everywhere and persist after restart.

**Resources:**
- shared_preferences: https://pub.dev/packages/shared_preferences
- Theme modes: https://api.flutter.dev/flutter/material/ThemeMode.html
- SegmentedButton: https://api.flutter.dev/flutter/material/SegmentedButton-class.html

---

## Step 12: Offline cache

**Do, in order:**
1. `flutter pub add connectivity_plus`.
2. Add a `CachedWeather` table in Drift: lat, lon, json payload, fetchedAt.
3. Create `weather_local_source.dart` with `save` and `get`.
4. Change the repository to: try network, on success save cache and return; on network failure return cached data if it exists, else rethrow.
5. Add `isStale` and `lastUpdated` to the `Weather` entity. Show "Updated 2h ago (offline)" on the UI.
6. Add a small banner when `connectivity_plus` reports no connection.
7. Test: load data, enable airplane mode, restart the app, confirm cached data shows.

**Done when:** the app shows last known weather with a timestamp when offline.

**Resources:**
- connectivity_plus: https://pub.dev/packages/connectivity_plus
- Offline-first guide (Flutter official): https://docs.flutter.dev/app-architecture/design-patterns/offline-first

---

## Step 13: Air quality

**Do, in order:**
1. Create the `air_quality` feature (data, domain, presentation).
2. Model: `AirQuality` with US AQI, PM2.5, PM10.
3. Write an AQI category mapper (Good, Moderate, Unhealthy for Sensitive Groups, Unhealthy, Very Unhealthy, Hazardous) with colors. Unit test the boundaries.
4. Build `AirQualityCard` and add it to the home screen. It must load independently, so a failure here does not break the weather section.

**Done when:** Dhaka's AQI shows with the correct color and category, and the card fails gracefully if the AQI request fails.

**Resources:**
- Open-Meteo air quality docs: https://open-meteo.com/en/docs/air-quality-api
- US AQI categories: https://www.airnow.gov/aqi/aqi-basics/

---

## Step 14: Charts

**Do, in order:**
1. `flutter pub add fl_chart`.
2. Build `TemperatureChart` (line, next 24 h) and `RainChart` (bar, precipitation probability).
3. Keep chart data prep (the list of `FlSpot`) in a mapper or provider, not inside `build`.
4. Add touch tooltips and consistent theme colors.

**Done when:** both charts render with real data, in light and dark mode.

**Resources:**
- fl_chart: https://pub.dev/packages/fl_chart
- fl_chart docs and samples: https://github.com/imaNNeo/fl_chart

---

## Step 15: Testing

**Do, in order:**
1. Unit tests: weather code mapper, DTO mapping, repository (success, failure, cache fallback), AQI mapper, debounce logic.
2. Provider tests with `ProviderContainer` and overrides.
3. Widget tests: home screen shows loading, then data; error view shows a retry button that works.
4. Aim for 10+ unit and 2+ widget tests. Run with `flutter test`.

**Done when:** `flutter test` passes and `flutter analyze` is clean.

**Resources:**
- Flutter testing overview: https://docs.flutter.dev/testing/overview
- Widget testing intro: https://docs.flutter.dev/cookbook/testing/widget/introduction
- Testing Riverpod: https://riverpod.dev/docs/how_to/testing
- mocktail: https://pub.dev/packages/mocktail

---

## Step 16: Polish

**Do, in order:**
1. Weather-based background: gradient or Lottie animation based on weather code and day or night.
2. Smooth transitions (`flutter_animate` or implicit animations). Keep it subtle.
3. Check accessibility: large font size, contrast, tap target sizes, semantic labels.
4. Profile with Flutter DevTools. Fix any jank or unnecessary rebuilds.
5. Add an app icon and splash screen.

**Done when:** the app feels smooth on a real mid-range phone and passes a large-font test.

**Resources:**
- flutter_animate: https://pub.dev/packages/flutter_animate
- Flutter DevTools: https://docs.flutter.dev/tools/devtools
- Performance best practices: https://docs.flutter.dev/perf/best-practices
- Accessibility: https://docs.flutter.dev/ui/accessibility
- flutter_launcher_icons: https://pub.dev/packages/flutter_launcher_icons
- flutter_native_splash: https://pub.dev/packages/flutter_native_splash

---

## Step 17: Ship it

**Do, in order:**
1. Write the README: screenshots or a GIF, feature list, architecture diagram (simple boxes: UI, providers, repository, remote and local sources), setup steps, API credits (Open-Meteo, and Nominatim if used).
2. Add a GitHub Actions workflow that runs `flutter analyze` and `flutter test` on every push.
3. Build a release APK: `flutter build apk --release`. Install it on a real phone.
4. Record a 30-60 second demo video.
5. Add the project to your portfolio and resume with one line on the architecture (feature-first, Riverpod, offline-first with Drift).

**Done when:** a stranger can clone the repo, follow the README, and run the app. CI shows green.

**Resources:**
- GitHub Actions for Flutter: https://github.com/subosito/flutter-action
- Build and release Android: https://docs.flutter.dev/deployment/android
- README tips: https://www.makeareadme.com
- Diagrams: https://excalidraw.com

---

## Stretch (Completed)

- [x] **Rain alert notifications:** `flutter_local_notifications` integrated with automatic rain detection and notification permission controls.
- [x] **Home screen widget:** `home_widget` integrated with native Android AppWidget layout, provider, and automatic updates.
- [x] **Bengali localization:** Full bilingual support (English / বাংলা) with in-app language switching, weather condition translations, and Bengali numerals.

---

## Checklist

- [x] Step 0 Environment
- [x] Step 1 Project and skeleton
- [x] Step 2 Core setup
- [x] Step 3 Networking
- [x] Step 4 Models
- [x] Step 5 Repository and providers
- [x] Step 6 Home UI
- [x] Step 7 Location
- [x] Step 8 Hourly and daily
- [x] Step 9 City search
- [x] Step 10 Saved cities
- [x] Step 11 Settings
- [x] Step 12 Offline cache
- [x] Step 13 Air quality
- [x] Step 14 Charts
- [x] Step 15 Testing
- [x] Step 16 Polish
- [x] Step 17 Ship
