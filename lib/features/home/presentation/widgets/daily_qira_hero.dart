import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../domain/entities/home_summary.dart';

/// Strong Home hero that answers the next learning action.
class DailyQiraHero extends StatelessWidget {
  const DailyQiraHero({
    required this.dailyQira,
    required this.continuePractice,
    required this.onStart,
    super.key,
  });

  final DailyQira dailyQira;
  final ContinuePractice? continuePractice;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const progressPercent = 57;
    const progress = progressPercent / 100;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.hero),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.navy, AppColors.navy2],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.14),
            blurRadius: 42,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -22,
            right: 0,
            child: Text(
              'ض',
              style: TextStyle(
                color: AppColors.surfaceElevated.withValues(alpha: 0.08),
                fontSize: 132,
                height: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.aqua.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Text(
                    'CONTINUE LEARNING',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.aqua,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                dailyQira.surahName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.surfaceElevated,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                dailyQira.ayahLabel,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.surfaceElevated.withValues(alpha: 0.72),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                dailyQira.arabicText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 30,
                  height: 44 / 30,
                  color: AppColors.surfaceElevated,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.pill),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: AppColors.surfaceElevated.withValues(
                    alpha: 0.14,
                  ),
                  valueColor: const AlwaysStoppedAnimation(AppColors.aqua),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Text(
                    'Terakhir latihan: Hari ini',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.surfaceElevated.withValues(alpha: 0.72),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$progressPercent%',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.aqua,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Lanjutkan dari titik terakhir, lalu rekam bacaan untuk evaluasi awal.',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: AppColors.surfaceElevated.withValues(
                          alpha: 0.72,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  FilledButton.icon(
                    onPressed: onStart,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.aqua,
                      foregroundColor: AppColors.ink,
                    ),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Lanjutkan'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
