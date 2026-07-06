import '../entities/auth_session.dart';

/// Contract for authentication operations.
abstract interface class AuthRepository {
  Future<AuthSession?> restoreSession();

  Future<AuthSession> signIn({required String email, required String password});

  Future<AuthSession> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();
}
