import '../entities/profile_summary.dart';

/// Boundary for profile learning summary and preferences.
abstract interface class ProfileRepository {
  Future<ProfileSummary> loadProfileSummary();
}
