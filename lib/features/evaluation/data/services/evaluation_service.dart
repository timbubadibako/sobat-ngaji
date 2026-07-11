import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../domain/entities/evaluation_result.dart';

/// Evaluation service abstraction for AI result events.
abstract interface class EvaluationService {
  Future<EvaluationResult> evaluate(String practiceId);
}

/// FastAPI-backed evaluation result reader.
///
/// The argument is a backend `resultId`. The current screen still passes
/// `practiceId`, so this class is wired after recording stores `resultId`.
class BackendEvaluationService implements EvaluationService {
  const BackendEvaluationService(this._client);

  final Dio _client;

  @override
  Future<EvaluationResult> evaluate(String resultId) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/evaluation-results/$resultId',
      );
      final result = response.data?['result'] as Map<String, dynamic>? ?? {};
      return _resultFromJson(result);
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'evaluation_failed',
        fallbackMessage:
            'Evaluasi awal belum berhasil. Kamu bisa coba rekam ulang.',
      );
    }
  }

  EvaluationResult _resultFromJson(Map<String, dynamic> json) {
    final highlights = json['highlights'] as List<dynamic>? ?? const [];
    final letterInsights = json['letterInsights'] as List<dynamic>? ?? const [];

    return EvaluationResult(
      resultId: json['resultId'] as String? ?? '',
      practiceId: json['practiceItemId'] as String? ?? '',
      matchScore: json['matchScore'] as int? ?? 0,
      confidenceLevel: json['confidenceLevel'] as String? ?? 'low',
      summary: json['summary'] as String? ?? '',
      recommendation: json['recommendation'] as String? ?? '',
      highlights: highlights.whereType<Map<String, dynamic>>().map((item) {
        return HighlightSegment(
          segment: item['segment'] as String? ?? '',
          status: _highlightStatus(item['status'] as String?),
          note: item['note'] as String? ?? '',
        );
      }).toList(),
      letterInsights: letterInsights.whereType<Map<String, dynamic>>().map((
        item,
      ) {
        return LetterInsight(
          letter: item['letter'] as String? ?? '',
          masteryScore: item['masteryScore'] as int? ?? 0,
          mistakeCount: item['mistakeCount'] as int? ?? 0,
        );
      }).toList(),
      events: const [],
    );
  }

  HighlightStatus _highlightStatus(String? status) {
    return switch (status) {
      'read' => HighlightStatus.read,
      'current' => HighlightStatus.current,
      'needs_check' => HighlightStatus.needsCheck,
      'needs_retry' => HighlightStatus.needsRetry,
      _ => HighlightStatus.needsCheck,
    };
  }
}

/// Mock evaluation service using the final result contract.
class MockEvaluationService implements EvaluationService {
  const MockEvaluationService();

  @override
  Future<EvaluationResult> evaluate(String practiceId) async {
    // TODO(jrilym): Replace with WebSocket-backed evaluation.completed result.
    await Future<void>.delayed(const Duration(milliseconds: 700));

    return EvaluationResult(
      resultId: 'result_$practiceId',
      practiceId: practiceId,
      matchScore: 82,
      confidenceLevel: 'Medium',
      summary:
          'Evaluasi awal menunjukkan bacaan cukup stabil. AI menemukan bagian yang perlu dicek pada pelafalan ض.',
      recommendation:
          'Coba ulangi bagian ini dengan tempo lebih pelan dan dengarkan referensi sekali sebelum merekam.',
      highlights: const [
        HighlightSegment(
          segment: 'وَ',
          status: HighlightStatus.read,
          note: 'Terbaca baik.',
        ),
        HighlightSegment(
          segment: 'الضُّ',
          status: HighlightStatus.needsCheck,
          note: 'Perlu dicek pada huruf ض.',
        ),
        HighlightSegment(
          segment: 'حَىٰ',
          status: HighlightStatus.current,
          note: 'Jaga panjang bacaan.',
        ),
      ],
      letterInsights: const [
        LetterInsight(letter: 'ض', masteryScore: 42, mistakeCount: 3),
        LetterInsight(letter: 'ح', masteryScore: 76, mistakeCount: 1),
      ],
      events: const [
        'audio.uploaded',
        'evaluation.processing',
        'evaluation.completed',
      ],
    );
  }
}

final evaluationServiceProvider = Provider<EvaluationService>((ref) {
  // TODO(jrilym): Switch to BackendEvaluationService after recording flow
  // stores backend resultId instead of navigating with practiceId.
  return const MockEvaluationService();
});
