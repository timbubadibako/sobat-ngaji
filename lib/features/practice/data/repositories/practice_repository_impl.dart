import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
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
    try {
      return await localDataSource.fetchPracticeItem(id);
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'practice_not_found',
        message: 'Materi latihan belum ditemukan.',
      );
    }
  }
}

final practiceLocalDataSourceProvider = Provider<PracticeLocalDataSource>((
  ref,
) {
  if (AppConfig.mockDataEnabled) {
    return const MockPracticeLocalDataSource();
  }

  return BackendPracticeDataSource(ref.watch(apiClientProvider));
});

final practiceRepositoryProvider = Provider<PracticeRepository>((ref) {
  return PracticeRepositoryImpl(
    localDataSource: ref.watch(practiceLocalDataSourceProvider),
  );
});
