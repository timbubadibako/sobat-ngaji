import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/practice_item.dart';

/// Tappable practice material row.
class PracticeCard extends StatelessWidget {
  const PracticeCard({required this.item, required this.onTap, super.key});

  final PracticeItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: onTap,
      borderColor: AppColors.line,
      elevation: 1,
      shadowColor: AppColors.ink.withValues(alpha: 0.10),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.aqua.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Text(
              '${item.surahNumber}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.teal,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.surahName, style: theme.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  '${item.ayahLabel} · ${item.level.toLowerCase()} · ${item.estimatedMinutes} min',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            item.arabicName,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 22,
              height: 34 / 22,
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
