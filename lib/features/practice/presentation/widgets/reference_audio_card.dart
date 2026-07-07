import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/practice_item.dart';

/// Reference audio control kept close to the Arabic text.
class ReferenceAudioCard extends StatelessWidget {
  const ReferenceAudioCard({
    required this.item,
    required this.isLoading,
    required this.onPlay,
    super.key,
  });

  final PracticeItem item;
  final bool isLoading;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        children: [
          FilledButton.tonalIcon(
            onPressed: isLoading ? null : onPlay,
            icon: isLoading
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.play_arrow_rounded),
            label: const Text('Dengar referensi'),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'Referensi ${item.surahName} · ${item.ayahLabel}',
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
