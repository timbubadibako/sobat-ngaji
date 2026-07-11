# Design Tokens

Dokumen ini memecah design guideline menjadi token implementasi agar Flutter theme tidak dibuat berbeda-beda.

## Color Tokens
```dart
class AppColors {
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
```

Flutter implementation stores the preset in `AppPalette` / `AppPalettes.aquaAi`
and exposes compile-time constants through `AppColors` so const widgets remain valid.
To change theme later, add a new `AppPalette` preset and update `AppColors` from it.

## Spacing Tokens
```dart
class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 16.0;
  static const md = 24.0;
  static const lg = 32.0;
  static const xl = 40.0;
}
```

## Radius Tokens
```dart
class AppRadius {
  static const small = 10.0;
  static const medium = 14.0;
  static const card = 18.0;
  static const hero = 24.0;
  static const pill = 999.0;
}
```

## Elevation Tokens
```dart
class AppElevation {
  static const level0 = 0.0;
  static const level1 = 1.0;
  static const level2 = 3.0;
  static const level3 = 6.0;
}
```

## Animation Tokens
```dart
class AppMotion {
  static const fast = Duration(milliseconds: 160);
  static const normal = Duration(milliseconds: 220);
  static const hero = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 420);
}
```

## Typography Tokens
```text
Display: 34/42 semibold
H1: 32/40 semibold
H2: 24/32 semibold
H3: 20/28 semibold
Body: 16/24 regular
Caption: 12/16 medium
Arabic Display: 34/52
Arabic Body: 26/44
Arabic Small: 20/34
```

## Semantic Usage
- Navy/navy2: hero panels, auth header, strong AI/brand panels.
- Surface Elevated: cards and floating navigation.
- Aqua/cyan: AI, brand action, current recitation.
- Green: terbaca baik.
- Yellow/orange: perlu dicek.
- Red: perlu diulang atau error.
- Blue/info: sedang dibaca atau current state.

## Rule
Jika nilai token berubah, update `docs/DesignGuideline.md`, HTML prototype, dan Flutter theme secara konsisten.
