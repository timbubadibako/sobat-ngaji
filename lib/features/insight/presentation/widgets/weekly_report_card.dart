import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/weekly_insight.dart';

/// AI weekly summary and core stats.
class WeeklyReportCard extends StatelessWidget {
  const WeeklyReportCard({required this.insight, super.key});

  final WeeklyInsight insight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      color: AppColors.surfaceSoft,
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
              Expanded(
                child: Text(
                  'Weekly Report',
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Performa meningkat ${insight.growthPercent}%.',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(insight.summary, style: theme.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _Stat(value: '${insight.practiceCount}', label: 'Sesi'),
              _Stat(value: '${insight.averageScore}%', label: 'Avg score'),
              _Stat(value: '+${insight.growthPercent}%', label: 'Growth'),
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
