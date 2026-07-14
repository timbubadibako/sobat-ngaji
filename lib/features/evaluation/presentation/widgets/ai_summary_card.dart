import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/evaluation_result.dart';

/// AI feedback and recommendation card.
class AiSummaryCard extends StatelessWidget {
  const AiSummaryCard({required this.result, super.key});

  final EvaluationResult result;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.aqua.withValues(alpha: 0.38),
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              gradient: const LinearGradient(
                colors: [AppColors.aqua, AppColors.cyan],
              ),
            ),
            child: const Icon(Icons.auto_awesome, color: AppColors.ink),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendation',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  result.recommendation,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
