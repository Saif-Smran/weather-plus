import 'package:flutter/material.dart';

enum TemperatureUnit { celsius, fahrenheit }

enum WindUnit { kilometersPerHour, milesPerHour }

class AppSettings {
  const AppSettings({
    this.temperatureUnit = TemperatureUnit.celsius,
    this.windUnit = WindUnit.kilometersPerHour,
    this.themeMode = ThemeMode.system,
    this.isLoaded = false,
  });

  final TemperatureUnit temperatureUnit;
  final WindUnit windUnit;
  final ThemeMode themeMode;
  final bool isLoaded;

  AppSettings copyWith({
    TemperatureUnit? temperatureUnit,
    WindUnit? windUnit,
    ThemeMode? themeMode,
    bool? isLoaded,
  }) {
    return AppSettings(
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      windUnit: windUnit ?? this.windUnit,
      themeMode: themeMode ?? this.themeMode,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
