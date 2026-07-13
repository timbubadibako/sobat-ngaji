import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// Search field for finding surah or ayah practice material.
class PracticeSearchBar extends StatelessWidget {
  const PracticeSearchBar({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceElevated,
      elevation: 2,
      shadowColor: AppColors.ink.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(AppRadius.medium),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Cari surah atau ayat',
          prefixIcon: Icon(Icons.search_rounded),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
