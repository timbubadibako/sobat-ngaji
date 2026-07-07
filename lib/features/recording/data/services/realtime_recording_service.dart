import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/recording_state.dart';

/// WebSocket-like realtime adapter for recording session events.
abstract interface class RealtimeRecordingService {
  Stream<RecordingEvent> connect(String sessionId);
}

/// Mock WebSocket adapter that preserves final event semantics.
class MockRealtimeRecordingService implements RealtimeRecordingService {
  const MockRealtimeRecordingService();

  @override
  Stream<RecordingEvent> connect(String sessionId) async* {
    yield RecordingEvent(
      name: 'recording.started',
      description: 'Client event accepted',
      receivedAt: DateTime.now(),
    );
    await Future<void>.delayed(const Duration(milliseconds: 350));
    yield RecordingEvent(
      name: 'audio.streaming',
      description: 'Waveform samples received',
      receivedAt: DateTime.now(),
    );
    await Future<void>.delayed(const Duration(milliseconds: 350));
    yield RecordingEvent(
      name: 'evaluation.ready',
      description: 'AI queue prepared',
      receivedAt: DateTime.now(),
    );
  }
}

final realtimeRecordingServiceProvider = Provider<RealtimeRecordingService>((
  ref,
) {
  return const MockRealtimeRecordingService();
});
