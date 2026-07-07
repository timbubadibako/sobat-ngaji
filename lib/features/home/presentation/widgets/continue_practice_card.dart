import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/home_summary.dart';

/// Lets the user resume their last practice item in one tap.
class ContinuePracticeCard extends StatelessWidget {
  const ContinuePracticeCard({
    required this.item,
    required this.onContinue,
    super.key,
  });

  final ContinuePractice item;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      onTap: onContinue,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: const Icon(Icons.play_arrow_rounded, color: AppColors.teal),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lanjutkan frasa terakhir',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  '${item.surahName} · ${item.ayahLabel}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Kecocokan terakhir ${item.lastMatch}%',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.teal),
        ],
      ),
    );
  }
}
