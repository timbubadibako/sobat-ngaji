import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// A preview of what AI suggests practicing next, with the reason why.
class AiRecommendationPreview extends StatelessWidget {
  const AiRecommendationPreview({
    required this.recommendation,
    required this.onOpen,
    super.key,
  });

  final AiRecommendation recommendation;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      onTap: onOpen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, size: 16, color: AppColors.cyan),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                'Rekomendasi AI',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Kami menyarankan latihan berikut',
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            recommendation.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(recommendation.reason, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
