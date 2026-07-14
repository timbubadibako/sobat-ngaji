import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';

/// Actionable next-practice suggestion.
class SmartSuggestionCard extends StatelessWidget {
  const SmartSuggestionCard({required this.suggestion, super.key});

  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.navy,
      borderColor: AppColors.cyan.withValues(alpha: 0.28),
      elevation: AppElevation.level2,
      shadowColor: AppColors.navy.withValues(alpha: 0.22),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI menyarankan',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.aqua),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            suggestion,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.surfaceElevated),
          ),
          const SizedBox(height: AppSpacing.sm),
          FilledButton.icon(
            onPressed: () => context.go('/practice'),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Latih rekomendasi'),
          ),
        ],
      ),
    );
  }
}
