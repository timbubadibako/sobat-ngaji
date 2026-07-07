import '../entities/weekly_insight.dart';

/// Boundary for weekly learning insight.
abstract interface class InsightRepository {
  Future<WeeklyInsight> loadWeeklyInsight();
}
