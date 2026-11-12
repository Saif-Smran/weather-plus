import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/settings.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Temperature', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<TemperatureUnit>(
            segments: const [
              ButtonSegment(value: TemperatureUnit.celsius, label: Text('°C')),
              ButtonSegment(
                value: TemperatureUnit.fahrenheit,
                label: Text('°F'),
              ),
            ],
            selected: {settings.temperatureUnit},
            onSelectionChanged: (selection) =>
                notifier.setTemperatureUnit(selection.first),
          ),
          const SizedBox(height: 24),
          Text('Wind speed', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<WindUnit>(
            segments: const [
              ButtonSegment(
                value: WindUnit.kilometersPerHour,
                label: Text('km/h'),
              ),
              ButtonSegment(value: WindUnit.milesPerHour, label: Text('mph')),
            ],
            selected: {settings.windUnit},
            onSelectionChanged: (selection) =>
                notifier.setWindUnit(selection.first),
          ),
          const SizedBox(height: 24),
          Text('Theme', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.system, label: Text('System')),
              ButtonSegment(value: ThemeMode.light, label: Text('Light')),
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
            ],
            selected: {settings.themeMode},
            onSelectionChanged: (selection) =>
                notifier.setThemeMode(selection.first),
          ),
        ],
      ),
    );
  }
}
