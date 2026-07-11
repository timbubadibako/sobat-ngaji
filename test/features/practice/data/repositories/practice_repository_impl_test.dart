import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/core/errors/app_failure.dart';
import 'package:sobat_ngaji/features/practice/data/datasources/practice_local_data_source.dart';
import 'package:sobat_ngaji/features/practice/data/repositories/practice_repository_impl.dart';
import 'package:sobat_ngaji/features/practice/domain/entities/practice_item.dart';

void main() {
  group('PracticeRepositoryImpl', () {
    test('loadPracticeItems returns curated items', () async {
      final repository = PracticeRepositoryImpl(
        localDataSource: _FakePracticeLocalDataSource(),
      );

      final items = await repository.loadPracticeItems();

      expect(items, hasLength(1));
      expect(items.first.id, 'ad_dhuha_1');
    });

    test('loadPracticeItem throws AppFailure for missing item', () async {
      final repository = PracticeRepositoryImpl(
        localDataSource: _FakePracticeLocalDataSource(),
      );

      final call = repository.loadPracticeItem('missing');

      await expectLater(call, throwsA(isA<AppFailure>()));
    });
  });
}

class _FakePracticeLocalDataSource implements PracticeLocalDataSource {
  @override
  Future<List<PracticeItem>> fetchPracticeItems() async {
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
    ];
  }

  @override
  Future<PracticeItem> fetchPracticeItem(String id) async {
    final items = await fetchPracticeItems();
    return findPracticeItemOrThrow(items, id);
  }
}
