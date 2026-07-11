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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Smart Suggestion',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.aqua),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            suggestion,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.surfaceElevated),
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
