import 'package:dio/dio.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/practice_item.dart';

/// Local practice catalog used while backend practice API is unavailable.
abstract interface class PracticeLocalDataSource {
  Future<List<PracticeItem>> fetchPracticeItems();

  Future<PracticeItem> fetchPracticeItem(String id);
}

/// FastAPI-backed practice catalog data source.
class BackendPracticeDataSource implements PracticeLocalDataSource {
  const BackendPracticeDataSource(this._client);

  final Dio _client;

  @override
  Future<List<PracticeItem>> fetchPracticeItems() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/practice-items',
      );
      final items = response.data?['items'] as List<dynamic>? ?? const [];
      return items
          .whereType<Map<String, dynamic>>()
          .map(_practiceItemFromJson)
          .toList();
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'practice_load_failed',
        fallbackMessage: 'Materi latihan belum berhasil dimuat.',
      );
    }
  }

  @override
  Future<PracticeItem> fetchPracticeItem(String id) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/practice-items/$id',
      );
      final item = response.data?['item'] as Map<String, dynamic>? ?? const {};
      return _practiceItemFromJson(item);
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'practice_not_found',
        fallbackMessage: 'Materi latihan belum ditemukan.',
      );
    }
  }

  PracticeItem _practiceItemFromJson(Map<String, dynamic> json) {
    final tags = json['tags'] as List<dynamic>? ?? const [];
    final segments = json['segments'] as List<dynamic>? ?? const [];

    return PracticeItem(
      id: json['id'] as String? ?? '',
      surahName: json['surahName'] as String? ?? '',
      surahNumber: json['surahNumber'] as int? ?? 0,
      ayahLabel: json['ayahLabel'] as String? ?? '',
      arabicName: json['arabicName'] as String? ?? '',
      arabicText: json['arabicText'] as String? ?? '',
      translation: json['translation'] as String? ?? '',
      focus: json['focus'] as String? ?? '',
      level: _displayLevel(json['level'] as String?),
      estimatedMinutes: json['estimatedMinutes'] as int? ?? 5,
      referenceAudioUrl: json['referenceAudioUrl'] as String? ?? '',
      isDaily: json['isDaily'] as bool? ?? false,
      latinHint: json['latinHint'] as String?,
      tags: tags.whereType<String>().toList(),
      segments: segments.whereType<Map<String, dynamic>>().map((segment) {
        return PracticeSegment(
          index: segment['index'] as int? ?? 0,
          text: segment['text'] as String? ?? '',
          startChar: segment['startChar'] as int? ?? 0,
          endChar: segment['endChar'] as int? ?? 0,
        );
      }).toList(),
    );
  }

  String _displayLevel(String? level) {
    if (level == null || level.isEmpty) return 'Beginner';
    return '${level[0].toUpperCase()}${level.substring(1)}';
  }
}

/// Static curated practice material for Sprint 3.
class MockPracticeLocalDataSource implements PracticeLocalDataSource {
  const MockPracticeLocalDataSource();

  @override
  Future<List<PracticeItem>> fetchPracticeItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    // TODO(jrilym): Replace with GET /practice-items when backend is ready.
    return const [
      PracticeItem(
        id: 'ad_dhuha_1',
        surahName: 'Ad-Dhuha',
        surahNumber: 93,
        ayahLabel: 'Ayat 1',
        arabicName: 'الضحى',
        arabicText: 'وَالضُّحَىٰ',
        translation: 'Demi waktu duha.',
        focus: 'Huruf ض',
        level: 'Beginner',
        estimatedMinutes: 5,
        referenceAudioUrl: 'mock://audio/ad-dhuha-1',
        isDaily: true,
      ),
      PracticeItem(
        id: 'al_fatihah_1',
        surahName: 'Al-Fatihah',
        surahNumber: 1,
        ayahLabel: 'Frasa 1 dari 3',
        arabicName: 'الفاتحة',
        arabicText: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
        translation: 'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.',
        focus: 'Mad dan tempo',
        level: 'Beginner',
        estimatedMinutes: 4,
        referenceAudioUrl: 'mock://audio/al-fatihah-1',
        isDaily: false,
      ),
      PracticeItem(
        id: 'al_ikhlas_1',
        surahName: 'Al-Ikhlas',
        surahNumber: 112,
        ayahLabel: 'Ayat 1',
        arabicName: 'الإخلاص',
        arabicText: 'قُلْ هُوَ اللّٰهُ أَحَدٌ',
        translation: 'Katakanlah, Dialah Allah Yang Maha Esa.',
        focus: 'Qalqalah ringan',
        level: 'Beginner',
        estimatedMinutes: 3,
        referenceAudioUrl: 'mock://audio/al-ikhlas-1',
        isDaily: false,
      ),
      PracticeItem(
        id: 'an_nas_1_2',
        surahName: 'An-Nas',
        surahNumber: 114,
        ayahLabel: 'Ayat 1-2',
        arabicName: 'الناس',
        arabicText: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ مَلِكِ النَّاسِ',
        translation: 'Katakanlah, aku berlindung kepada Tuhannya manusia.',
        focus: 'Nun dan sin',
        level: 'Beginner',
        estimatedMinutes: 5,
        referenceAudioUrl: 'mock://audio/an-nas-1-2',
        isDaily: false,
      ),
    ];
  }

  @override
  Future<PracticeItem> fetchPracticeItem(String id) async {
    final items = await fetchPracticeItems();
    return findPracticeItemOrThrow(items, id);
  }
}

PracticeItem findPracticeItemOrThrow(List<PracticeItem> items, String id) {
  for (final item in items) {
    if (item.id == id) {
      return item;
    }
  }

  throw const AppFailure(
    code: 'practice_not_found',
    message: 'Materi latihan belum ditemukan.',
  );
}
