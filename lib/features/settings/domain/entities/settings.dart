import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';

enum TemperatureUnit { celsius, fahrenheit }

enum WindUnit { kilometersPerHour, milesPerHour }

class AppSettings {
  const AppSettings({
    this.temperatureUnit = TemperatureUnit.celsius,
    this.windUnit = WindUnit.kilometersPerHour,
    this.themeMode = ThemeMode.system,
    this.language = AppLanguage.english,
    this.rainAlertsEnabled = false,
    this.isLoaded = false,
  });

  final TemperatureUnit temperatureUnit;
  final WindUnit windUnit;
  final ThemeMode themeMode;
  final AppLanguage language;
  final bool rainAlertsEnabled;
  final bool isLoaded;

  AppSettings copyWith({
    TemperatureUnit? temperatureUnit,
    WindUnit? windUnit,
    ThemeMode? themeMode,
    AppLanguage? language,
    bool? rainAlertsEnabled,
    bool? isLoaded,
  }) {
    return AppSettings(
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      windUnit: windUnit ?? this.windUnit,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      rainAlertsEnabled: rainAlertsEnabled ?? this.rainAlertsEnabled,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
