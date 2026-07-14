import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/weekly_insight.dart';

/// Letter mastery list that makes next practice obvious.
class LetterMasteryCard extends StatelessWidget {
  const LetterMasteryCard({
    required this.focusLetter,
    required this.mastery,
    super.key,
  });

  final String focusLetter;
  final List<LetterMastery> mastery;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Penguasaan huruf',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Chip(
                label: Text('Fokus $focusLetter'),
                backgroundColor: AppColors.warningSoft,
                side: const BorderSide(color: AppColors.warning),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final item in mastery)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: LetterMasteryBar(item: item),
            ),
        ],
      ),
    );
  }
}

/// Single letter mastery bar.
class LetterMasteryBar extends StatelessWidget {
  const LetterMasteryBar({required this.item, super.key});

  final LetterMastery item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 34,
          child: Text(
            item.letter,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              height: 34 / 26,
              color: AppColors.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: item.score / 100,
              minHeight: 10,
              backgroundColor: AppColors.surfaceMuted,
              valueColor: AlwaysStoppedAnimation(_barColor(item.score)),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text('${item.score}%'),
      ],
    );
  }

  Color _barColor(int score) {
    if (score >= 75) return AppColors.success;
    if (score >= 45) return AppColors.warning;
    return AppColors.error;
  }
}
