import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/profile_summary.dart';
import '../../domain/repositories/profile_repository.dart';

/// Mock Profile repository until preferences storage/API lands.
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  @override
  Future<ProfileSummary> loadProfileSummary() async {
    try {
      // TODO(jrilym): Store preferences in Hive or backend profile API.
      await Future<void>.delayed(const Duration(milliseconds: 350));
      return const ProfileSummary(
        totalSessions: 42,
        averageScore: 78,
        focusLetter: 'ض',
        streakDays: 7,
        learningSummary:
            'AI menemukan latihanmu paling stabil di pagi hari. Target berikutnya: 5 menit Ad-Dhuha.',
        preferences: [
          PreferenceItem(
            title: 'Practice level',
            value: 'Beginner, phrases',
            icon: 'tune',
          ),
          PreferenceItem(
            title: 'Audio feedback',
            value: 'Reference recording on',
            icon: 'mic',
          ),
          PreferenceItem(
            title: 'Daily report',
            value: 'Weekly Sunday',
            icon: 'report',
          ),
        ],
        achievement: 'Menyelesaikan Daily Qira dengan kecocokan 82%.',
      );
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'profile_load_failed',
        message: 'Profile belum berhasil dimuat.',
      );
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return const ProfileRepositoryImpl();
});
