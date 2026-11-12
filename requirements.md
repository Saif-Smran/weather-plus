# Weather+ : Requirements

## 1. Purpose

Build a production-style Flutter weather app to close the gap between watching tutorials and shipping real code. No custom backend. All data comes from free public APIs.

**Primary goal:** learn layered architecture, async state management, real API work, offline caching, and testing.
**Secondary goal:** a clean portfolio project with a visible architecture story.

## 2. Scope

### In scope (MVP)
- Current weather for device GPS location
- 24-hour hourly forecast and 7-day daily forecast
- City search with debounce
- Saved cities (add, list, swipe to delete)
- Unit toggles: °C/°F, km/h/mph
- Light and dark theme
- Loading, error, and empty states on every screen

### In scope (Phase 2)
- Air quality card (US AQI, PM2.5, PM10) with color coding
- Temperature and rain probability charts
- Offline cache with a "last updated" label
- Pull to refresh
- Weather-based animated backgrounds

### Stretch
- Rain alert local notifications
- Home screen widget
- Bengali localization

### Out of scope
- User accounts, login, cloud sync
- Custom backend or database server
- Maps and radar layers
- Paid APIs

## 3. Functional Requirements

| ID | Requirement |
|----|-------------|
| FR-01 | App requests location permission and shows current weather for GPS position |
| FR-02 | If permission is denied, app falls back to a default city and shows a clear message with a retry option |
| FR-03 | Home screen shows temperature, feels-like, condition icon and text, humidity, wind, UV, sunrise, sunset |
| FR-04 | Home screen shows the next 24 hours in a horizontal list |
| FR-05 | Home screen shows a 7-day forecast with min and max temperature and condition |
| FR-06 | User can search cities by name; requests fire only after 400 ms of no typing |
| FR-07 | User can save a city from search results and open its weather |
| FR-08 | User can remove a saved city by swiping |
| FR-09 | User can switch temperature unit and wind speed unit; choice persists after restart |
| FR-10 | User can switch light, dark, or system theme; choice persists |
| FR-11 | Every network screen has loading, error (with retry), and empty states |
| FR-12 | App shows cached data when offline with a "last updated" timestamp |
| FR-13 | Air quality card shows AQI value, category label, and color |
| FR-14 | Charts show hourly temperature and rain probability |
| FR-15 | Pull to refresh reloads weather for the current city |

## 4. Non-Functional Requirements

| ID | Requirement |
|----|-------------|
| NFR-01 | Architecture: feature-first with data, domain, presentation layers |
| NFR-02 | No API calls or JSON parsing inside widgets |
| NFR-03 | State management: Riverpod only, no mixing with other solutions |
| NFR-04 | Models are immutable (freezed) |
| NFR-05 | First meaningful screen renders under 2 seconds on a mid-range Android phone with cached data |
| NFR-06 | `flutter analyze` returns zero warnings |
| NFR-07 | At least 10 unit tests (repository, mappers, providers) and 2 widget tests |
| NFR-08 | App works on Android. iOS is optional |
| NFR-09 | Text scales correctly with system font size; tap targets at least 48 dp |
| NFR-10 | No secrets committed. APIs used here need no key, but keep the pattern ready for later |
| NFR-11 | Git history uses small, meaningful commits |

## 5. Tech Stack

| Area | Choice |
|------|--------|
| Language and framework | Dart, Flutter (latest stable) |
| State management | flutter_riverpod, riverpod_annotation, riverpod_generator |
| Networking | dio |
| Models | freezed, json_serializable, build_runner |
| Routing | go_router |
| Location | geolocator |
| Local DB | drift, drift_flutter |
| Settings storage | shared_preferences |
| Formatting | intl |
| Connectivity | connectivity_plus |
| Charts | fl_chart |
| Loading UI | shimmer |
| Animation | lottie or flutter_animate |
| Testing | flutter_test, mocktail |
| Lints | flutter_lints |

Add packages only when the feature needs them. Check pub.dev for current versions.

## 6. External APIs (no key required)

| API | Use | Docs |
|-----|-----|------|
| Open-Meteo Forecast | current, hourly, daily weather | https://open-meteo.com/en/docs |
| Open-Meteo Geocoding | city search | https://open-meteo.com/en/docs/geocoding-api |
| Open-Meteo Air Quality | AQI, PM2.5, PM10 | https://open-meteo.com/en/docs/air-quality-api |
| Nominatim (optional) | reverse geocode GPS to city name | https://nominatim.org/release-docs/latest/api/Reverse/ |

Example requests:

```
https://api.open-meteo.com/v1/forecast?latitude=23.81&longitude=90.41&current=temperature_2m,apparent_temperature,relative_humidity_2m,weather_code,wind_speed_10m&hourly=temperature_2m,precipitation_probability,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max&timezone=auto

https://geocoding-api.open-meteo.com/v1/search?name=Dhaka&count=10

https://air-quality-api.open-meteo.com/v1/air-quality?latitude=23.81&longitude=90.41&current=us_aqi,pm2_5,pm10
```

Open-Meteo is free for non-commercial use. Read their terms before publishing publicly.

## 7. Folder Structure

```
lib/
  main.dart
  app.dart
  core/
    network/        dio_client.dart, api_exception.dart
    router/         app_router.dart
    theme/          app_theme.dart, colors.dart
    utils/          date_utils.dart, weather_code_mapper.dart
    constants/      api_endpoints.dart
    widgets/        error_view.dart, loading_view.dart
  features/
    weather/
      data/         models/, weather_remote_source.dart,
                    weather_local_source.dart, weather_repository_impl.dart
      domain/       entities/, weather_repository.dart
      presentation/ providers/, screens/, widgets/
    city_search/    data, domain, presentation
    saved_cities/   data, domain, presentation
    air_quality/    data, domain, presentation
    settings/       data, domain, presentation
test/
  mirrors lib/
```

Dependency rule: presentation depends on domain. Data implements domain. Domain depends on nothing.

## 8. Risks

| Risk | Mitigation |
|------|------------|
| Over-engineering the architecture early | Build one feature end to end first, then copy the pattern |
| Code generation errors from freezed or drift | Keep `dart run build_runner watch -d` running, fix errors at the first appearance |
| Location permission edge cases | Test denied, denied forever, and services-off cases on a real device |
| API rate limits or downtime | Cache responses and show stale data with a label |
| Package API changes (Riverpod, go_router) | Follow current official docs, not old tutorials |
| Scope creep into animations | MVP first, polish last |

## 9. Definition of Done

- All MVP and Phase 2 functional requirements pass manual testing
- NFR-06 and NFR-07 satisfied
- README with screenshots, architecture diagram, setup steps, and API credits
- Release APK builds and runs on a real device
- Code pushed to GitHub with a clean commit history
