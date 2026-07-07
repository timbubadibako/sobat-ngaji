import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/weekly_insight.dart';
import '../../domain/repositories/insight_repository.dart';

/// Mock-backed Insight repository until weekly API lands.
class InsightRepositoryImpl implements InsightRepository {
  const InsightRepositoryImpl();

  @override
  Future<WeeklyInsight> loadWeeklyInsight() async {
    try {
      // TODO(jrilym): Replace with GET /insights/weekly.
      await Future<void>.delayed(const Duration(milliseconds: 450));
      return const WeeklyInsight(
        practiceCount: 12,
        averageScore: 78,
        growthPercent: 9,
        focusLetter: 'ض',
        summary:
            'AI menemukan performa meningkat minggu ini, namun huruf ض masih sering perlu dicek.',
        trend: [62, 66, 71, 69, 74, 78, 82],
        letterMastery: [
          LetterMastery(letter: 'ب', score: 88, mistakeCount: 1),
          LetterMastery(letter: 'ت', score: 64, mistakeCount: 3),
          LetterMastery(letter: 'ث', score: 38, mistakeCount: 5),
          LetterMastery(letter: 'ض', score: 18, mistakeCount: 7),
        ],
        suggestion:
            'Latih Ad-Dhuha 5 menit dan ulangi frasa dengan tempo pelan.',
      );
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'insight_load_failed',
        message: 'Insight mingguan belum berhasil dimuat.',
      );
    }
  }
}

final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  return const InsightRepositoryImpl();
});
