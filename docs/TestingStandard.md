# Testing Standard

## Test Pyramid
- Unit test untuk logic, repository, mapper, dan controller.
- Widget test untuk screen/component state.
- Integration test untuk flow utama setelah MVP stabil.

## Required Tests Per Feature
### Controller / Notifier
- Initial state.
- Loading state.
- Success state.
- Error state.

### Repository
- Successful response mapping.
- Failed response mapping.
- Empty response handling.

### Widget
- Loading UI muncul.
- Empty UI muncul.
- Error UI muncul.
- Primary action memanggil callback/controller.

## Manual QA
Setiap feature mobile harus dicek pada:
- Small phone viewport.
- Normal phone viewport.
- Dark surface jika mode gelap dibuat.
- Reduced motion jika motion dipakai.

## Commands
```bash
flutter analyze
flutter test
dart format .
```

Jika memakai code generation:
```bash
dart run build_runner build --delete-conflicting-outputs
```

