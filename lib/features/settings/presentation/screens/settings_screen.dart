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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _SettingsGroupCard(
            title: 'Temperature Unit',
            icon: Icons.thermostat_outlined,
            child: SegmentedButton<TemperatureUnit>(
              segments: const [
                ButtonSegment(
                  value: TemperatureUnit.celsius,
                  label: Text('Celsius (°C)'),
                  icon: Icon(Icons.dew_point, size: 16),
                ),
                ButtonSegment(
                  value: TemperatureUnit.fahrenheit,
                  label: Text('Fahrenheit (°F)'),
                  icon: Icon(Icons.whatshot_outlined, size: 16),
                ),
              ],
              selected: {settings.temperatureUnit},
              onSelectionChanged: (selection) =>
                  notifier.setTemperatureUnit(selection.first),
            ),
          ),
          const SizedBox(height: 16),
          _SettingsGroupCard(
            title: 'Wind Speed Unit',
            icon: Icons.air,
            child: SegmentedButton<WindUnit>(
              segments: const [
                ButtonSegment(
                  value: WindUnit.kilometersPerHour,
                  label: Text('km/h'),
                ),
                ButtonSegment(
                  value: WindUnit.milesPerHour,
                  label: Text('mph'),
                ),
              ],
              selected: {settings.windUnit},
              onSelectionChanged: (selection) =>
                  notifier.setWindUnit(selection.first),
            ),
          ),
          const SizedBox(height: 16),
          _SettingsGroupCard(
            title: 'Theme Preference',
            icon: Icons.palette_outlined,
            child: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text('Auto'),
                  icon: Icon(Icons.brightness_auto, size: 16),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode_outlined, size: 16),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode_outlined, size: 16),
                ),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (selection) =>
                  notifier.setThemeMode(selection.first),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroupCard extends StatelessWidget {
  const _SettingsGroupCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
