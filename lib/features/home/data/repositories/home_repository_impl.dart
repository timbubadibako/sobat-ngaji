import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/home_summary.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

/// Coordinates the Home data source and maps technical errors to failures.
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this._remoteDataSource});

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<HomeSummary> loadHomeSummary({String? userName}) async {
    try {
      // TODO(jrilym): Replace local Home mock with backend-backed source.
      return await _remoteDataSource.fetchHomeSummary(userName: userName);
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'home_load_failed',
        message: 'Ringkasan belum berhasil dimuat. Coba lagi sebentar.',
      );
    }
  }
}

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return const MockHomeRemoteDataSource();
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
  );
});
