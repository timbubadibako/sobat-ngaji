import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/recording_state.dart';
import '../../domain/repositories/recording_repository.dart';
import '../services/audio_recorder_service.dart';
import '../services/realtime_recording_service.dart';

/// Coordinates recorder lifecycle and realtime session events.
class RecordingRepositoryImpl implements RecordingRepository {
  const RecordingRepositoryImpl({
    required this.audioRecorderService,
    required this.realtimeRecordingService,
    required this.client,
  });

  final AudioRecorderService audioRecorderService;
  final RealtimeRecordingService realtimeRecordingService;
  final Dio client;

  @override
  Future<bool> requestMicrophonePermission() {
    return audioRecorderService.requestPermission();
  }

  @override
  Future<String> createSession(String practiceId) async {
    if (AppConfig.mockDataEnabled) {
      return 'mock_session_$practiceId';
    }

    try {
      final response = await client.post<Map<String, dynamic>>(
        '/practice-sessions',
        data: {
          'practiceItemId': practiceId,
          'clientSessionId':
              'client_${practiceId}_${DateTime.now().millisecondsSinceEpoch}',
          'device': {
            'platform': defaultTargetPlatform.name,
            'model': 'flutter',
            'appVersion': '0.1.0',
          },
        },
      );
      final session = response.data?['session'] as Map<String, dynamic>? ?? {};
      return session['id'] as String;
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'session_create_failed',
        fallbackMessage: 'Sesi latihan belum berhasil dibuat.',
      );
    }
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
    client: ref.watch(apiClientProvider),
  );
});
