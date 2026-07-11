import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';

/// Audio metadata returned by backend upload endpoint.
class UploadedAudio {
  const UploadedAudio({
    required this.id,
    required this.sessionId,
    required this.audioUrl,
    required this.durationMs,
    required this.mimeType,
    required this.status,
  });

  final String id;
  final String sessionId;
  final String audioUrl;
  final int durationMs;
  final String mimeType;
  final String status;
}

/// Uploads recorded audio to FastAPI practice session endpoints.
class AudioUploadService {
  const AudioUploadService(this._client);

  final Dio _client;

  Future<UploadedAudio> uploadSimple({
    required String sessionId,
    required String filePath,
    required String mimeType,
    required int durationMs,
    required int sampleRate,
    required int channels,
    required String codec,
  }) async {
    try {
      final fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        'mimeType': mimeType,
        'durationMs': durationMs,
        'sampleRate': sampleRate,
        'channels': channels,
        'codec': codec,
      });

      final response = await _client.post<Map<String, dynamic>>(
        '/practice-sessions/$sessionId/audio',
        data: formData,
      );
      final audio = response.data?['audio'] as Map<String, dynamic>? ?? {};

      return UploadedAudio(
        id: audio['id'] as String? ?? '',
        sessionId: audio['sessionId'] as String? ?? sessionId,
        audioUrl: audio['audioUrl'] as String? ?? '',
        durationMs: audio['durationMs'] as int? ?? durationMs,
        mimeType: audio['mimeType'] as String? ?? mimeType,
        status: audio['status'] as String? ?? 'uploaded',
      );
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'audio_upload_failed',
        fallbackMessage: 'Audio belum berhasil dikirim. Coba unggah ulang.',
      );
    }
  }
}

final audioUploadServiceProvider = Provider<AudioUploadService>((ref) {
  return AudioUploadService(ref.watch(apiClientProvider));
});
