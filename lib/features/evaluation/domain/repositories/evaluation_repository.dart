import '../entities/evaluation_result.dart';

/// Boundary for AI evaluation result retrieval.
abstract interface class EvaluationRepository {
  Future<EvaluationResult> loadResult(String practiceId);
}
