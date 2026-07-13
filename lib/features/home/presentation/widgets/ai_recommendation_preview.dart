import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// A preview of what AI suggests practicing next, with the reason why.
class AiRecommendationPreview extends StatelessWidget {
  const AiRecommendationPreview({
    required this.greeting,
    required this.recommendation,
    required this.onOpen,
    super.key,
  });

  final AiGreeting greeting;
  final AiRecommendation? recommendation;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final insight = recommendation;

    return AppCard(
      onTap: onOpen,
      borderColor: AppColors.cyan.withValues(alpha: 0.34),
      elevation: 2,
      shadowColor: AppColors.ink.withValues(alpha: 0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, size: 16, color: AppColors.cyan),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                'Performa meningkat 10%',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            insight?.reason ?? greeting.message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.ink,
              height: 1.45,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Lihat detail',
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.teal,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
