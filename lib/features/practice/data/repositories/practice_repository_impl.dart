import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/practice_item.dart';
import '../../domain/repositories/practice_repository.dart';
import '../datasources/practice_local_data_source.dart';

/// Repository implementation for curated practice materials.
class PracticeRepositoryImpl implements PracticeRepository {
  const PracticeRepositoryImpl({required this.localDataSource});

  final PracticeLocalDataSource localDataSource;

  @override
  Future<List<PracticeItem>> loadPracticeItems() async {
    try {
      return await localDataSource.fetchPracticeItems();
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'practice_load_failed',
        message: 'Materi latihan belum berhasil dimuat.',
      );
    }
  }

  @override
  Future<PracticeItem> loadPracticeItem(String id) async {
    final items = await loadPracticeItems();
    return findPracticeItemOrThrow(items, id);
  }
}

final practiceLocalDataSourceProvider = Provider<PracticeLocalDataSource>((
  ref,
) {
  return const MockPracticeLocalDataSource();
});

final practiceRepositoryProvider = Provider<PracticeRepository>((ref) {
  return PracticeRepositoryImpl(
    localDataSource: ref.watch(practiceLocalDataSourceProvider),
  );
});
