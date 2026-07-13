import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Standard surface card with 18 radius per UIGuideline.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.sm),
    this.color = AppColors.surfaceElevated,
    this.borderColor,
    this.elevation = 0,
    this.shadowColor,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color? borderColor;
  final double elevation;
  final Color? shadowColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.card);
    return Material(
      elevation: elevation,
      shadowColor: shadowColor,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: borderColor == null
            ? BorderSide.none
            : BorderSide(color: borderColor!),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

/// Section title with optional trailing action, used above content groups.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}
