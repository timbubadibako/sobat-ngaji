import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// Pill filter chip for Practice categories.
class PracticeFilterChip extends StatelessWidget {
  const PracticeFilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      selectedColor: AppColors.navy,
      backgroundColor: AppColors.surfaceMuted,
      labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: selected ? AppColors.surfaceElevated : AppColors.navy,
        fontWeight: FontWeight.w800,
      ),
      side: BorderSide(color: selected ? AppColors.navy : AppColors.line),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }
}
