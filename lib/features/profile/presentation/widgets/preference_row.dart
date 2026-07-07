import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/profile_summary.dart';

/// Lightweight preference row.
class PreferenceRow extends StatelessWidget {
  const PreferenceRow({required this.preference, super.key});

  final PreferenceItem preference;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Icon(_icon(preference.icon), color: AppColors.teal),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preference.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  preference.value,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          const Chip(label: Text('Edit')),
        ],
      ),
    );
  }

  IconData _icon(String value) {
    return switch (value) {
      'mic' => Icons.mic_none,
      'report' => Icons.summarize_outlined,
      _ => Icons.tune,
    };
  }
}
