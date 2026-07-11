import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
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

/// FastAPI-backed auth data source.
class BackendAuthRemoteDataSource implements AuthRemoteDataSource {
  const BackendAuthRemoteDataSource(this._client);

  final Dio _client;

  @override
  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'email': email.trim(), 'password': password},
      );

      return _sessionFromJson(response.data ?? const {});
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'auth_request_failed',
        fallbackMessage: 'Autentikasi belum berhasil. Coba lagi.',
      );
    }
  }

  @override
  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/auth/signup',
        data: {
          'name': name.trim(),
          'email': email.trim(),
          'password': password,
        },
      );

      return _sessionFromJson(response.data ?? const {});
    } on Object catch (error) {
      throw mapDioFailure(
        error,
        fallbackCode: 'auth_request_failed',
        fallbackMessage: 'Autentikasi belum berhasil. Coba lagi.',
      );
    }
  }

  AuthSession _sessionFromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>? ?? const {};
    final tokens = json['tokens'] as Map<String, dynamic>? ?? const {};

    return AuthSession(
      user: AuthUser(
        id: user['id'] as String? ?? '',
        name: user['name'] as String? ?? 'Sobat',
        email: user['email'] as String? ?? '',
      ),
      tokens: AuthTokens(
        accessToken: tokens['accessToken'] as String? ?? '',
        refreshToken: tokens['refreshToken'] as String? ?? '',
      ),
    );
  }
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
