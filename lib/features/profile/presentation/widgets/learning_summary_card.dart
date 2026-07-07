import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/profile_summary.dart';

/// AI learning summary and small stats.
class LearningSummaryCard extends StatelessWidget {
  const LearningSummaryCard({required this.profile, super.key});

  final ProfileSummary profile;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.surfaceMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.aqua,
                child: Icon(Icons.auto_awesome, color: AppColors.ink),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Learning Summary',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(profile.learningSummary),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _Stat(value: '${profile.totalSessions}', label: 'Total sesi'),
              _Stat(value: '${profile.averageScore}%', label: 'Avg score'),
              _Stat(value: profile.focusLetter, label: 'Focus'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.titleLarge),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
