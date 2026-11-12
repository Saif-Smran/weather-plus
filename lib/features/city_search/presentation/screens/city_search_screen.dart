import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_view.dart';
import '../../../saved_cities/presentation/providers/saved_cities_provider.dart';
import '../providers/city_search_provider.dart';

class CitySearchScreen extends ConsumerWidget {
  const CitySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(citySearchProvider);
    final notifier = ref.read(citySearchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search for a city',
            border: InputBorder.none,
          ),
          onChanged: notifier.updateQuery,
        ),
      ),
      body: switch (search.status) {
        CitySearchStatus.idle => const Center(
          child: Text('Type a city name to search.'),
        ),
        CitySearchStatus.loading => const Center(
          child: CircularProgressIndicator(),
        ),
        CitySearchStatus.empty => const Center(child: Text('No cities found.')),
        CitySearchStatus.error => ErrorView(
          message: 'City search failed. Please try again.',
          onRetry: () => notifier.updateQuery(search.query),
        ),
        CitySearchStatus.data => ListView.builder(
          itemCount: search.results.length,
          itemBuilder: (context, index) {
            final city = search.results[index];
            return ListTile(
              title: Text(city.name),
              subtitle: Text(
                [city.adminRegion, city.country]
                    .whereType<String>()
                    .where((part) => part.isNotEmpty)
                    .join(', '),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.bookmark_add_outlined),
                tooltip: 'Save city',
                onPressed: () async {
                  final added = await ref
                      .read(savedCitiesRepositoryProvider)
                      .add(city);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        added == null
                            ? '${city.name} is already saved'
                            : '${city.name} saved',
                      ),
                    ),
                  );
                },
              ),
              onTap: () => context.push(
                '/weather?lat=${city.latitude}&lon=${city.longitude}'
                '&city=${Uri.encodeComponent(city.name)}',
              ),
            );
          },
        ),
      },
    );
  }
}
