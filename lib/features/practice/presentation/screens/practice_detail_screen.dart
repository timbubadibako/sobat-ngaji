import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/state_views.dart';
import '../controllers/practice_controller.dart';
import '../controllers/reference_audio_controller.dart';
import '../widgets/ayah_card.dart';
import '../widgets/reference_audio_card.dart';

/// Practice detail before the recording sprint begins.
class PracticeDetailScreen extends ConsumerWidget {
  const PracticeDetailScreen({required this.practiceId, super.key});

  final String practiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(practiceItemProvider(practiceId));
    final audioState = ref.watch(referenceAudioControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: itemState.when(
          loading: () => const LoadingState(message: 'Membuka latihan...'),
          error: (error, _) => ErrorStateView(error: error),
          data: (item) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/practice'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Text(
                      item.surahName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AyahCard(item: item),
              const SizedBox(height: AppSpacing.md),
              ReferenceAudioCard(
                item: item,
                isLoading: audioState.isLoading,
                onPlay: () => ref
                    .read(referenceAudioControllerProvider.notifier)
                    .play(item.referenceAudioUrl),
              ),
              const SizedBox(height: AppSpacing.md),
              FilledButton.icon(
                onPressed: () => context.go('/recording/${item.id}'),
                icon: const Icon(Icons.mic),
                label: const Text('Mulai rekam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
