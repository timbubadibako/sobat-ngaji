import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/evaluation_result.dart';

/// Evaluation service abstraction for AI result events.
abstract interface class EvaluationService {
  Future<EvaluationResult> evaluate(String practiceId);
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
  return const MockEvaluationService();
});
