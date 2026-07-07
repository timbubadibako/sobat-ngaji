import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/insight_repository_impl.dart';
import '../../domain/entities/weekly_insight.dart';

/// Loads weekly learning insight.
class InsightController extends AsyncNotifier<WeeklyInsight> {
  @override
  Future<WeeklyInsight> build() {
    return ref.watch(insightRepositoryProvider).loadWeeklyInsight();
  }

  Future<void> refresh() async {
    state = const AsyncLoading<WeeklyInsight>();
    state = await AsyncValue.guard(
      () => ref.read(insightRepositoryProvider).loadWeeklyInsight(),
    );
  }
}

final insightControllerProvider =
    AsyncNotifierProvider<InsightController, WeeklyInsight>(
      InsightController.new,
    );
