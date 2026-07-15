import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/profile_summary.dart';
import '../../domain/repositories/profile_repository.dart';

/// Backend-backed Profile repository.
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._client);

  final Dio _client;

  @override
  Future<ProfileSummary> loadProfileSummary() async {
    if (AppConfig.mockDataEnabled) {
      return _mockProfileSummary();
    }

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

  ProfileSummary _mockProfileSummary() {
    return const ProfileSummary(
      totalSessions: 24,
      averageScore: 87,
      focusLetter: 'ض',
      streakDays: 7,
      learningSummary:
          'Pertahankan latihan pendek harian. Fokus minggu ini adalah tempo dan makhraj ض.',
      preferences: [
        PreferenceItem(
          title: 'Practice level',
          value: 'beginner, phrases',
          icon: 'tune',
        ),
        PreferenceItem(
          title: 'Audio feedback',
          value: 'Reference recording on',
          icon: 'mic',
        ),
        PreferenceItem(
          title: 'Daily report',
          value: 'weekly_sunday',
          icon: 'report',
        ),
      ],
      achievement: 'Streak 7 hari aktif. Lanjutkan satu sesi pendek hari ini.',
    );
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.watch(apiClientProvider));
});
