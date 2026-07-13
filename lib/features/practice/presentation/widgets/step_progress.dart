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
          final previousStep = index ~/ 2 + 1;
          final done = previousStep < currentStep;
          return Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: done ? AppColors.aqua : AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
          );
        }

        final step = index ~/ 2 + 1;
        final active = step <= currentStep;
        return Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? AppColors.aqua : AppColors.surfaceMuted,
          ),
          child: Text(
            '$step',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: active ? AppColors.navy : AppColors.muted,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      }),
    );
  }
}
