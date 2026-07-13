import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth.dart';
import '../features/auth/domain/entities/auth_session.dart';
import '../features/evaluation/evaluation.dart';
import '../features/home/home.dart';
import '../features/insight/insight.dart';
import '../features/practice/practice.dart';
import '../features/profile/profile.dart';
import '../features/recording/recording.dart';
import 'app_shell.dart';
import '../core/config/app_config.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshListenable = ref.watch(_authRouteRefreshProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final location = state.uri.path;
      final isAuthRoute = location == '/login' || location == '/signup';
      final isSplashRoute = location == '/splash';

      if (AppConfig.authBypassEnabled) {
        return isSplashRoute || isAuthRoute ? '/home' : null;
      }

      return authState.when(
        loading: () => isSplashRoute ? null : '/splash',
        error: (_, _) => isAuthRoute ? null : '/login',
        data: (session) {
          final isAuthenticated = session != null;

          if (!isAuthenticated) {
            return isAuthRoute ? null : '/login';
          }

          if (isSplashRoute || isAuthRoute) {
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
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/practice',
            builder: (context, state) => const PracticeScreen(),
            routes: [
              GoRoute(
                path: ':practiceId',
                builder: (context, state) {
                  final practiceId = state.pathParameters['practiceId']!;
                  return PracticeDetailScreen(practiceId: practiceId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/recording/:practiceId',
            builder: (context, state) {
              final practiceId = state.pathParameters['practiceId']!;
              return RecordingScreen(practiceId: practiceId);
            },
          ),
          GoRoute(
            path: '/evaluation/:practiceId',
            builder: (context, state) {
              final practiceId = state.pathParameters['practiceId']!;
              return EvaluationResultScreen(practiceId: practiceId);
            },
          ),
          GoRoute(
            path: '/insight',
            builder: (context, state) => const InsightScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
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
