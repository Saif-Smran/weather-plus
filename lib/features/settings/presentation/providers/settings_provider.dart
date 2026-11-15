import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../domain/entities/settings.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);

final localizationsProvider = Provider<AppLocalizations>((ref) {
  final settings = ref.watch(settingsProvider);
  return AppLocalizations(settings.language);
});

class SettingsNotifier extends Notifier<AppSettings> {
  static const _temperatureKey = 'temperature_unit';
  static const _windKey = 'wind_unit';
  static const _themeKey = 'theme_mode';
  static const _languageKey = 'app_language';
  static const _rainAlertsKey = 'rain_alerts_enabled';

  late Future<SharedPreferences> _preferencesFuture;

  @override
  AppSettings build() {
    _preferencesFuture = SharedPreferences.getInstance();
    _load();
    return const AppSettings();
  }

  Future<void> _load() async {
    final preferences = await _preferencesFuture;
    state = AppSettings(
      temperatureUnit: _temperatureFromValue(
        preferences.getString(_temperatureKey),
      ),
      windUnit: _windFromValue(preferences.getString(_windKey)),
      themeMode: _themeFromValue(preferences.getString(_themeKey)),
      language: _languageFromValue(preferences.getString(_languageKey)),
      rainAlertsEnabled: preferences.getBool(_rainAlertsKey) ?? false,
      isLoaded: true,
    );
  }

  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    state = state.copyWith(temperatureUnit: unit);
    final preferences = await _preferencesFuture;
    await preferences.setString(_temperatureKey, unit.name);
  }

  Future<void> setWindUnit(WindUnit unit) async {
    state = state.copyWith(windUnit: unit);
    final preferences = await _preferencesFuture;
    await preferences.setString(_windKey, unit.name);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final preferences = await _preferencesFuture;
    await preferences.setString(_themeKey, mode.name);
  }

  Future<void> setLanguage(AppLanguage language) async {
    state = state.copyWith(language: language);
    final preferences = await _preferencesFuture;
    await preferences.setString(_languageKey, language.code);
  }

  Future<void> setRainAlertsEnabled(bool enabled) async {
    state = state.copyWith(rainAlertsEnabled: enabled);
    final preferences = await _preferencesFuture;
    await preferences.setBool(_rainAlertsKey, enabled);
  }

  TemperatureUnit _temperatureFromValue(String? value) {
    return TemperatureUnit.values.firstWhere(
      (unit) => unit.name == value,
      orElse: () => TemperatureUnit.celsius,
    );
  }

  WindUnit _windFromValue(String? value) {
    return WindUnit.values.firstWhere(
      (unit) => unit.name == value,
      orElse: () => WindUnit.kilometersPerHour,
    );
  }

  ThemeMode _themeFromValue(String? value) {
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  AppLanguage _languageFromValue(String? value) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == value,
      orElse: () => AppLanguage.english,
    );
  }
}
