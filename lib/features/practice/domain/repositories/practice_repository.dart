import '../entities/practice_item.dart';

/// Boundary for curated practice material.
abstract interface class PracticeRepository {
  Future<List<PracticeItem>> loadPracticeItems();

  Future<PracticeItem> loadPracticeItem(String id);
}
