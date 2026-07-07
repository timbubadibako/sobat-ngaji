import '../entities/recording_state.dart';

/// Boundary for recorder, session, upload, and realtime events.
abstract interface class RecordingRepository {
  Future<bool> requestMicrophonePermission();

  Future<String> createSession(String practiceId);

  Future<void> startRecorder(String sessionId);

  Future<void> stopRecorder(String sessionId);

  Stream<RecordingEvent> watchSession(String sessionId);
}
