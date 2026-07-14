import 'package:flutter/material.dart';

/// Immutable color palette so theme changes stay centralized.
class AppPalette {
  const AppPalette({
    required this.ink,
    required this.deepNavy,
    required this.navy,
    required this.navy2,
    required this.surface,
    required this.surfaceMuted,
    required this.surfaceSoft,
    required this.surfaceElevated,
    required this.line,
    required this.muted,
    required this.aqua,
    required this.cyan,
    required this.teal,
    required this.success,
    required this.successSoft,
    required this.successText,
    required this.warning,
    required this.warningSoft,
    required this.warningText,
    required this.error,
    required this.errorSoft,
    required this.errorText,
    required this.info,
    required this.infoSoft,
  });

  final Color ink;
  final Color deepNavy;
  final Color navy;
  final Color navy2;
  final Color surface;
  final Color surfaceMuted;
  final Color surfaceSoft;
  final Color surfaceElevated;
  final Color line;
  final Color muted;
  final Color aqua;
  final Color cyan;
  final Color teal;
  final Color success;
  final Color successSoft;
  final Color successText;
  final Color warning;
  final Color warningSoft;
  final Color warningText;
  final Color error;
  final Color errorSoft;
  final Color errorText;
  final Color info;
  final Color infoSoft;
}

/// Available palette presets. Switch active palette in [AppColors._active].
abstract final class AppPalettes {
  static const aquaAi = AppPalette(
    ink: Color(0xFF0B1220),
    deepNavy: Color(0xFF0B1220),
    navy: Color(0xFF101A2E),
    navy2: Color(0xFF1A2A46),
    surface: Color(0xFFF7FAFC),
    surfaceMuted: Color(0xFFEEF4F7),
    surfaceSoft: Color(0xFFF3F8FA),
    surfaceElevated: Color(0xFFFFFFFF),
    line: Color(0xFFDBE6ED),
    muted: Color(0xFF6B7A8C),
    aqua: Color(0xFF32D5C8),
    cyan: Color(0xFF53C7F0),
    teal: Color(0xFF17B8A6),
    success: Color(0xFF20C997),
    successSoft: Color(0xFFDDF8EF),
    successText: Color(0xFF087C5B),
    warning: Color(0xFFF5A524),
    warningSoft: Color(0xFFFFF1CF),
    warningText: Color(0xFF9F6500),
    error: Color(0xFFEF476F),
    errorSoft: Color(0xFFFFE3EA),
    errorText: Color(0xFFB42046),
    info: Color(0xFF4DA3FF),
    infoSoft: Color(0xFFE0F0FF),
  );
}

/// Centralized app colors that mirror docs/DesignTokens.md.
abstract final class AppColors {
  static const active = AppPalettes.aquaAi;

  static const ink = Color(0xFF0B1220);
  static const deepNavy = Color(0xFF0B1220);
  static const navy = Color(0xFF101A2E);
  static const navy2 = Color(0xFF1A2A46);
  static const surface = Color(0xFFF7FAFC);
  static const surfaceMuted = Color(0xFFEEF4F7);
  static const surfaceSoft = Color(0xFFF3F8FA);
  static const surfaceElevated = Color(0xFFFFFFFF);
  static const line = Color(0xFFDBE6ED);
  static const muted = Color(0xFF6B7A8C);
  static const aqua = Color(0xFF32D5C8);
  static const cyan = Color(0xFF53C7F0);
  static const teal = Color(0xFF17B8A6);
  static const success = Color(0xFF20C997);
  static const successSoft = Color(0xFFDDF8EF);
  static const successText = Color(0xFF087C5B);
  static const warning = Color(0xFFF5A524);
  static const warningSoft = Color(0xFFFFF1CF);
  static const warningText = Color(0xFF9F6500);
  static const error = Color(0xFFEF476F);
  static const errorSoft = Color(0xFFFFE3EA);
  static const errorText = Color(0xFFB42046);
  static const info = Color(0xFF4DA3FF);
  static const infoSoft = Color(0xFFE0F0FF);
}

/// App spacing tokens.
abstract final class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 16.0;
  static const md = 24.0;
  static const lg = 32.0;
  static const xl = 40.0;
}

/// App radius tokens.
abstract final class AppRadius {
  static const small = 10.0;
  static const medium = 14.0;
  static const card = 18.0;
  static const hero = 24.0;
  static const pill = 999.0;
}

/// App elevation tokens.
abstract final class AppElevation {
  static const level0 = 0.0;
  static const level1 = 1.0;
  static const level2 = 3.0;
  static const level3 = 6.0;
}

/// App motion tokens that mirror docs/DesignTokens.md.
abstract final class AppMotion {
  static const fast = Duration(milliseconds: 160);
  static const normal = Duration(milliseconds: 220);
  static const hero = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 420);
}

ThemeData buildAppTheme() {
  final colorScheme =
      ColorScheme.fromSeed(
        seedColor: AppColors.aqua,
        brightness: Brightness.light,
        primary: AppColors.navy,
        secondary: AppColors.aqua,
        tertiary: AppColors.cyan,
        error: AppColors.error,
        surface: AppColors.surface,
      ).copyWith(
        onPrimary: AppColors.surfaceElevated,
        primaryContainer: AppColors.aqua,
        onPrimaryContainer: AppColors.ink,
        onSecondary: AppColors.ink,
        secondaryContainer: AppColors.infoSoft,
        onSecondaryContainer: AppColors.ink,
        tertiaryContainer: AppColors.surfaceSoft,
        onTertiaryContainer: AppColors.ink,
        errorContainer: AppColors.errorSoft,
        onErrorContainer: AppColors.errorText,
        surfaceContainerHighest: AppColors.surfaceMuted,
        outline: AppColors.line,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.surface,
    fontFamily: 'Avenir Next',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 24 / 16, color: AppColors.ink),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        color: AppColors.ink,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
        color: AppColors.muted,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceElevated,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.aqua, width: 1.5),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.ink),
    dividerTheme: const DividerThemeData(
      color: AppColors.line,
      thickness: 1,
      space: AppSpacing.sm,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.teal,
      circularTrackColor: AppColors.surfaceMuted,
      linearTrackColor: AppColors.surfaceMuted,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 50),
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.teal,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceSoft,
      selectedColor: AppColors.aqua.withValues(alpha: 0.2),
      disabledColor: AppColors.surfaceMuted,
      labelStyle: const TextStyle(color: AppColors.ink),
      secondaryLabelStyle: const TextStyle(
        color: AppColors.ink,
        fontWeight: FontWeight.w700,
      ),
      side: const BorderSide(color: AppColors.line),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceElevated,
      indicatorColor: AppColors.aqua,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(
          color: states.contains(WidgetState.selected)
              ? AppColors.ink
              : AppColors.muted,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w800
              : FontWeight.w600,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.ink
              : AppColors.muted,
        );
      }),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceElevated,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
    ),
  );
}
