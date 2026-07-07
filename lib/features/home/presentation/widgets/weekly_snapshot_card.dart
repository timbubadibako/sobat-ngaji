import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// Calm weekly orientation — a snapshot, deliberately not a stats dashboard.
class WeeklySnapshotCard extends StatelessWidget {
  const WeeklySnapshotCard({required this.snapshot, super.key});

  final WeeklySnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final progress = snapshot.sessionsTarget == 0
        ? 0.0
        : (snapshot.sessionsDone / snapshot.sessionsTarget).clamp(0.0, 1.0);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress mingguan',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text('Minggu ini', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.surfaceMuted,
              valueColor: const AlwaysStoppedAnimation(AppColors.teal),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _Metric(
                label: 'Sesi selesai',
                value: '${snapshot.sessionsDone}/${snapshot.sessionsTarget}',
              ),
              _Metric(
                label: 'Rata kecocokan',
                value: '${snapshot.averageMatch}%',
              ),
              _Metric(label: 'Streak', value: '${snapshot.streakDays} hari'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(color: AppColors.teal),
          ),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
