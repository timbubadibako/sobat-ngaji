import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Lightweight skeleton shimmer for async screen placeholders.
class ShimmerSkeleton extends StatefulWidget {
  const ShimmerSkeleton({
    required this.child,
    this.baseColor = AppColors.surfaceMuted,
    this.highlightColor = AppColors.surfaceElevated,
    super.key,
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  @override
  State<ShimmerSkeleton> createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<ShimmerSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppMotion.slow * 3, vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    if (reduceMotion) {
      return _SkeletonScope(
        gradient: LinearGradient(colors: [widget.baseColor, widget.baseColor]),
        child: widget.child,
      );
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final slide = _controller.value * 2 - 1;

        return _SkeletonScope(
          gradient: LinearGradient(
            begin: Alignment(-1 + slide, -0.35),
            end: Alignment(1 + slide, 0.35),
            colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
            stops: const [0.24, 0.5, 0.76],
          ),
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    this.width,
    this.height = 14,
    this.radius = AppRadius.small,
    super.key,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final gradient = _SkeletonScope.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: gradient,
      ),
      child: SizedBox(width: width, height: height),
    );
  }
}

class _SkeletonScope extends InheritedWidget {
  const _SkeletonScope({required this.gradient, required super.child});

  final Gradient gradient;

  static Gradient of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_SkeletonScope>()!
        .gradient;
  }

  @override
  bool updateShouldNotify(_SkeletonScope oldWidget) {
    return gradient != oldWidget.gradient;
  }
}
