import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/state_views.dart';
import '../controllers/insight_controller.dart';
import '../widgets/letter_mastery_card.dart';
import '../widgets/smart_suggestion_card.dart';
import '../widgets/weekly_report_card.dart';
import '../widgets/weekly_trend_chart.dart';

/// Weekly insight screen focused on next practice.
class InsightScreen extends ConsumerWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(insightControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          loading: () => const LoadingState(message: 'Menyusun insight...'),
          error: (error, _) => ErrorStateView(
            error: error,
            onRetry: () =>
                ref.read(insightControllerProvider.notifier).refresh(),
          ),
          data: (insight) => RefreshIndicator(
            onRefresh: () =>
                ref.read(insightControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(
                  'Insight',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'AI detected learning pattern.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                WeeklyReportCard(insight: insight),
                const SizedBox(height: AppSpacing.md),
                WeeklyTrendChart(values: insight.trend),
                const SizedBox(height: AppSpacing.md),
                LetterMasteryCard(
                  focusLetter: insight.focusLetter,
                  mastery: insight.letterMastery,
                ),
                const SizedBox(height: AppSpacing.md),
                SmartSuggestionCard(suggestion: insight.suggestion),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
