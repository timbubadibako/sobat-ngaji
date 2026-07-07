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
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Text(
              '${item.surahNumber}',
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.teal,
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
                  '${item.ayahLabel} · ${item.estimatedMinutes} min · ${item.focus}',
                  style: theme.textTheme.labelMedium,
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
