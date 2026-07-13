import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/state_views.dart';
import '../controllers/practice_controller.dart';
import '../widgets/practice_card.dart';
import '../widgets/practice_filter_chip.dart';
import '../widgets/practice_search_bar.dart';
import '../widgets/step_progress.dart';

/// Practice list screen for curated ayah and phrase materials.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(practiceControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          loading: () =>
              const LoadingState(message: 'Memuat materi latihan...'),
          error: (error, _) => ErrorStateView(
            error: error,
            onRetry: () =>
                ref.read(practiceControllerProvider.notifier).refresh(),
          ),
          data: (practiceState) => _PracticeContent(state: practiceState),
        ),
      ),
    );
  }
}

class _PracticeContent extends ConsumerWidget {
  const _PracticeContent({required this.state});

  final PracticeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleItems = state.visibleItems;

    return RefreshIndicator(
      onRefresh: () => ref.read(practiceControllerProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _PracticeHeader(),
          const SizedBox(height: AppSpacing.md),
          PracticeSearchBar(
            onChanged: ref.read(practiceControllerProvider.notifier).search,
          ),
          const SizedBox(height: AppSpacing.sm),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: PracticeFilter.values.map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.xs),
                  child: PracticeFilterChip(
                    label: filter.label,
                    selected: state.filter == filter,
                    onSelected: () => ref
                        .read(practiceControllerProvider.notifier)
                        .setFilter(filter),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const _PracticeAiRecommendation(),
          const SizedBox(height: AppSpacing.md),
          SectionHeader(
            title: 'Frasa kurasi',
            actionLabel: '${visibleItems.length} butir',
            onAction: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          const SectionHeader(title: 'Progres latihan'),
          const SizedBox(height: AppSpacing.xs),
          const StepProgress(currentStep: 1, totalSteps: 4),
          const SizedBox(height: AppSpacing.xs),
          if (visibleItems.isEmpty)
            const EmptyState(
              title: 'Materi tidak ditemukan',
              message: 'Coba kata kunci atau filter lain.',
            )
          else
            ...visibleItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: PracticeCard(
                  item: item,
                  onTap: () => context.go('/practice/${item.id}'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PracticeHeader extends StatelessWidget {
  const _PracticeHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Latihan', style: theme.textTheme.headlineMedium),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                'Pilih frasa pendek untuk latihan terarah.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ),
        IconButton.filledTonal(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surfaceElevated,
            foregroundColor: AppColors.navy,
            shadowColor: AppColors.ink.withValues(alpha: 0.14),
            elevation: 2,
          ),
          icon: const Icon(Icons.tune_rounded),
          tooltip: 'Filter latihan',
        ),
      ],
    );
  }
}

class _PracticeAiRecommendation extends StatelessWidget {
  const _PracticeAiRecommendation();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      borderColor: AppColors.aqua.withValues(alpha: 0.38),
      elevation: 2,
      shadowColor: AppColors.ink.withValues(alpha: 0.14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.aqua, AppColors.cyan],
              ),
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: const Text(
              'AI',
              style: TextStyle(
                color: AppColors.navy,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rekomendasi',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Mulai dari Ad-Dhuha.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Frasa ini cocok untuk fokus huruf ض dan tempo pendek sebelum latihan yang lebih panjang.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
