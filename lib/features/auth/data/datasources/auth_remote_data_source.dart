import 'dart:async';

import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/entities/auth_user.dart';

/// Remote data source contract for auth API operations.
abstract interface class AuthRemoteDataSource {
  Future<AuthSession> signIn({required String email, required String password});

  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  });
}

/// Mock auth API used until backend is available.
class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  const MockAuthRemoteDataSource();

  @override
  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    _validateCredentials(email: email, password: password);

    return _sessionFor(
      name: email.split('@').first.trim().isEmpty
          ? 'Alya'
          : email.split('@').first,
      email: email,
    );
  }

  @override
  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 550));
    if (name.trim().length < 2) {
      throw const FormatException('Nama minimal 2 karakter.');
    }
    _validateCredentials(email: email, password: password);

    return _sessionFor(name: name.trim(), email: email);
  }

  void _validateCredentials({required String email, required String password}) {
    if (!email.contains('@')) {
      throw const FormatException('Email belum valid.');
    }
    if (password.length < 6) {
      throw const FormatException('Password minimal 6 karakter.');
    }
  }

  AuthSession _sessionFor({required String name, required String email}) {
    final normalizedEmail = email.trim().toLowerCase();

    return AuthSession(
      user: AuthUser(
        id: 'user_${normalizedEmail.hashCode.abs()}',
        name: name,
        email: normalizedEmail,
      ),
      tokens: AuthTokens(
        accessToken: 'mock_access_${DateTime.now().millisecondsSinceEpoch}',
        refreshToken: 'mock_refresh_${DateTime.now().millisecondsSinceEpoch}',
      ),
    );
  }
}
