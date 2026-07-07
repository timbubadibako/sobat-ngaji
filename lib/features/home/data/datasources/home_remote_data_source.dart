import 'dart:async';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/home_summary.dart';

/// Remote data source contract for the Home dashboard payload.
abstract interface class HomeRemoteDataSource {
  Future<HomeSummary> fetchHomeSummary({String? userName});
}

/// Mock Home API used until the backend is available.
///
/// Returns a contract-identical payload so the repository and UI need no
/// changes when the real endpoint lands.
class MockHomeRemoteDataSource implements HomeRemoteDataSource {
  const MockHomeRemoteDataSource();

  @override
  Future<HomeSummary> fetchHomeSummary({String? userName}) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final displayName = userName?.trim().isEmpty ?? true
        ? 'Sobat'
        : userName!.trim();

    // TODO(jrilym): Source Daily Qira and recommendation from backend contract.
    return HomeSummary(
      dailyQira: const DailyQira(
        id: 'daily_ad_dhuha_1',
        surahName: 'Ad-Dhuha',
        ayahLabel: 'Ayat 1',
        arabicText: 'وَالضُّحَىٰ',
        translation: 'Demi waktu duha.',
        reciter: 'Syaikh Mishary Rashid',
        estimatedMinutes: 5,
      ),
      greeting: AiGreeting(
        headline: 'Assalamualaikum, $displayName.',
        message:
            'AI menemukan progresmu naik pelan-pelan. Fokus hari ini huruf ض. '
            'Dengarkan referensi sekali, lalu rekam '
            'bacaanmu dengan tempo lebih tenang.',
      ),
      weeklySnapshot: const WeeklySnapshot(
        sessionsDone: 5,
        sessionsTarget: 7,
        averageMatch: 84,
        streakDays: 4,
      ),
      continuePractice: const ContinuePractice(
        practiceId: 'al_fatihah_1',
        surahName: 'Al-Fatihah',
        ayahLabel: 'Frasa 1 dari 3',
        lastMatch: 78,
      ),
      recommendation: const AiRecommendation(
        practiceId: 'ad_dhuha_1',
        title: 'Latih Surah Ad-Dhuha',
        reason:
            'Kami menyarankan latihan ini untuk memperkuat pengucapan huruf ض '
            'dan menjaga tempo tetap stabil.',
      ),
    );
  }
}

/// Alternate mock that simulates a first-time user with no history yet.
class EmptyHomeRemoteDataSource implements HomeRemoteDataSource {
  const EmptyHomeRemoteDataSource();

  @override
  Future<HomeSummary> fetchHomeSummary({String? userName}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    throw const AppFailure(
      code: 'home_empty',
      message: 'Belum ada ringkasan latihan. Mulai Daily Qira pertamamu.',
    );
  }
}
