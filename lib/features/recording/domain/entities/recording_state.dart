/// Explicit recording lifecycle state.
class RecordingState {
  const RecordingState({
    required this.status,
    required this.events,
    this.sessionId,
    this.practiceId,
    this.startedAt,
    this.message,
  });

  const RecordingState.idle()
    : status = RecordingStatus.idle,
      events = const [],
      sessionId = null,
      practiceId = null,
      startedAt = null,
      message = null;

  final RecordingStatus status;
  final List<RecordingEvent> events;
  final String? sessionId;
  final String? practiceId;
  final DateTime? startedAt;
  final String? message;

  Duration get duration {
    final startedAt = this.startedAt;
    if (startedAt == null || status != RecordingStatus.recording) {
      return Duration.zero;
    }
    return DateTime.now().difference(startedAt);
  }

  RecordingState copyWith({
    RecordingStatus? status,
    List<RecordingEvent>? events,
    String? sessionId,
    String? practiceId,
    DateTime? startedAt,
    String? message,
  }) {
    return RecordingState(
      status: status ?? this.status,
      events: events ?? this.events,
      sessionId: sessionId ?? this.sessionId,
      practiceId: practiceId ?? this.practiceId,
      startedAt: startedAt ?? this.startedAt,
      message: message ?? this.message,
    );
  }
}

enum RecordingStatus {
  idle,
  permissionRequired,
  recording,
  paused,
  uploading,
  processing,
  completed,
  failed,
}

/// Realtime event surfaced by the recording WebSocket adapter.
class RecordingEvent {
  const RecordingEvent({
    required this.name,
    required this.description,
    required this.receivedAt,
  });

  final String name;
  final String description;
  final DateTime receivedAt;
}
