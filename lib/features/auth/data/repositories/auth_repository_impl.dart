import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

const _authSessionKey = 'auth_session';

/// Repository implementation that coordinates auth API and secure storage.
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SecureStorageService secureStorage,
  }) : this._(remoteDataSource, secureStorage);

  const AuthRepositoryImpl._(this._remoteDataSource, this._secureStorage);

  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _secureStorage;

  @override
  Future<AuthSession?> restoreSession() async {
    try {
      final rawSession = await _secureStorage.read(_authSessionKey);
      if (rawSession == null) {
        return null;
      }

      return AuthSession.fromJson(
        jsonDecode(rawSession) as Map<String, dynamic>,
      );
    } on Object {
      await _secureStorage.delete(_authSessionKey);
      throw const AppFailure(
        code: 'auth_restore_failed',
        message: 'Sesi berakhir. Silakan masuk kembali.',
      );
    }
  }

  @override
  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    return _persist(
      await _guard(
        () => _remoteDataSource.signIn(email: email, password: password),
      ),
    );
  }

  @override
  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _persist(
      await _guard(
        () => _remoteDataSource.signUp(
          name: name,
          email: email,
          password: password,
        ),
      ),
    );
  }

  @override
  Future<void> logout() {
    return _secureStorage.delete(_authSessionKey);
  }

  Future<AuthSession> _persist(AuthSession session) async {
    await _secureStorage.write(_authSessionKey, jsonEncode(session.toJson()));
    return session;
  }

  Future<AuthSession> _guard(Future<AuthSession> Function() operation) async {
    try {
      return await operation();
    } on FormatException catch (error) {
      throw AppFailure(code: 'auth_invalid_input', message: error.message);
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'auth_request_failed',
        message: 'Autentikasi belum berhasil. Coba lagi.',
      );
    }
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return BackendAuthRemoteDataSource(ref.watch(apiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    secureStorage: ref.watch(secureStorageServiceProvider),
  );
});
