import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/aqua_screen_scaffold.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';
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

    return AquaScreenScaffold(
      child: state.when(
        loading: () => const _InsightSkeleton(),
        error: (error, _) => ErrorStateView(
          error: error,
          onRetry: () => ref.read(insightControllerProvider.notifier).refresh(),
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
                'Apa yang perlu kamu latih?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              SmartSuggestionCard(suggestion: insight.suggestion),
              const SizedBox(height: AppSpacing.md),
              WeeklyReportCard(insight: insight),
              const SizedBox(height: AppSpacing.md),
              WeeklyTrendChart(values: insight.trend),
              const SizedBox(height: AppSpacing.md),
              LetterMasteryCard(
                focusLetter: insight.focusLetter,
                mastery: insight.letterMastery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InsightSkeleton extends StatelessWidget {
  const _InsightSkeleton();

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          128,
        ),
        children: const [
          SkeletonBox(width: 120, height: 30, radius: AppRadius.medium),
          SizedBox(height: AppSpacing.xs),
          SkeletonBox(width: 190),
          SizedBox(height: AppSpacing.md),
          _SkeletonCard(height: 118),
          SizedBox(height: AppSpacing.md),
          _SkeletonCard(height: 126),
          SizedBox(height: AppSpacing.md),
          _ChartSkeletonCard(),
          SizedBox(height: AppSpacing.md),
          _SkeletonCard(height: 170),
        ],
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.08),
      child: SizedBox(height: height),
    );
  }
}

class _ChartSkeletonCard extends StatelessWidget {
  const _ChartSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.08),
      child: SizedBox(
        height: 156,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Expanded(child: SkeletonBox(height: 52, radius: AppRadius.medium)),
            SizedBox(width: AppSpacing.xs),
            Expanded(child: SkeletonBox(height: 88, radius: AppRadius.medium)),
            SizedBox(width: AppSpacing.xs),
            Expanded(child: SkeletonBox(height: 68, radius: AppRadius.medium)),
            SizedBox(width: AppSpacing.xs),
            Expanded(child: SkeletonBox(height: 112, radius: AppRadius.medium)),
            SizedBox(width: AppSpacing.xs),
            Expanded(child: SkeletonBox(height: 74, radius: AppRadius.medium)),
          ],
        ),
      ),
    );
  }
}
