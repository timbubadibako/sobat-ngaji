/// Domain-level failure that can be safely rendered by UI.
class AppFailure implements Exception {
  const AppFailure({required this.message, this.code = 'unknown'});

  final String message;
  final String code;

  @override
  String toString() => message;
}
