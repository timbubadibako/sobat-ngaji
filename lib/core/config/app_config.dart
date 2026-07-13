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
}
