import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sobat_ngaji/app/app.dart';
import 'package:sobat_ngaji/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_session.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_tokens.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_user.dart';
import 'package:sobat_ngaji/features/auth/domain/repositories/auth_repository.dart';
import 'package:sobat_ngaji/features/home/data/datasources/home_remote_data_source.dart';
import 'package:sobat_ngaji/features/home/data/repositories/home_repository_impl.dart';
import 'package:sobat_ngaji/features/practice/data/datasources/practice_local_data_source.dart';
import 'package:sobat_ngaji/features/practice/data/repositories/practice_repository_impl.dart';

void main() {
  testWidgets('auth bypass opens Home without login session', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRemoteDataSourceProvider.overrideWithValue(
            const MockHomeRemoteDataSource(),
          ),
          practiceLocalDataSourceProvider.overrideWithValue(
            const MockPracticeLocalDataSource(),
          ),
        ],
        child: const SobatNgajiApp(),
      ),
    );

    await _pumpUntilFound(tester, find.text('CONTINUE LEARNING'));
    expect(find.text('CONTINUE LEARNING'), findsOneWidget);
    expect(find.text('Masuk ke Sobat Ngaji'), findsNothing);
  });

  testWidgets('authenticated app flow opens Practice detail', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
          homeRemoteDataSourceProvider.overrideWithValue(
            const MockHomeRemoteDataSource(),
          ),
          practiceLocalDataSourceProvider.overrideWithValue(
            const MockPracticeLocalDataSource(),
          ),
        ],
        child: const SobatNgajiApp(),
      ),
    );

    await _pumpUntilFound(tester, find.text('CONTINUE LEARNING'));
    if (find.text('CONTINUE LEARNING').evaluate().isEmpty) {
      final texts = tester.widgetList<Text>(find.byType(Text)).map((text) {
        return text.data ?? text.textSpan?.toPlainText() ?? '';
      }).toList();
      fail('Home did not render. Visible texts: $texts');
    }
    expect(find.text('CONTINUE LEARNING'), findsOneWidget);

    await tester.tap(find.byTooltip('Practice'));
    await _pumpUntilFound(tester, find.text('Frasa kurasi'));
    expect(find.text('Frasa kurasi'), findsOneWidget);

    await tester.drag(find.byType(Scrollable).last, const Offset(0, -260));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ad-Dhuha').first);
    await _pumpUntilFound(tester, find.text('Dengar referensi'));
    expect(find.text('Dengar referensi'), findsOneWidget);
    expect(find.text('وَالضُّحَىٰ'), findsOneWidget);
  });

  testWidgets('top-level tabs can switch with horizontal swipe', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
          homeRemoteDataSourceProvider.overrideWithValue(
            const MockHomeRemoteDataSource(),
          ),
          practiceLocalDataSourceProvider.overrideWithValue(
            const MockPracticeLocalDataSource(),
          ),
        ],
        child: const SobatNgajiApp(),
      ),
    );

    await _pumpUntilFound(tester, find.text('CONTINUE LEARNING'));

    await tester.drag(find.byType(SobatNgajiApp), const Offset(-280, 0));
    await _pumpUntilFound(tester, find.text('Frasa kurasi'));
    expect(find.text('Frasa kurasi'), findsOneWidget);

    await tester.drag(find.byType(SobatNgajiApp), const Offset(280, 0));
    await _pumpUntilFound(tester, find.text('CONTINUE LEARNING'));
    expect(find.text('CONTINUE LEARNING'), findsOneWidget);
  });
}

Future<void> _pumpUntilFound(WidgetTester tester, Finder finder) async {
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 100));
    if (finder.evaluate().isNotEmpty) {
      return;
    }
  }
}

class _FakeAuthRepository implements AuthRepository {
  final AuthSession _session = const AuthSession(
    user: AuthUser(id: 'user_1', name: 'Alya', email: 'alya@sobat.ngaji'),
    tokens: AuthTokens(accessToken: 'access', refreshToken: 'refresh'),
  );

  @override
  Future<void> logout() async {}

  @override
  Future<AuthSession?> restoreSession() async => _session;

  @override
  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    return _session;
  }

  @override
  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _session;
  }
}
