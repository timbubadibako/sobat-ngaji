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
      color: AppColors.surfaceMuted,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.aqua,
            child: Icon(Icons.auto_awesome, color: AppColors.ink),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendation',
                  style: Theme.of(context).textTheme.labelMedium,
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
