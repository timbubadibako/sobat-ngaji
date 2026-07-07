import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile_summary.dart';

/// Loads Profile summary state.
class ProfileController extends AsyncNotifier<ProfileSummary> {
  @override
  Future<ProfileSummary> build() {
    return ref.watch(profileRepositoryProvider).loadProfileSummary();
  }

  Future<void> refresh() async {
    state = const AsyncLoading<ProfileSummary>();
    state = await AsyncValue.guard(
      () => ref.read(profileRepositoryProvider).loadProfileSummary(),
    );
  }
}

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, ProfileSummary>(
      ProfileController.new,
    );
