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
          Text('Practice', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Pilih frasa pendek untuk latihan terarah.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
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
          AppCard(
            color: AppColors.surfaceSoft,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.aqua,
                  child: Icon(Icons.auto_awesome, color: AppColors.ink),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'AI menyarankan mulai dari Ad-Dhuha untuk latihan huruf ض.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionHeader(
            title: 'Curated phrases',
            actionLabel: '${visibleItems.length} items',
            onAction: () {},
          ),
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
          const SizedBox(height: AppSpacing.md),
          const StepProgress(currentStep: 1, totalSteps: 4),
        ],
      ),
    );
  }
}
