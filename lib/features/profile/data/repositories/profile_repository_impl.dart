import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/profile_summary.dart';
import '../../domain/repositories/profile_repository.dart';

/// Backend-backed Profile repository.
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._client);

  final Dio _client;

  @override
  Future<ProfileSummary> loadProfileSummary() async {
    try {
      final response = await _client.get<Map<String, dynamic>>('/profile');
      return _profileFromJson(response.data ?? const {});
    } on AppFailure {
      rethrow;
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'profile_load_failed',
        fallbackMessage: 'Profile belum berhasil dimuat.',
      );
    }
  }

  ProfileSummary _profileFromJson(Map<String, dynamic> json) {
    final summary = json['summary'] as Map<String, dynamic>? ?? const {};
    final preferences =
        json['preferences'] as Map<String, dynamic>? ?? const {};

    return ProfileSummary(
      totalSessions: summary['totalSessions'] as int? ?? 0,
      averageScore: summary['averageScore'] as int? ?? 0,
      focusLetter: summary['focusLetter'] as String? ?? '-',
      streakDays: summary['streakDays'] as int? ?? 0,
      learningSummary: summary['learningSummary'] as String? ?? '',
      preferences: _preferenceItems(preferences),
      achievement: summary['achievement'] as String? ?? '',
    );
  }

  List<PreferenceItem> _preferenceItems(Map<String, dynamic> preferences) {
    return [
      PreferenceItem(
        title: 'Practice level',
        value:
            '${preferences['practiceLevel'] ?? 'beginner'}, '
            '${preferences['practiceMode'] ?? 'phrases'}',
        icon: 'tune',
      ),
      PreferenceItem(
        title: 'Audio feedback',
        value: preferences['audioFeedbackEnabled'] == true
            ? 'Reference recording on'
            : 'Reference recording off',
        icon: 'mic',
      ),
      PreferenceItem(
        title: 'Daily report',
        value:
            preferences['dailyReportFrequency'] as String? ?? 'weekly_sunday',
        icon: 'report',
      ),
    ];
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.watch(apiClientProvider));
});
