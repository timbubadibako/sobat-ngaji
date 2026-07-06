# Coding Convention

## Core Rules
- Jangan mulai coding dari screen. Mulai dari feature.
- Jangan taruh business logic di widget.
- Jangan panggil API langsung dari widget.
- Jangan membuat duplicate widget jika sudah ada shared component.
- Gunakan Repository Pattern untuk akses data.
- Gunakan immutable model.
- Gunakan Freezed dan json_serializable untuk model API.
- Gunakan Riverpod untuk state dan dependency injection.
- Gunakan ConsumerWidget sebagai default.
- Gunakan StatefulWidget hanya jika benar-benar perlu lifecycle lokal seperti animation controller, text controller, atau recorder lifecycle.

## Naming Convention
### Screen
```dart
HomeScreen
PracticeScreen
InsightScreen
ProfileScreen
```

### Provider
```dart
homeProvider
practiceProvider
practiceRepositoryProvider
audioServiceProvider
```

### Controller / Notifier
```dart
HomeController
PracticeController
RecordingController
InsightController
```

### Service
```dart
AudioService
EvaluationService
StorageService
NetworkService
```

### Repository
```dart
PracticeRepository
EvaluationRepository
InsightRepository
AuthRepository
```

### Widget
```dart
PracticeCard
DailyQiraHero
AiInsightCard
RecordingPanel
EvaluationScoreCard
```

### Model
```dart
PracticeItem
PracticeSession
EvaluationResult
LetterMastery
WeeklyInsight
```

## File Naming
- Dart file memakai snake_case.
- Satu public class utama per file jika memungkinkan.
- Generated files tetap mengikuti convention Freezed/json_serializable.

Contoh:
```text
daily_qira_hero.dart
practice_repository.dart
evaluation_result.dart
recording_controller.dart
```

## Documentation
- Public class pada core, shared, repository, dan service harus punya doc comment singkat.
- Komentar tidak dipakai untuk menjelaskan hal obvious.
- Komentar dipakai untuk keputusan domain atau integrasi yang tidak langsung terlihat.

## Error Handling
- Repository mengubah technical error menjadi domain failure.
- UI hanya menampilkan pesan yang ramah pengguna.
- Error audio permission harus jelas dan actionable.

