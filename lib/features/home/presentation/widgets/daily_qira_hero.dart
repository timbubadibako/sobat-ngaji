import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../domain/entities/home_summary.dart';

/// The strongest visual element on the first viewport: Daily Qira.
///
/// Treats Arabic text as the primary artifact with generous spacing and
/// strong contrast against a calm brand gradient.
class DailyQiraHero extends StatelessWidget {
  const DailyQiraHero({
    required this.dailyQira,
    required this.onStart,
    super.key,
  });

  final DailyQira dailyQira;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.hero),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.deepNavy, AppColors.teal],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _HeroTag(label: 'Daily Qira'),
              const Spacer(),
              Text(
                'AI has prepared today\'s practice.',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            '${dailyQira.surahName} · ${dailyQira.ayahLabel}',
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.aqua,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          // Arabic display: 34/52, primary artifact, right-aligned.
          Text(
            dailyQira.arabicText,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 34,
              height: 52 / 34,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            dailyQira.translation,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _HeroMetaChip(
                icon: Icons.schedule_outlined,
                label: '${dailyQira.estimatedMinutes} min',
              ),
              const _HeroMetaChip(
                icon: Icons.auto_awesome,
                label: 'Medium AI Confidence',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Icon(
                Icons.record_voice_over_outlined,
                size: 16,
                color: Colors.white.withValues(alpha: 0.7),
              ),
              const SizedBox(width: AppSpacing.xxs),
              Expanded(
                child: Text(
                  'Focus letter: ض. ${dailyQira.reciter}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
              FilledButton.icon(
                onPressed: onStart,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.aqua,
                  foregroundColor: AppColors.ink,
                ),
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Mulai'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroMetaChip extends StatelessWidget {
  const _HeroMetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.aqua),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  const _HeroTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
