import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/state_views.dart';
import '../controllers/evaluation_controller.dart';
import '../widgets/ai_summary_card.dart';
import '../widgets/ayah_highlight_card.dart';
import '../widgets/retry_next_actions.dart';
import '../widgets/score_card.dart';

/// AI evaluation result screen.
class EvaluationResultScreen extends ConsumerWidget {
  const EvaluationResultScreen({required this.practiceId, super.key});

  final String practiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(evaluationResultProvider(practiceId));

    return Scaffold(
      body: SafeArea(
        child: resultState.when(
          loading: () =>
              const LoadingState(message: 'AI memproses evaluasi awal...'),
          error: (error, _) => ErrorStateView(
            error: error,
            onRetry: () => ref.invalidate(evaluationResultProvider(practiceId)),
          ),
          data: (result) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Evaluation',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Evaluasi awal dari sesi bacaan.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Chip(
                    label: Text('completed'),
                    backgroundColor: AppColors.success,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              ScoreCard(result: result),
              const SizedBox(height: AppSpacing.md),
              AyahHighlightCard(result: result),
              const SizedBox(height: AppSpacing.md),
              AiSummaryCard(result: result),
              const SizedBox(height: AppSpacing.md),
              _EventCard(events: result.events),
              const SizedBox(height: AppSpacing.md),
              RetryNextActions(
                onRetry: () => context.go('/recording/${result.practiceId}'),
                onNext: () => context.go('/insight'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.events});

  final List<String> events;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WebSocket events',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            for (final event in events)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 10, color: AppColors.teal),
                    const SizedBox(width: AppSpacing.xs),
                    Text(event),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
