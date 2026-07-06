import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/core/errors/app_failure.dart';
import 'package:sobat_ngaji/core/storage/secure_storage_service.dart';
import 'package:sobat_ngaji/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sobat_ngaji/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_session.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_tokens.dart';
import 'package:sobat_ngaji/features/auth/domain/entities/auth_user.dart';

void main() {
  group('AuthRepositoryImpl', () {
    test('restoreSession returns null when secure storage is empty', () async {
      final repository = AuthRepositoryImpl(
        remoteDataSource: _FakeAuthRemoteDataSource(),
        secureStorage: _MemorySecureStorageService(),
      );

      final session = await repository.restoreSession();

      expect(session, isNull);
    });

    test('signIn persists session and restoreSession returns it', () async {
      final storage = _MemorySecureStorageService();
      final repository = AuthRepositoryImpl(
        remoteDataSource: _FakeAuthRemoteDataSource(),
        secureStorage: storage,
      );

      final signedIn = await repository.signIn(
        email: 'alya@sobat.ngaji',
        password: 'password',
      );
      final restored = await repository.restoreSession();

      expect(restored, signedIn);
      expect(restored?.user.email, 'alya@sobat.ngaji');
    });

    test('logout clears persisted session', () async {
      final storage = _MemorySecureStorageService();
      final repository = AuthRepositoryImpl(
        remoteDataSource: _FakeAuthRemoteDataSource(),
        secureStorage: storage,
      );

      await repository.signIn(email: 'alya@sobat.ngaji', password: 'password');
      await repository.logout();

      expect(await repository.restoreSession(), isNull);
    });

    test('signIn maps invalid input to AppFailure', () async {
      final repository = AuthRepositoryImpl(
        remoteDataSource: _FakeAuthRemoteDataSource(shouldThrowFormat: true),
        secureStorage: _MemorySecureStorageService(),
      );

      final call = repository.signIn(email: 'invalid', password: 'short');

      await expectLater(
        call,
        throwsA(
          isA<AppFailure>().having(
            (failure) => failure.code,
            'code',
            'auth_invalid_input',
          ),
        ),
      );
    });
  });
}

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  _FakeAuthRemoteDataSource({this.shouldThrowFormat = false});

  final bool shouldThrowFormat;

  @override
  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    if (shouldThrowFormat) {
      throw const FormatException('Email belum valid.');
    }

    return _session(email: email, name: 'Alya');
  }

  @override
  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _session(email: email, name: name);
  }

  AuthSession _session({required String email, required String name}) {
    return AuthSession(
      user: AuthUser(id: 'user_1', name: name, email: email),
      tokens: const AuthTokens(accessToken: 'access', refreshToken: 'refresh'),
    );
  }
}

class _MemorySecureStorageService extends SecureStorageService {
  _MemorySecureStorageService() : super(const FlutterSecureStorage());

  final Map<String, String> _values = {};

  @override
  Future<void> write(String key, String value) async {
    _values[key] = value;
  }

  @override
  Future<String?> read(String key) async {
    return _values[key];
  }

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }
}
