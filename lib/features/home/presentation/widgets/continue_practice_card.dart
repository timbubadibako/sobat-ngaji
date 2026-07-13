import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// Lets the user resume their last practice item in one tap.
class ContinuePracticeCard extends StatelessWidget {
  const ContinuePracticeCard({
    required this.item,
    required this.fallbackDailyQira,
    required this.onContinue,
    super.key,
  });

  final ContinuePractice? item;
  final DailyQira fallbackDailyQira;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeItem = item;
    final surahName = activeItem?.surahName ?? fallbackDailyQira.surahName;
    final ayahLabel = activeItem?.ayahLabel ?? fallbackDailyQira.ayahLabel;
    final match = activeItem?.lastMatch ?? 96;
    final cer = (100 - match).clamp(0, 100);

    return AppCard(
      onTap: onContinue,
      borderColor: AppColors.aqua.withValues(alpha: 0.28),
      elevation: 2,
      shadowColor: AppColors.ink.withValues(alpha: 0.14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.aqua, AppColors.cyan],
              ),
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: const Icon(Icons.menu_book_rounded, color: AppColors.navy),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(ayahLabel, style: theme.textTheme.labelMedium),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'CER $cer%       Kemiripan $match%',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.teal),
        ],
      ),
    );
  }
}
