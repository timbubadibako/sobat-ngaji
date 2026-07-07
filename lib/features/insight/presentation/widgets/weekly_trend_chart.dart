import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';

/// Simple weekly trend bars with meaningful score progression.
class WeeklyTrendChart extends StatelessWidget {
  const WeeklyTrendChart({required this.values, super.key});

  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly trend', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final value in values)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: FractionallySizedBox(
                        heightFactor: value / 100,
                        alignment: Alignment.bottomCenter,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.cyan,
                            borderRadius: BorderRadius.circular(
                              AppRadius.small,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
