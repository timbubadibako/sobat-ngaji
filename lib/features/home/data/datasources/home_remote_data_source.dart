import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/home_summary.dart';

/// Remote data source contract for the Home dashboard payload.
abstract interface class HomeRemoteDataSource {
  Future<HomeSummary> fetchHomeSummary({String? userName});
}

/// FastAPI-backed Home dashboard data source.
class BackendHomeRemoteDataSource implements HomeRemoteDataSource {
  const BackendHomeRemoteDataSource(this._client);

  final Dio _client;

  @override
  Future<HomeSummary> fetchHomeSummary({String? userName}) async {
    try {
      final response = await _client.get<Map<String, dynamic>>('/home');
      return _summaryFromJson(response.data ?? const {});
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'home_load_failed',
        fallbackMessage: 'Ringkasan belum berhasil dimuat. Coba lagi sebentar.',
      );
    }
  }

  HomeSummary _summaryFromJson(Map<String, dynamic> json) {
    final dailyQira = json['dailyQira'] as Map<String, dynamic>? ?? const {};
    final greeting = json['greeting'] as Map<String, dynamic>? ?? const {};
    final weeklySnapshot =
        json['weeklySnapshot'] as Map<String, dynamic>? ?? const {};
    final continuePractice = json['continuePractice'] as Map<String, dynamic>?;
    final recommendation = json['recommendation'] as Map<String, dynamic>?;

    return HomeSummary(
      dailyQira: DailyQira(
        id: dailyQira['id'] as String? ?? '',
        surahName: dailyQira['surahName'] as String? ?? '',
        ayahLabel: dailyQira['ayahLabel'] as String? ?? '',
        arabicText: dailyQira['arabicText'] as String? ?? '',
        translation: dailyQira['translation'] as String? ?? '',
        reciter: dailyQira['reciter'] as String? ?? 'Reference reciter',
        estimatedMinutes: dailyQira['estimatedMinutes'] as int? ?? 5,
      ),
      greeting: AiGreeting(
        headline: greeting['headline'] as String? ?? 'Assalamualaikum.',
        message:
            greeting['message'] as String? ??
            'AI menyiapkan latihan yang cocok untuk hari ini.',
      ),
      weeklySnapshot: WeeklySnapshot(
        sessionsDone: weeklySnapshot['sessionsDone'] as int? ?? 0,
        sessionsTarget: weeklySnapshot['sessionsTarget'] as int? ?? 7,
        averageMatch: weeklySnapshot['averageMatch'] as int? ?? 0,
        streakDays: weeklySnapshot['streakDays'] as int? ?? 0,
      ),
      continuePractice: continuePractice == null
          ? null
          : ContinuePractice(
              practiceId: continuePractice['practiceId'] as String? ?? '',
              surahName: continuePractice['surahName'] as String? ?? '',
              ayahLabel: continuePractice['ayahLabel'] as String? ?? '',
              lastMatch: continuePractice['lastMatch'] as int? ?? 0,
            ),
      recommendation: recommendation == null
          ? null
          : AiRecommendation(
              practiceId: recommendation['practiceId'] as String? ?? '',
              title: recommendation['title'] as String? ?? '',
              reason: recommendation['reason'] as String? ?? '',
            ),
    );
  }
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
