import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// Weekly progress card with chart context and compact summary metrics.
class WeeklySnapshotCard extends StatelessWidget {
  const WeeklySnapshotCard({required this.snapshot, super.key});

  final WeeklySnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final bars = _weeklyBars(snapshot);

    return AppCard(
      borderColor: AppColors.cyan.withValues(alpha: 0.32),
      elevation: 2,
      shadowColor: AppColors.ink.withValues(alpha: 0.16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 112,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bar in bars)
                  Expanded(
                    child: _DayBar(day: bar.day, value: bar.value),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _Metric(label: 'sesi', value: '${snapshot.sessionsDone}'),
              _Metric(
                label: 'ayat',
                value: '${snapshot.sessionsDone * 4 + snapshot.streakDays}',
              ),
              _Metric(label: 'skor', value: '${snapshot.averageMatch}'),
            ],
          ),
        ],
      ),
    );
  }

  List<_WeeklyBar> _weeklyBars(WeeklySnapshot snapshot) {
    final base = snapshot.sessionsDone.clamp(1, 7);
    final scoreBoost = (snapshot.averageMatch / 100).clamp(0.0, 1.0);

    return [
      _WeeklyBar('Sen', 0.52 + (base * 0.02)),
      const _WeeklyBar('Sel', 0.34),
      _WeeklyBar('Rab', 0.78 + (scoreBoost * 0.12)),
      const _WeeklyBar('Kam', 0.42),
      const _WeeklyBar('Jum', 0.48),
      const _WeeklyBar('Sab', 0.40),
      _WeeklyBar('Min', 0.62 + (snapshot.streakDays.clamp(0, 7) * 0.03)),
    ];
  }
}

class _WeeklyBar {
  const _WeeklyBar(this.day, this.value);

  final String day;
  final double value;
}

class _DayBar extends StatelessWidget {
  const _DayBar({required this.day, required this.value});

  final String day;
  final double value;

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.2, 0.94);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: clampedValue,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.cyan, AppColors.teal],
                ),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(day, style: Theme.of(context).textTheme.labelSmall),
      ],
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
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.teal,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
