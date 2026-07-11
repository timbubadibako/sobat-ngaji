import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../domain/entities/recording_state.dart';
import 'waveform.dart';

/// Main recording control panel with duration and retry/continue actions.
class RecordingPanel extends StatelessWidget {
  const RecordingPanel({
    required this.state,
    required this.onStart,
    required this.onStop,
    required this.onRetry,
    required this.onContinue,
    super.key,
  });

  final RecordingState state;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onRetry;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final status = state.status;
    final isRecording = status == RecordingStatus.recording;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            RecordingTimer(duration: state.duration),
            const SizedBox(height: AppSpacing.md),
            RecordButton(
              isRecording: isRecording,
              onPressed: isRecording ? onStop : onStart,
            ),
            const SizedBox(height: AppSpacing.md),
            Waveform(active: isRecording),
            const SizedBox(height: AppSpacing.md),
            Text(_statusLabel(status), textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.sm),
            if (status == RecordingStatus.completed)
              FilledButton.icon(
                onPressed: onContinue,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Lihat evaluasi awal'),
              )
            else if (status == RecordingStatus.failed)
              FilledButton.tonalIcon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba rekam ulang'),
              ),
          ],
        ),
      ),
    );
  }

  String _statusLabel(RecordingStatus status) {
    return switch (status) {
      RecordingStatus.idle => 'Dengarkan referensi, lalu mulai rekam.',
      RecordingStatus.permissionRequired => 'Izin mikrofon diperlukan.',
      RecordingStatus.recording => 'Merekam. Jaga tempo tetap stabil.',
      RecordingStatus.paused => 'Rekaman dijeda.',
      RecordingStatus.uploading => 'Mengirim audio...',
      RecordingStatus.processing => 'AI memproses evaluasi awal...',
      RecordingStatus.completed => 'Rekaman siap dievaluasi.',
      RecordingStatus.failed => 'Rekaman belum berhasil dibuat.',
    };
  }
}

/// Large record/stop button.
class RecordButton extends StatelessWidget {
  const RecordButton({
    required this.isRecording,
    required this.onPressed,
    super.key,
  });

  final bool isRecording;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size.square(88),
        backgroundColor: isRecording ? AppColors.error : AppColors.navy,
      ),
      child: Icon(isRecording ? Icons.stop : Icons.mic, size: 34),
    );
  }
}

/// Readable recording timer.
class RecordingTimer extends StatelessWidget {
  const RecordingTimer({required this.duration, super.key});

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Text(
      '$minutes:$seconds',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
