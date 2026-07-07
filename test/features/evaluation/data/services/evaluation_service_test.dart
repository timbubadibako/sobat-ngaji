import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/features/evaluation/data/services/evaluation_service.dart';
import 'package:sobat_ngaji/features/evaluation/domain/entities/evaluation_result.dart';

void main() {
  test('MockEvaluationService returns final evaluation contract', () async {
    const service = MockEvaluationService();

    final result = await service.evaluate('ad_dhuha_1');

    expect(result.matchScore, 82);
    expect(result.confidenceLevel, 'Medium');
    expect(result.highlights.first.status, HighlightStatus.read);
    expect(result.events, contains('evaluation.completed'));
  });
}
