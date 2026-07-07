import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/features/insight/data/repositories/insight_repository_impl.dart';

void main() {
  test(
    'InsightRepositoryImpl returns weekly insight with next practice',
    () async {
      const repository = InsightRepositoryImpl();

      final insight = await repository.loadWeeklyInsight();

      expect(insight.averageScore, 78);
      expect(insight.focusLetter, 'ض');
      expect(insight.suggestion, contains('Ad-Dhuha'));
    },
  );
}
