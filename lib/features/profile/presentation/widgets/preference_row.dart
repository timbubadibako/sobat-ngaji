import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/profile_summary.dart';

/// Single profile preference row.
class PreferenceRow extends StatelessWidget {
  const PreferenceRow({required this.preference, super.key});

  final PreferenceItem preference;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.08),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.aqua.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Icon(_icon(preference.icon), color: AppColors.teal),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preference.title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  preference.value,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.muted),
        ],
      ),
    );
  }

  IconData _icon(String name) {
    return switch (name) {
      'mic' => Icons.mic_none,
      'report' => Icons.summarize_outlined,
      'language' => Icons.translate,
      _ => Icons.tune,
    };
  }
}
