import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// Lightweight waveform visualization for mock recording feedback.
class Waveform extends StatelessWidget {
  const Waveform({required this.active, super.key});

  final bool active;

  static const _heights = [18.0, 34.0, 22.0, 44.0, 28.0, 40.0, 20.0, 48.0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final height in _heights)
            AnimatedContainer(
              duration: AppMotion.normal,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 6,
              height: active ? height : 14,
              decoration: BoxDecoration(
                color: active ? AppColors.cyan : AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
        ],
      ),
    );
  }
}
