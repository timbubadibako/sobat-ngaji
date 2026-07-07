import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_summary.dart';

/// Loads and exposes the Home summary as async state.
class HomeController extends AsyncNotifier<HomeSummary> {
  @override
  Future<HomeSummary> build() {
    return ref
        .watch(homeRepositoryProvider)
        .loadHomeSummary(userName: _currentUserName());
  }

  /// Re-fetches the Home summary, surfacing loading/error/success states.
  Future<void> refresh() async {
    state = const AsyncLoading<HomeSummary>();
    state = await AsyncValue.guard(
      () => ref
          .read(homeRepositoryProvider)
          .loadHomeSummary(userName: _currentUserName()),
    );
  }

  String? _currentUserName() {
    return ref.read(authControllerProvider).valueOrNull?.user.name;
  }
}

final homeControllerProvider =
    AsyncNotifierProvider<HomeController, HomeSummary>(HomeController.new);
