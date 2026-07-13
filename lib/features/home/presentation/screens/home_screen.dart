import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../shared/widgets/state_views.dart';
import '../../domain/entities/home_summary.dart';
import '../controllers/home_controller.dart';
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
    final user = ref.watch(authControllerProvider).valueOrNull?.user;

    return RefreshIndicator(
      onRefresh: () => ref.read(homeControllerProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _HomeIntro(userName: user?.name ?? 'Ahmad'),
          const SizedBox(height: AppSpacing.md),
          DailyQiraHero(
            dailyQira: summary.dailyQira,
            continuePractice: summary.continuePractice,
            onStart: () => _openPractice(context, summary.continuePractice),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionTitle('Weekly Progress'),
          const SizedBox(height: AppSpacing.xs),
          WeeklySnapshotCard(snapshot: summary.weeklySnapshot),
          const SizedBox(height: AppSpacing.lg),
          const _SectionTitle('Latihan Terakhir'),
          const SizedBox(height: AppSpacing.xs),
          ContinuePracticeCard(
            item: summary.continuePractice,
            fallbackDailyQira: summary.dailyQira,
            onContinue: () => _openPractice(context, summary.continuePractice),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionTitle('AI Insight'),
          const SizedBox(height: AppSpacing.xs),
          AiRecommendationPreview(
            greeting: summary.greeting,
            recommendation: summary.recommendation,
            onOpen: () => context.go('/insight'),
          ),
        ],
      ),
    );
  }

  void _openPractice(BuildContext context, ContinuePractice? item) {
    final practiceId = item?.practiceId;
    context.go(
      practiceId == null || practiceId.isEmpty
          ? '/practice'
          : '/practice/$practiceId',
    );
  }
}

class _HomeIntro extends StatelessWidget {
  const _HomeIntro({required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat pagi, $userName',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                'Siap lanjut latihan hari ini?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
        Semantics(
          label: 'Streak 7 hari',
          child: Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(AppRadius.pill),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.08),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '7',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.surfaceElevated,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: AppSpacing.xxs),
                const Icon(
                  Icons.local_fire_department_rounded,
                  size: 20,
                  color: AppColors.warning,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}
