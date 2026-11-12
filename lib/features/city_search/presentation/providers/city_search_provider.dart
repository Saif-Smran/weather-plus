import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/city_remote_source.dart';
import '../../domain/entities/city.dart';

enum CitySearchStatus { idle, loading, data, empty, error }

class CitySearchState {
  const CitySearchState({
    this.query = '',
    this.results = const [],
    this.status = CitySearchStatus.idle,
    this.error,
  });

  final String query;
  final List<City> results;
  final CitySearchStatus status;
  final Object? error;

  CitySearchState copyWith({
    String? query,
    List<City>? results,
    CitySearchStatus? status,
    Object? error,
  }) {
    return CitySearchState(
      query: query ?? this.query,
      results: results ?? this.results,
      status: status ?? this.status,
      error: error,
    );
  }
}

final cityRemoteSourceProvider = Provider<CityRemoteSource>(
  (ref) => CityRemoteSource(ref.watch(dioProvider)),
);

final citySearchProvider =
    NotifierProvider<CitySearchNotifier, CitySearchState>(
      CitySearchNotifier.new,
    );

class CitySearchNotifier extends Notifier<CitySearchState> {
  Timer? _debounce;

  CityRemoteSource get _source => ref.read(cityRemoteSourceProvider);

  @override
  CitySearchState build() {
    ref.onDispose(() => _debounce?.cancel());
    return const CitySearchState();
  }

  void updateQuery(String value) {
    _debounce?.cancel();
    state = CitySearchState(
      query: value,
      status: value.trim().isEmpty
          ? CitySearchStatus.idle
          : CitySearchStatus.loading,
    );
    if (value.trim().isEmpty) return;

    _debounce = Timer(const Duration(milliseconds: 400), _search);
  }

  Future<void> _search() async {
    try {
      final results = await _source.search(state.query.trim());
      state = state.copyWith(
        results: results,
        status: results.isEmpty
            ? CitySearchStatus.empty
            : CitySearchStatus.data,
      );
    } catch (error) {
      state = state.copyWith(status: CitySearchStatus.error, error: error);
    }
  }
}
