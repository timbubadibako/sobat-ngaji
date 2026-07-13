/// Compile-time application switches.
abstract final class AppConfig {
  /// Temporary demo mode: skip login/signup and use a local guest session.
  ///
  /// Disable with:
  /// `--dart-define=SOBAT_NGAJI_AUTH_BYPASS=false`
  static const authBypassEnabled = bool.fromEnvironment(
    'SOBAT_NGAJI_AUTH_BYPASS',
    defaultValue: true,
  );

  /// Temporary demo mode: use local mock feature data instead of backend calls.
  ///
  /// Disable with:
  /// `--dart-define=SOBAT_NGAJI_MOCK_DATA=false`
  static const mockDataEnabled = bool.fromEnvironment(
    'SOBAT_NGAJI_MOCK_DATA',
    defaultValue: true,
  );
}
