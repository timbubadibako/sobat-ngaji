import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';

/// Recent achievement card.
class AchievementCard extends StatelessWidget {
  const AchievementCard({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.warning.withValues(alpha: 0.42),
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.08),
      child: Row(
        children: [
          const Icon(Icons.emoji_events_outlined, color: AppColors.warning),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
