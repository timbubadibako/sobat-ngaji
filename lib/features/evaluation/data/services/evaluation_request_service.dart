import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';

/// Queued evaluation metadata returned after requesting ASR evaluation.
class QueuedEvaluation {
  const QueuedEvaluation({
    required this.resultId,
    required this.sessionId,
    required this.status,
  });

  final String resultId;
  final String sessionId;
  final String status;
}

/// Requests backend evaluation for an uploaded audio file.
class EvaluationRequestService {
  const EvaluationRequestService(this._client);

  final Dio _client;

  Future<QueuedEvaluation> requestEvaluation({
    required String sessionId,
    String? audioId,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/practice-sessions/$sessionId/evaluate',
        data: audioId == null
            ? const <String, dynamic>{}
            : <String, dynamic>{'audioId': audioId},
      );
      final evaluation =
          response.data?['evaluation'] as Map<String, dynamic>? ?? {};

      return QueuedEvaluation(
        resultId: evaluation['resultId'] as String? ?? '',
        sessionId: evaluation['sessionId'] as String? ?? sessionId,
        status: evaluation['status'] as String? ?? 'queued',
      );
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'evaluation_failed',
        fallbackMessage:
            'Evaluasi awal belum berhasil. Kamu bisa coba rekam ulang.',
      );
    }
  }
}

final evaluationRequestServiceProvider = Provider<EvaluationRequestService>((
  ref,
) {
  return EvaluationRequestService(ref.watch(apiClientProvider));
});
