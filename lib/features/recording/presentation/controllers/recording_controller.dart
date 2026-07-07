import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/recording_repository_impl.dart';
import '../../domain/entities/recording_state.dart';

/// Orchestrates recording lifecycle through repository and realtime service.
class RecordingController extends Notifier<RecordingState> {
  StreamSubscription<RecordingEvent>? _eventSubscription;

  @override
  RecordingState build() {
    ref.onDispose(() => _eventSubscription?.cancel());
    return const RecordingState.idle();
  }

  Future<void> start(String practiceId) async {
    final repository = ref.read(recordingRepositoryProvider);
    final granted = await repository.requestMicrophonePermission();
    if (!granted) {
      state = state.copyWith(
        status: RecordingStatus.permissionRequired,
        message: 'Izin mikrofon belum aktif. Aktifkan untuk mulai merekam.',
      );
      return;
    }

    final sessionId = await repository.createSession(practiceId);
    await repository.startRecorder(sessionId);
    state = RecordingState(
      status: RecordingStatus.recording,
      events: const [],
      sessionId: sessionId,
      practiceId: practiceId,
      startedAt: DateTime.now(),
    );

    await _eventSubscription?.cancel();
    _eventSubscription = repository.watchSession(sessionId).listen((event) {
      state = state.copyWith(events: [...state.events, event]);
    });
  }

  Future<void> stop() async {
    final sessionId = state.sessionId;
    if (sessionId == null) {
      return;
    }

    final repository = ref.read(recordingRepositoryProvider);
    state = state.copyWith(status: RecordingStatus.uploading);
    await repository.stopRecorder(sessionId);
    await Future<void>.delayed(const Duration(milliseconds: 450));
    state = state.copyWith(status: RecordingStatus.processing);
    await Future<void>.delayed(const Duration(milliseconds: 650));
    state = state.copyWith(status: RecordingStatus.completed);
  }

  void reset() {
    _eventSubscription?.cancel();
    state = const RecordingState.idle();
  }
}

final recordingControllerProvider =
    NotifierProvider<RecordingController, RecordingState>(
      RecordingController.new,
    );
