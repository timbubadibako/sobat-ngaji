import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/evaluation_result.dart';

/// Match score and confidence summary.
class ScoreCard extends StatelessWidget {
  const ScoreCard({required this.result, super.key});

  final EvaluationResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        children: [
          ScoreRing(score: result.matchScore),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text('AI Confidence · ${result.confidenceLevel}'),
                  backgroundColor: AppColors.aqua.withValues(alpha: 0.18),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text('Bacaan cukup stabil.', style: theme.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(result.summary, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Circular score visualization.
class ScoreRing extends StatelessWidget {
  const ScoreRing({required this.score, super.key});

  final int score;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 104,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: score / 100,
            strokeWidth: 9,
            backgroundColor: AppColors.surfaceMuted,
            valueColor: const AlwaysStoppedAnimation(AppColors.teal),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$score', style: Theme.of(context).textTheme.headlineMedium),
              Text('match', style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
