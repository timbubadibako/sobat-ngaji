import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Shared Aqua AI screen background for top-level learning flow screens.
class AquaScreenScaffold extends StatelessWidget {
  const AquaScreenScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.92, -1),
            radius: 0.9,
            colors: [
              AppColors.cyan.withValues(alpha: 0.16),
              AppColors.surface.withValues(alpha: 0),
            ],
            stops: const [0, 1],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.92, -0.86),
              radius: 0.85,
              colors: [
                AppColors.aqua.withValues(alpha: 0.18),
                AppColors.surface.withValues(alpha: 0),
              ],
              stops: const [0, 1],
            ),
          ),
          child: SafeArea(child: child),
        ),
      ),
    );
  }
}
