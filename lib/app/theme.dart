import 'package:flutter/material.dart';

/// Centralized app colors that mirror docs/DesignTokens.md.
abstract final class AppColors {
  static const ink = Color(0xFF0B1220);
  static const deepNavy = Color(0xFF101A2E);
  static const surface = Color(0xFFF7FAFC);
  static const surfaceMuted = Color(0xFFEEF4F7);
  static const aqua = Color(0xFF32D5C8);
  static const cyan = Color(0xFF53C7F0);
  static const teal = Color(0xFF17B8A6);
  static const success = Color(0xFF20C997);
  static const warning = Color(0xFFF5A524);
  static const error = Color(0xFFEF476F);
  static const info = Color(0xFF4DA3FF);
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
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.aqua,
    brightness: Brightness.light,
    primary: AppColors.deepNavy,
    secondary: AppColors.aqua,
    error: AppColors.error,
    surface: AppColors.surface,
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
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.surfaceMuted),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.surfaceMuted),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.aqua, width: 1.5),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColors.deepNavy,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
    ),
  );
}
