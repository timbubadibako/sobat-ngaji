import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../shared/widgets/state_views.dart';
import '../../domain/entities/home_summary.dart';
import '../controllers/home_controller.dart';
import '../widgets/ai_greeting_card.dart';
import '../widgets/ai_recommendation_preview.dart';
import '../widgets/continue_practice_card.dart';
import '../widgets/daily_qira_hero.dart';
import '../widgets/weekly_snapshot_card.dart';

/// Home: Daily Qira hero first, then AI presence and weekly orientation.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: homeState.when(
          loading: () =>
              const LoadingState(message: 'Menyiapkan Daily Qira...'),
          error: (error, _) {
            if (error is AppFailure && error.code == 'home_empty') {
              return EmptyState(
                title: 'Belum ada ringkasan',
                message: error.message,
                actionLabel: 'Mulai Daily Qira',
                onAction: () => context.go('/practice'),
              );
            }

            return ErrorStateView(
              error: error,
              onRetry: () =>
                  ref.read(homeControllerProvider.notifier).refresh(),
            );
          },
          data: (summary) => _HomeContent(summary: summary),
        ),
      ),
    );
  }
}

class _HomeContent extends ConsumerWidget {
  const _HomeContent({required this.summary});

  final HomeSummary summary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.read(homeControllerProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _HomeIntro(),
          const SizedBox(height: AppSpacing.md),
          DailyQiraHero(
            dailyQira: summary.dailyQira,
            onStart: () => context.go('/practice'),
          ),
          const SizedBox(height: AppSpacing.md),
          AiGreetingCard(greeting: summary.greeting),
          const SizedBox(height: AppSpacing.md),
          WeeklySnapshotCard(snapshot: summary.weeklySnapshot),
          if (summary.continuePractice != null) ...[
            const SizedBox(height: AppSpacing.md),
            ContinuePracticeCard(
              item: summary.continuePractice!,
              onContinue: () => context.go('/practice'),
            ),
          ],
          if (summary.recommendation != null) ...[
            const SizedBox(height: AppSpacing.md),
            AiRecommendationPreview(
              recommendation: summary.recommendation!,
              onOpen: () => context.go('/practice'),
            ),
          ],
        ],
      ),
    );
  }
}

class _HomeIntro extends StatelessWidget {
  const _HomeIntro();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Home',
          style: theme.textTheme.labelMedium?.copyWith(
            color: AppColors.teal,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text('Latihan hari ini', style: theme.textTheme.headlineMedium),
      ],
    );
  }
}
