import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_view.dart';
import '../../../saved_cities/presentation/providers/saved_cities_provider.dart';
import '../providers/city_search_provider.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search = ref.watch(citySearchProvider);
    final notifier = ref.read(citySearchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextField(
            controller: _controller,
            autofocus: true,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: 'Search city, state or country...',
              hintStyle: TextStyle(
                color: Theme.of(context).hintColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _controller.clear();
                        notifier.updateQuery('');
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              filled: false,
            ),
            onChanged: (val) {
              setState(() {});
              notifier.updateQuery(val);
            },
          ),
        ),
      ),
      body: switch (search.status) {
        CitySearchStatus.idle => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.travel_explore_rounded,
                  size: 64,
                  color: Theme.of(context).hintColor.withValues(alpha: 0.4),
                ),
                const SizedBox(height: 16),
                Text(
                  'Search for any city worldwide',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'e.g. London, Tokyo, New York',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).hintColor.withValues(alpha: 0.7),
                      ),
                ),
              ],
            ),
          ),
        CitySearchStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        CitySearchStatus.empty => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_off_outlined,
                  size: 56,
                  color: Theme.of(context).hintColor.withValues(alpha: 0.4),
                ),
                const SizedBox(height: 14),
                Text(
                  'No cities found matching "${search.query}"',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                ),
              ],
            ),
          ),
        CitySearchStatus.error => ErrorView(
            message: 'City search failed. Please try again.',
            onRetry: () => notifier.updateQuery(search.query),
          ),
        CitySearchStatus.data => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: search.results.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final city = search.results[index];
              final locationSubtitle = [city.adminRegion, city.country]
                  .whereType<String>()
                  .where((part) => part.isNotEmpty)
                  .join(', ');

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(
                    color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
                  ),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_city_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    city.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: locationSubtitle.isNotEmpty
                      ? Text(locationSubtitle)
                      : null,
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
                ),
              );
            },
          ),
      },
    );
  }
}
