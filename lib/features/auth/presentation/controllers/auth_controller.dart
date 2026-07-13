import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/entities/auth_user.dart';

/// Controls authentication state and session restoration.
class AuthController extends AsyncNotifier<AuthSession?> {
  @override
  Future<AuthSession?> build() async {
    if (AppConfig.authBypassEnabled) {
      return ref.watch(guestAuthSessionProvider);
    }

    return ref.watch(authRepositoryProvider).restoreSession();
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading<AuthSession?>();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .signIn(email: email, password: password),
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<AuthSession?>();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .signUp(name: name, email: email, password: password),
    );
  }

  Future<void> logout() async {
    if (AppConfig.authBypassEnabled) {
      state = AsyncData<AuthSession?>(ref.read(guestAuthSessionProvider));
      return;
    }

    state = const AsyncLoading<AuthSession?>();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData<AuthSession?>(null);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthSession?>(AuthController.new);

final guestAuthSessionProvider = Provider<AuthSession>((ref) {
  return const AuthSession(
    user: AuthUser(id: 'guest_user', name: 'Ahmad', email: 'guest@sobat.ngaji'),
    tokens: AuthTokens(
      accessToken: 'guest_access_token',
      refreshToken: 'guest_refresh_token',
    ),
  );
});
