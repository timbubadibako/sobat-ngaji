import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/recording_state.dart';
import '../../domain/repositories/recording_repository.dart';
import '../services/audio_recorder_service.dart';
import '../services/realtime_recording_service.dart';

/// Coordinates recorder lifecycle and realtime session events.
class RecordingRepositoryImpl implements RecordingRepository {
  const RecordingRepositoryImpl({
    required this.audioRecorderService,
    required this.realtimeRecordingService,
  });

  final AudioRecorderService audioRecorderService;
  final RealtimeRecordingService realtimeRecordingService;

  @override
  Future<bool> requestMicrophonePermission() {
    return audioRecorderService.requestPermission();
  }

  @override
  Future<String> createSession(String practiceId) async {
    // TODO(jrilym): Replace with POST /practice-sessions.
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return 'session_${practiceId}_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<void> startRecorder(String sessionId) {
    return audioRecorderService.start(sessionId);
  }

  @override
  Future<void> stopRecorder(String sessionId) {
    return audioRecorderService.stop(sessionId);
  }

  @override
  Stream<RecordingEvent> watchSession(String sessionId) {
    return realtimeRecordingService.connect(sessionId);
  }
}

final recordingRepositoryProvider = Provider<RecordingRepository>((ref) {
  return RecordingRepositoryImpl(
    audioRecorderService: ref.watch(audioRecorderServiceProvider),
    realtimeRecordingService: ref.watch(realtimeRecordingServiceProvider),
  );
});
