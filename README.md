# ⛅ Weather+

A production-style weather application built with Flutter, Riverpod, and Clean Architecture. Features an adaptive atmospheric background that changes dynamically according to the **weather condition**, **temperature**, and **time of day** (bright skies in daytime, golden twilight at sunrise/sunset, and deep dark shades with moon & stars at night).

---

## 📱 Features

- **Accurate City Local Time**:
  - Automatically calculates and displays the **current local time** of any searched city across the globe using real-time UTC offsets.
  - The dynamic atmosphere (day, night, dawn, dusk) seamlessly adapts to the time of the searched city, not just the phone's timezone.
- **Dynamic Atmosphere Engine**:
  - **Daytime**: Radiant sky with an animated sun, warm light, and daylight color palettes.
  - **Nighttime**: Deep dark shades (midnight indigo/slate), luminous crescent moon, and twinkling stars.
  - **Dawn / Dusk**: Golden hour / twilight hues blending amber, magenta, and dusky violet based on local sunrise/sunset.
  - **Temperature-Adaptive**: Cool crystalline cyan undertones in cold weather (< 6°C), warm amber/golden tones in hot weather (> 28°C).
  - **Weather-Reactive Elements**: Animated rain streaks, drifting clouds, and snow particles.
- **Glassmorphic UI**: Translucent frosted glass cards with gaussian blur (`BackdropFilter`) allowing the dynamic sky to shine through.
- **Offline-First Caching**:
  - Powered by Drift SQLite database (`CachedWeathers` table).
  - Automatically caches the latest weather response.
  - On network loss or timeout, instantly falls back to cached data with an offline indicator and timestamp.
  - Real-time connection monitoring with `connectivity_plus`.
- **Air Quality Card**:
  - Independent loading with US AQI (0–500), PM2.5, and PM10 pollutants.
  - Visual spectrum bar and official health advisory descriptions with color-coded safety levels (Good, Moderate, Sensitive, Unhealthy, Very Unhealthy, Hazardous).
- **Interactive 24-Hour Trends Charts**:
  - Powered by `fl_chart`.
  - Temperature trend smooth curved line chart with gradient fill and touch tooltips.
  - Precipitation probability bar chart with rain volume indicators.
- **Hero Header**: Live local date & time, large temperature display, high/low range, and feels-like temperature.
- **Hourly Forecast**: 24-hour horizontal forecast with day/night weather icons, "Now" highlight badge, and precipitation probability pills.
- **7-Day Forecast**: Weekly forecast featuring visual temperature gradient range bars with current temperature indicators.
- **Today at a Glance**: Responsive metrics grid (Humidity, Wind Speed, UV Index, Sunrise, Sunset, and Last Updated).
- **Search & Favorites**: Debounced search for cities worldwide with offline caching and saved locations.
- **Bengali Localization (বাংলা লোকালাইজেশন)**:
  - In-app language switcher (`English` / `বাংলা`) with instant translation across all weather conditions, metrics, and navigation.
  - Automatic Bengali numerals formatting.
- **Rain Alert Notifications**:
  - Powered by `flutter_local_notifications`.
  - Scans upcoming hourly forecasts for high precipitation probability (> 50%).
  - Automatically dispatches alert notifications with umbrella reminders.
- **Home Screen Widget**:
  - Powered by `home_widget` and native Android `AppWidgetProvider`.
  - Displays live city name, temperature, weather icon, condition, and high/low range on your Android home screen.
- **Customizable Settings**: Toggle between Celsius (°C) / Fahrenheit (°F), km/h / mph, Theme Mode, Language, and Rain Alerts.

---

## 🏗️ Architecture

```
                    ┌─────────────────────────┐
                    │       Presentation      │
                    │ (Screens, Glass Widgets,│
                    │     Riverpod State)     │
                    └────────────┬────────────┘
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │      Domain Layer       │
                    │  (Entities, Repository  │
                    │   Interfaces, Mappers)  │
                    └────────────▲────────────┘
                                 │
                                 │
                    ┌────────────┴────────────┐
                    │       Data Layer        │
                    │  (Remote Sources - Dio  │
                    │   Local Sources - Drift)│
                    └────────────┬────────────┘
                                 │
             ┌───────────────────┴───────────────────┐
             ▼                                       ▼
  [Open-Meteo REST APIs]                  [SQLite Local Database]
(Forecast, Geocoding, AQI)             (Saved Cities, Cached Weather)
```

---

## 🗂️ Project Structure

