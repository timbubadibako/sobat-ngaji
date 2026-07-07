import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// AI presence on Home: a warm, personal greeting — not noisy decoration.
class AiGreetingCard extends StatelessWidget {
  const AiGreetingCard({required this.greeting, super.key});

  final AiGreeting greeting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      color: AppColors.surfaceMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.aqua,
                child: Icon(Icons.auto_awesome, size: 18, color: AppColors.ink),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'AI Greeting',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(greeting.headline, style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xxs),
          Text(greeting.message, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
