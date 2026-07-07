import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/practice_item.dart';

/// Local practice catalog used while backend practice API is unavailable.
abstract interface class PracticeLocalDataSource {
  Future<List<PracticeItem>> fetchPracticeItems();
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
