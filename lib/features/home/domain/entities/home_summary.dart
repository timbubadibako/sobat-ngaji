import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_summary.freezed.dart';
part 'home_summary.g.dart';

/// The Daily Qira hero: the single most important practice entry point on Home.
@freezed
abstract class DailyQira with _$DailyQira {
  const factory DailyQira({
    required String id,
    required String surahName,
    required String ayahLabel,
    required String arabicText,
    required String translation,
    required String reciter,
    required int estimatedMinutes,
  }) = _DailyQira;

  factory DailyQira.fromJson(Map<String, dynamic> json) =>
      _$DailyQiraFromJson(json);
}

/// Personalized AI greeting shown near the top of Home.
@freezed
abstract class AiGreeting with _$AiGreeting {
  const factory AiGreeting({
    required String headline,
    required String message,
  }) = _AiGreeting;

  factory AiGreeting.fromJson(Map<String, dynamic> json) =>
      _$AiGreetingFromJson(json);
}

/// A calm weekly snapshot: not a dashboard, just orientation.
@freezed
abstract class WeeklySnapshot with _$WeeklySnapshot {
  const factory WeeklySnapshot({
    required int sessionsDone,
    required int sessionsTarget,
    required int averageMatch,
    required int streakDays,
  }) = _WeeklySnapshot;

  factory WeeklySnapshot.fromJson(Map<String, dynamic> json) =>
      _$WeeklySnapshotFromJson(json);
}

/// Card that lets the user resume their last practice item.
@freezed
abstract class ContinuePractice with _$ContinuePractice {
  const factory ContinuePractice({
    required String practiceId,
    required String surahName,
    required String ayahLabel,
    required int lastMatch,
  }) = _ContinuePractice;

  factory ContinuePractice.fromJson(Map<String, dynamic> json) =>
      _$ContinuePracticeFromJson(json);
}

/// AI recommendation preview: what to practice next and why.
@freezed
abstract class AiRecommendation with _$AiRecommendation {
  const factory AiRecommendation({
    required String practiceId,
    required String title,
    required String reason,
  }) = _AiRecommendation;

  factory AiRecommendation.fromJson(Map<String, dynamic> json) =>
      _$AiRecommendationFromJson(json);
}

/// Aggregated Home payload delivered as a single unit to the presentation layer.
@freezed
abstract class HomeSummary with _$HomeSummary {
  const factory HomeSummary({
    required DailyQira dailyQira,
    required AiGreeting greeting,
    required WeeklySnapshot weeklySnapshot,
    ContinuePractice? continuePractice,
    AiRecommendation? recommendation,
  }) = _HomeSummary;

  factory HomeSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryFromJson(json);
}
