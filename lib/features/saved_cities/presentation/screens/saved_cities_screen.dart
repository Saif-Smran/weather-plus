import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/saved_cities_provider.dart';

class SavedCitiesScreen extends ConsumerWidget {
  const SavedCitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(savedCitiesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Saved cities')),
      body: cities.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Unable to load saved cities.')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No saved cities yet.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final city = items[index];
              return Dismissible(
                key: ValueKey(city.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) async {
                  await ref.read(savedCitiesRepositoryProvider).remove(city.id);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${city.name} removed'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          ref.read(savedCitiesRepositoryProvider).restore(city);
                        },
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(city.name),
                  subtitle: Text(city.country),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push(
                    '/weather?lat=${city.latitude}&lon=${city.longitude}'
                    '&city=${Uri.encodeComponent(city.name)}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
