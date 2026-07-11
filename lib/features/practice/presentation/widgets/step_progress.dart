import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// Compact step indicator for listen, record, evaluate, review.
class StepProgress extends StatelessWidget {
  const StepProgress({
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index.isOdd) {
          return const Expanded(
            child: Divider(thickness: 2, color: AppColors.surfaceMuted),
          );
        }

        final step = index ~/ 2 + 1;
        final active = step <= currentStep;
        return CircleAvatar(
          radius: 14,
          backgroundColor: active ? AppColors.teal : AppColors.surfaceMuted,
          child: Text(
            '$step',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: active ? AppColors.surfaceElevated : AppColors.ink,
            ),
          ),
        );
      }),
    );
  }
}