```
lib/
├── core/                               # Shared utilities, router, database, and themes
│   ├── constants/
│   │   └── api_endpoints.dart          # Base URLs for forecast, geocoding, air quality
│   ├── database/
│   │   ├── app_database.dart           # Drift SQLite database (SavedCities, CachedWeathers)
│   │   └── app_database.g.dart
│   ├── network/
│   │   ├── dio_client.dart             # Dio network client with timeouts and logging
│   │   ├── api_exception.dart          # Typed API exceptions
│   │   └── connectivity_provider.dart  # Real-time connection monitoring
│   ├── router/
│   │   └── app_router.dart             # GoRouter routes (/ , /search, /saved, /settings)
│   ├── theme/
│   │   ├── app_theme.dart              # Global Material 3 Light/Dark theme
│   │   ├── weather_atmosphere.dart     # Dynamic sky engine (Day/Night, colors, temperature)
│   │   └── colors.dart                 # Color constants
│   ├── utils/
│   │   ├── date_utils.dart
│   │   └── weather_code_mapper.dart    # Maps WMO codes to descriptions & icons
│   └── widgets/
│       ├── glass_card.dart             # Reusable frosted glassmorphic card
│       ├── error_view.dart             # Error state widget
│       └── loading_view.dart
│
└── features/
    ├── weather/                        # Main weather feature
    │   ├── domain/                     # Entities & repository interface
    │   │   └── entities/               # Weather, HourlyForecast, DailyForecast
    │   ├── data/                       # API clients, DTOs, and Drift local cache
    │   └── presentation/               # UI components and providers
    │       ├── screens/
    │       │   └── home_screen.dart    # 👈 MAIN PAGE (Composes all sections)
    │       └── widgets/                # Section widgets
    │           ├── weather_atmosphere_background.dart # Dynamic sky canvas (Sun, Moon, Stars)
    │           ├── current_weather_header.dart        # Hero weather banner (Local Time)
    │           ├── hourly_forecast_list.dart          # 24h scrollable list
    │           ├── daily_forecast_list.dart           # 7-day range bars
    │           ├── stats_grid.dart                    # "At a glance" grid
    │           ├── stat_card.dart                     # Metric card item
    │           ├── current_weather_loading.dart       # Shimmer placeholder
    │           └── charts/                            # Interactive trends
    │               ├── temperature_chart.dart         # 24h temperature line chart
    │               ├── rain_chart.dart                # 24h rain probability bar chart
    │               └── forecast_charts_card.dart      # Tabbed chart container
    │
    ├── air_quality/                    # Air quality feature
    │   ├── domain/                     # AirQuality entity & category mapper
    │   ├── data/                       # Remote source and repository implementation
    │   └── presentation/               # AirQualityCard widget & providers
    │
    ├── city_search/                    # City search with debounce
    │   └── presentation/screens/
    │       └── city_search_screen.dart # Search page (/search)
    ├── saved_cities/                   # Saved bookmarks feature
    │   └── presentation/screens/
    │       └── saved_cities_screen.dart# Saved cities page (/saved)
    └── settings/                       # User preferences feature
        └── presentation/screens/
            └── settings_screen.dart    # Settings page (/settings)
```

---

## 🧭 How to Find Sections in Code and Reorder Them

In this project, the main screen is **[`lib/features/weather/presentation/screens/home_screen.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/screens/home_screen.dart)**.

Inside `home_screen.dart`, locate **`_WeatherContent.build()`**. In its `ListView(children: [ ... ])`, every section is stacked vertically:

| Section Name | Code in `home_screen.dart` | Source Widget File |
| :--- | :--- | :--- |
| **Hero Weather Banner** | `CurrentWeatherHeader(...)` | [`current_weather_header.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/widgets/current_weather_header.dart) |
| **Save City Action** | `InkWell(child: ... 'Save city' ...)` | [`home_screen.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/screens/home_screen.dart) |
| **Hourly Forecast** | `_SectionCard(title: 'Hourly Forecast', child: HourlyForecastList(...))` | [`hourly_forecast_list.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/widgets/hourly_forecast_list.dart) |
| **24-Hour Trends Chart** | `ForecastChartsCard(...)` | [`forecast_charts_card.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/widgets/charts/forecast_charts_card.dart) |
| **7-Day Forecast** | `_SectionCard(title: '7-Day Forecast', child: DailyForecastList(...))` | [`daily_forecast_list.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/widgets/daily_forecast_list.dart) |
| **Air Quality** | `AirQualityCard(...)` | [`air_quality_card.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/air_quality/presentation/widgets/air_quality_card.dart) |
| **Today at a Glance** | `_SectionCard(title: 'Today at a Glance', child: StatsGrid(...))` | [`stats_grid.dart`](file:///d:/Flatter%20test/weather_plus/lib/features/weather/presentation/widgets/stats_grid.dart) |

To reorder any section, simply swap the order of the widgets inside the `ListView` children list.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.13+)
- Dart SDK (3.13+)

### Installation & Run
```bash
# Get dependencies
flutter pub get

# Generate code (Drift, Freezed, JsonSerializable)
dart run build_runner build -d

# Run on connected device / emulator
flutter run

# Run test suite
flutter test

# Run static analysis
flutter analyze
```

---

## 🌐 External APIs & Credits

- **[Open-Meteo Weather Forecast API](https://open-meteo.com/en/docs)**: Weather conditions, hourly, and daily forecasts. Free for non-commercial use.
- **[Open-Meteo Geocoding API](https://open-meteo.com/en/docs/geocoding-api)**: Fast worldwide city search and coordinate lookups.
- **[Open-Meteo Air Quality API](https://open-meteo.com/en/docs/air-quality-api)**: US AQI, PM2.5, and PM10 metrics.
- **[OpenStreetMap Nominatim](https://nominatim.org/release-docs/latest/api/Reverse/)**: Reverse geocoding for GPS coordinate naming.
