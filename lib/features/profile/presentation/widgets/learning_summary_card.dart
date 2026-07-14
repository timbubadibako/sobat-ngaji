import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/profile_summary.dart';

/// AI learning summary small stats.
class LearningSummaryCard extends StatelessWidget {
  const LearningSummaryCard({required this.profile, super.key});

  final ProfileSummary profile;

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
                  'Target latihan',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(profile.learningSummary),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Fokus huruf ${profile.focusLetter}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
