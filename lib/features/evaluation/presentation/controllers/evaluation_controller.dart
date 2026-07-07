import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/evaluation_repository_impl.dart';
import '../../domain/entities/evaluation_result.dart';

final evaluationResultProvider =
    FutureProvider.family<EvaluationResult, String>((ref, practiceId) {
      return ref.watch(evaluationRepositoryProvider).loadResult(practiceId);
    });
