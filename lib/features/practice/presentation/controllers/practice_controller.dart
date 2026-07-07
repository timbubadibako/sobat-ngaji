import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/practice_repository_impl.dart';
import '../../domain/entities/practice_item.dart';

/// UI state for Practice list search and filtering.
class PracticeState {
  const PracticeState({
    required this.items,
    this.query = '',
    this.filter = PracticeFilter.all,
  });

  final List<PracticeItem> items;
  final String query;
  final PracticeFilter filter;

  List<PracticeItem> get visibleItems {
    final normalizedQuery = query.trim().toLowerCase();

    return items.where((item) {
      final matchesFilter = switch (filter) {
        PracticeFilter.all => true,
        PracticeFilter.daily => item.isDaily,
        PracticeFilter.juz30 => item.surahNumber >= 78,
        PracticeFilter.focusDad => item.focus.contains('ض'),
        PracticeFilter.beginner => item.level == 'Beginner',
      };

      final matchesQuery =
          normalizedQuery.isEmpty ||
          item.surahName.toLowerCase().contains(normalizedQuery) ||
          item.ayahLabel.toLowerCase().contains(normalizedQuery) ||
          item.arabicName.contains(normalizedQuery);

      return matchesFilter && matchesQuery;
    }).toList();
  }

  PracticeState copyWith({
    List<PracticeItem>? items,
    String? query,
    PracticeFilter? filter,
  }) {
    return PracticeState(
      items: items ?? this.items,
      query: query ?? this.query,
      filter: filter ?? this.filter,
    );
  }
}

enum PracticeFilter {
  all('Semua'),
  daily('Daily'),
  juz30('Juz 30'),
  focusDad('Huruf ض'),
  beginner('Beginner');

  const PracticeFilter(this.label);

  final String label;
}

/// Loads Practice catalog and handles list intent.
class PracticeController extends AsyncNotifier<PracticeState> {
  @override
  Future<PracticeState> build() async {
    final items = await ref
        .watch(practiceRepositoryProvider)
        .loadPracticeItems();
    return PracticeState(items: items);
  }

  void search(String query) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }
    state = AsyncData(current.copyWith(query: query));
  }

  void setFilter(PracticeFilter filter) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }
    state = AsyncData(current.copyWith(filter: filter));
  }

  Future<void> refresh() async {
    state = const AsyncLoading<PracticeState>();
    state = await AsyncValue.guard(build);
  }
}

final practiceControllerProvider =
    AsyncNotifierProvider<PracticeController, PracticeState>(
      PracticeController.new,
    );

final practiceItemProvider = FutureProvider.family<PracticeItem, String>((
  ref,
  id,
) {
  return ref.watch(practiceRepositoryProvider).loadPracticeItem(id);
});
