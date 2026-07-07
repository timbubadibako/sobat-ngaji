import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/evaluation_result.dart';
import '../../domain/repositories/evaluation_repository.dart';
import '../services/evaluation_service.dart';

/// Repository that maps AI service errors to user-safe failures.
class EvaluationRepositoryImpl implements EvaluationRepository {
  const EvaluationRepositoryImpl({required this.evaluationService});

  final EvaluationService evaluationService;

  @override
  Future<EvaluationResult> loadResult(String practiceId) async {
    try {
      return await evaluationService.evaluate(practiceId);
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'evaluation_failed',
        message: 'Evaluasi awal belum berhasil. Kamu bisa coba rekam ulang.',
      );
    }
  }
}

final evaluationRepositoryProvider = Provider<EvaluationRepository>((ref) {
  return EvaluationRepositoryImpl(
    evaluationService: ref.watch(evaluationServiceProvider),
  );
});
