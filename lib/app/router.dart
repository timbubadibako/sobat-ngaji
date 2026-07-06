import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth.dart';
import '../features/auth/domain/entities/auth_session.dart';
import '../shared/widgets/feature_placeholder_screen.dart';
import 'app_shell.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshListenable = ref.watch(_authRouteRefreshProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final location = state.uri.path;
      final isAuthRoute = location == '/login' || location == '/signup';

      return authState.when(
        loading: () => location == '/splash' ? null : '/splash',
        error: (_, _) => isAuthRoute ? null : '/login',
        data: (session) {
          final isAuthenticated = session != null;

          if (!isAuthenticated) {
            return isAuthRoute ? null : '/login';
          }

          if (location == '/splash' || isAuthRoute) {
            return '/home';
          }

          return null;
        },
      );
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const FeaturePlaceholderScreen(
              title: 'Home',
              subtitle: 'Daily Qira akan menjadi hero utama di sini.',
            ),
          ),
          GoRoute(
            path: '/practice',
            builder: (context, state) => const FeaturePlaceholderScreen(
              title: 'Practice',
              subtitle: 'Pilih materi, dengarkan referensi, lalu rekam.',
            ),
          ),
          GoRoute(
            path: '/insight',
            builder: (context, state) => const FeaturePlaceholderScreen(
              title: 'Insight',
              subtitle: 'AI menemukan pola latihan dan rekomendasi personal.',
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const FeaturePlaceholderScreen(
              title: 'Profile',
              subtitle: 'Kelola akun dan ringkasan latihan.',
              showLogout: true,
            ),
          ),
        ],
      ),
    ],
  );
});

final _authRouteRefreshProvider = Provider<Listenable>((ref) {
  return _AuthRouteRefreshNotifier(ref);
});

class _AuthRouteRefreshNotifier extends ChangeNotifier {
  _AuthRouteRefreshNotifier(this._ref) {
    _ref.listen<AsyncValue<AuthSession?>>(
      authControllerProvider,
      (previous, next) => notifyListeners(),
    );
  }

  final Ref _ref;
}
