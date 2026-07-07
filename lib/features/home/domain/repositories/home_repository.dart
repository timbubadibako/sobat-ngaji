import '../entities/home_summary.dart';

/// Boundary for Home data. UI never talks to a data source directly.
abstract interface class HomeRepository {
  Future<HomeSummary> loadHomeSummary({String? userName});
}
