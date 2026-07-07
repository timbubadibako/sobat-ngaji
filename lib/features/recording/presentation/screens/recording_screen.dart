import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../features/practice/presentation/controllers/practice_controller.dart';
import '../../../../shared/widgets/state_views.dart';
import '../../domain/entities/recording_state.dart';
import '../controllers/recording_controller.dart';
import '../widgets/microphone_permission_card.dart';
import '../widgets/recording_panel.dart';
import '../widgets/realtime_event_list.dart';

/// Realtime recording screen backed by mock recorder and WebSocket adapter.
class RecordingScreen extends ConsumerWidget {
  const RecordingScreen({required this.practiceId, super.key});

  final String practiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(practiceItemProvider(practiceId));
    final recordingState = ref.watch(recordingControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: itemState.when(
          loading: () => const LoadingState(message: 'Menyiapkan rekaman...'),
          error: (error, _) => ErrorStateView(error: error),
          data: (item) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/practice/${item.id}'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Text(
                      'Recording',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const _SocketBadge(),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                item.arabicText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 34,
                  height: 52 / 34,
                  color: AppColors.ink,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${item.surahName} · ${item.ayahLabel} · ${item.focus}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              if (recordingState.status == RecordingStatus.permissionRequired)
                MicrophonePermissionCard(message: recordingState.message)
              else
                RecordingPanel(
                  state: recordingState,
                  onStart: () => ref
                      .read(recordingControllerProvider.notifier)
                      .start(item.id),
                  onStop: () =>
                      ref.read(recordingControllerProvider.notifier).stop(),
                  onRetry: () =>
                      ref.read(recordingControllerProvider.notifier).reset(),
                  onContinue: () => context.go('/evaluation/${item.id}'),
                ),
              const SizedBox(height: AppSpacing.md),
              RealtimeEventList(
                sessionId: recordingState.sessionId ?? 'session_pending',
                events: recordingState.events,
              ),
              const SizedBox(height: AppSpacing.md),
              const _AiListeningCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocketBadge extends StatelessWidget {
  const _SocketBadge();

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: const Text('WebSocket'),
      backgroundColor: AppColors.aqua.withValues(alpha: 0.18),
    );
  }
}

class _AiListeningCard extends StatelessWidget {
  const _AiListeningCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.aqua,
              child: Icon(Icons.auto_awesome, color: AppColors.ink),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'AI listening: jaga tempo tetap stabil. Evaluasi awal muncul setelah rekaman diproses.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
