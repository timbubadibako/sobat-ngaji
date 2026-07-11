import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../errors/app_failure.dart';
import '../storage/secure_storage_service.dart';

const _authSessionKey = 'auth_session';

/// Local backend base URL while production deployment is pending.
const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://127.0.0.1:8000/v1',
);

/// Shared Dio client for HTTP data sources.
final apiClientProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: const {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(
    _AuthHeaderInterceptor(ref.watch(secureStorageServiceProvider)),
  );

  return dio;
});

class _AuthHeaderInterceptor extends Interceptor {
  const _AuthHeaderInterceptor(this._secureStorage);

  final SecureStorageService _secureStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isPublicPath(options.path)) {
      handler.next(options);
      return;
    }

    final rawSession = await _secureStorage.read(_authSessionKey);
    final accessToken = _readAccessToken(rawSession);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  bool _isPublicPath(String path) {
    return path.contains('/auth/login') ||
        path.contains('/auth/signup') ||
        path.contains('/auth/refresh') ||
        path.contains('/health');
  }

  String? _readAccessToken(String? rawSession) {
    if (rawSession == null) return null;

    try {
      final session = jsonDecode(rawSession) as Map<String, dynamic>;
      final tokens = session['tokens'] as Map<String, dynamic>?;
      return tokens?['accessToken'] as String?;
    } on Object {
      return null;
    }
  }
}

AppFailure mapDioFailure(
  Object error, {
  required String fallbackCode,
  required String fallbackMessage,
}) {
  if (error is! DioException) {
    return AppFailure(code: fallbackCode, message: fallbackMessage);
  }

  final data = error.response?.data;
  if (data is Map<String, dynamic>) {
    final errorBody = data['error'];
    if (errorBody is Map<String, dynamic>) {
      return AppFailure(
        code: errorBody['code'] as String? ?? fallbackCode,
        message: errorBody['message'] as String? ?? fallbackMessage,
      );
    }
  }

  return AppFailure(
    code: error.response?.statusCode == 401
        ? 'auth_token_expired'
        : fallbackCode,
    message: fallbackMessage,
  );
}
