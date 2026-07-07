import 'package:flutter/material.dart';

/// Search field for finding surah or ayah practice material.
class PracticeSearchBar extends StatelessWidget {
  const PracticeSearchBar({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Cari surah atau ayat',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
