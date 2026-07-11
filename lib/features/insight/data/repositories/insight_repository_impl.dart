import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/weekly_insight.dart';
import '../../domain/repositories/insight_repository.dart';

/// Backend-backed Insight repository.
class InsightRepositoryImpl implements InsightRepository {
  const InsightRepositoryImpl([this._client]);

  final Dio? _client;

  @override
  Future<WeeklyInsight> loadWeeklyInsight() async {
    try {
      final client = _client;
      if (client == null) {
        return _mockWeeklyInsight();
      }

      final response = await client.get<Map<String, dynamic>>(
        '/insights/weekly',
      );
      final weeklyInsight =
          response.data?['weeklyInsight'] as Map<String, dynamic>? ?? const {};
      return _weeklyInsightFromJson(weeklyInsight);
    } on AppFailure {
      rethrow;
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'insight_load_failed',
        fallbackMessage: 'Insight mingguan belum berhasil dimuat.',
      );
    }
  }

  WeeklyInsight _weeklyInsightFromJson(Map<String, dynamic> json) {
    final trend = json['trend'] as List<dynamic>? ?? const [];
    final letterMastery = json['letterMastery'] as List<dynamic>? ?? const [];

    return WeeklyInsight(
      practiceCount: json['practiceCount'] as int? ?? 0,
      averageScore: json['averageScore'] as int? ?? 0,
      growthPercent: json['growthPercent'] as int? ?? 0,
      focusLetter: json['focusLetter'] as String? ?? '-',
      summary: json['summary'] as String? ?? '',
      trend: trend.whereType<int>().toList(),
      letterMastery: letterMastery.whereType<Map<String, dynamic>>().map((
        item,
      ) {
        return LetterMastery(
          letter: item['letter'] as String? ?? '',
          score: item['score'] as int? ?? 0,
          mistakeCount: item['mistakeCount'] as int? ?? 0,
        );
      }).toList(),
      suggestion: json['suggestion'] as String? ?? '',
    );
  }

  WeeklyInsight _mockWeeklyInsight() {
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
      suggestion: 'Latih Ad-Dhuha 5 menit dan ulangi frasa dengan tempo pelan.',
    );
  }
}

final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  return InsightRepositoryImpl(ref.watch(apiClientProvider));
});
