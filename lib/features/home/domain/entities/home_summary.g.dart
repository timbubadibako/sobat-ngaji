// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyQira _$DailyQiraFromJson(Map<String, dynamic> json) => _DailyQira(
  id: json['id'] as String,
  surahName: json['surahName'] as String,
  ayahLabel: json['ayahLabel'] as String,
  arabicText: json['arabicText'] as String,
  translation: json['translation'] as String,
  reciter: json['reciter'] as String,
  estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
);

Map<String, dynamic> _$DailyQiraToJson(_DailyQira instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surahName': instance.surahName,
      'ayahLabel': instance.ayahLabel,
      'arabicText': instance.arabicText,
      'translation': instance.translation,
      'reciter': instance.reciter,
      'estimatedMinutes': instance.estimatedMinutes,
    };

_AiGreeting _$AiGreetingFromJson(Map<String, dynamic> json) => _AiGreeting(
  headline: json['headline'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$AiGreetingToJson(_AiGreeting instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'message': instance.message,
    };

_WeeklySnapshot _$WeeklySnapshotFromJson(Map<String, dynamic> json) =>
    _WeeklySnapshot(
      sessionsDone: (json['sessionsDone'] as num).toInt(),
      sessionsTarget: (json['sessionsTarget'] as num).toInt(),
      averageMatch: (json['averageMatch'] as num).toInt(),
      streakDays: (json['streakDays'] as num).toInt(),
    );

Map<String, dynamic> _$WeeklySnapshotToJson(_WeeklySnapshot instance) =>
    <String, dynamic>{
      'sessionsDone': instance.sessionsDone,
      'sessionsTarget': instance.sessionsTarget,
      'averageMatch': instance.averageMatch,
      'streakDays': instance.streakDays,
    };

_ContinuePractice _$ContinuePracticeFromJson(Map<String, dynamic> json) =>
    _ContinuePractice(
      practiceId: json['practiceId'] as String,
      surahName: json['surahName'] as String,
      ayahLabel: json['ayahLabel'] as String,
      lastMatch: (json['lastMatch'] as num).toInt(),
    );

Map<String, dynamic> _$ContinuePracticeToJson(_ContinuePractice instance) =>
    <String, dynamic>{
      'practiceId': instance.practiceId,
      'surahName': instance.surahName,
      'ayahLabel': instance.ayahLabel,
      'lastMatch': instance.lastMatch,
    };

_AiRecommendation _$AiRecommendationFromJson(Map<String, dynamic> json) =>
    _AiRecommendation(
      practiceId: json['practiceId'] as String,
      title: json['title'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$AiRecommendationToJson(_AiRecommendation instance) =>
    <String, dynamic>{
      'practiceId': instance.practiceId,
      'title': instance.title,
      'reason': instance.reason,
    };

_HomeSummary _$HomeSummaryFromJson(Map<String, dynamic> json) => _HomeSummary(
  dailyQira: DailyQira.fromJson(json['dailyQira'] as Map<String, dynamic>),
  greeting: AiGreeting.fromJson(json['greeting'] as Map<String, dynamic>),
  weeklySnapshot: WeeklySnapshot.fromJson(
    json['weeklySnapshot'] as Map<String, dynamic>,
  ),
  continuePractice: json['continuePractice'] == null
      ? null
      : ContinuePractice.fromJson(
          json['continuePractice'] as Map<String, dynamic>,
        ),
  recommendation: json['recommendation'] == null
      ? null
      : AiRecommendation.fromJson(
          json['recommendation'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HomeSummaryToJson(_HomeSummary instance) =>
    <String, dynamic>{
      'dailyQira': instance.dailyQira,
      'greeting': instance.greeting,
      'weeklySnapshot': instance.weeklySnapshot,
      'continuePractice': instance.continuePractice,
      'recommendation': instance.recommendation,
    };
