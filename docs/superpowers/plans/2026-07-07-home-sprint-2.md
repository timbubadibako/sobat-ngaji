# Home Sprint 2 Implementation Plan

**For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build Sprint 2 Home screen with static local data, Riverpod state flow, and design-system-aligned UI.

**Architecture:** Keep existing feature-first `home/` module. Use static mock data through repository boundary, expose it with `AsyncNotifier<HomeSummary>`, and render state-specific UI in `HomeScreen`. Read auth session only for display-name personalization and leave explicit `TODO` markers for future backend integration.

**Tech Stack:** Flutter 3, Dart, Material 3, Riverpod, GoRouter, Freezed.

---

### Task 1: Lock Home Data Boundary To Static Local Source
**Files:**
- Modify: `lib/features/home/data/repositories/home_repository_impl.dart`
- Modify: `lib/features/home/data/datasources/home_remote_data_source.dart`

- [ ] **Step 1: Remove auth dependency from repository provider**

Keep repository provider focused on Home data. Auth personalization is passed by
`HomeController`, not fetched inside the repository provider.

```dart
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
  );
});
```

- [ ] **Step 2: Simplify repository constructor and add TODO integration comments**

Use static mock source only and document future integration points.

```dart
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<HomeSummary> loadHomeSummary() async {
    try {
    // TODO(jrilym): Replace local Home mock with backend-backed source.
    return await _remoteDataSource.fetchHomeSummary(userName: userName);
    } on AppFailure {
      rethrow;
    } on Object {
      throw const AppFailure(
        code: 'home_load_failed',
        message: 'Ringkasan belum berhasil dimuat. Coba lagi sebentar.',
      );
    }
  }
}
```

- [ ] **Step 3: Update data source contract to static local payload**

Remove `userName` input and add TODO markers for auth personalization.

```dart
abstract interface class HomeRemoteDataSource {
  Future<HomeSummary> fetchHomeSummary();
}

class MockHomeRemoteDataSource implements HomeRemoteDataSource {
  const MockHomeRemoteDataSource();

  @override
  Future<HomeSummary> fetchHomeSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // TODO(jrilym): Personalize greeting with authenticated user name.
    // TODO(jrilym): Source Daily Qira and recommendation from backend contract.
    return HomeSummary(
      // static payload
    );
  }
}
```

- [ ] **Step 4: Keep empty-state mock available**

Preserve alternate empty-state source for later testing.

```dart
class EmptyHomeRemoteDataSource implements HomeRemoteDataSource {
  const EmptyHomeRemoteDataSource();

  @override
  Future<HomeSummary> fetchHomeSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    throw const AppFailure(
      code: 'home_empty',
      message: 'Belum ada ringkasan latihan. Mulai Daily Qira pertamamu.',
    );
  }
}
```

### Task 2: Align Home Screen Structure With Sprint 2 Spec
**Files:**
- Modify: `lib/features/home/presentation/screens/home_screen.dart`

- [ ] **Step 1: Make Daily Qira first content block**

Reorder content so hero is strongest first-viewport item.

```dart
children: [
  const _HomeIntro(),
  const SizedBox(height: AppSpacing.md),
  DailyQiraHero(
    dailyQira: summary.dailyQira,
    onStart: () => context.go('/practice'),
  ),
  const SizedBox(height: AppSpacing.md),
  AiGreetingCard(greeting: summary.greeting),
  const SizedBox(height: AppSpacing.md),
  WeeklySnapshotCard(snapshot: summary.weeklySnapshot),
  ...
]
```

- [ ] **Step 2: Add small screen intro matching product tone**

Add lightweight header without weakening hero focus.

```dart
class _HomeIntro extends StatelessWidget {
  const _HomeIntro();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Home', style: theme.textTheme.labelMedium),
        const SizedBox(height: AppSpacing.xxs),
        Text('Latihan hari ini', style: theme.textTheme.headlineMedium),
      ],
    );
  }
}
```

- [ ] **Step 3: Distinguish empty-state copy from generic error**

Map `home_empty` to `EmptyState`.

```dart
error: (error, _) {
  if (error is AppFailure && error.code == 'home_empty') {
    return EmptyState(
      title: 'Belum ada ringkasan',
      message: error.message,
      actionLabel: 'Mulai Daily Qira',
      onAction: () => context.go('/practice'),
    );
  }

  return ErrorStateView(
    error: error,
    onRetry: () => ref.read(homeControllerProvider.notifier).refresh(),
  );
},
```

### Task 3: Refine Feature Widgets Against Home Design References
**Files:**
- Modify: `lib/features/home/presentation/widgets/daily_qira_hero.dart`
- Modify: `lib/features/home/presentation/widgets/ai_greeting_card.dart`
- Modify: `lib/features/home/presentation/widgets/weekly_snapshot_card.dart`
- Modify: `lib/features/home/presentation/widgets/continue_practice_card.dart`
- Modify: `lib/features/home/presentation/widgets/ai_recommendation_preview.dart`

- [ ] **Step 1: Strengthen Daily Qira hero metadata**

Expose focus letter and AI confidence in hero.

```dart
Row(
  children: [
    const _HeroMetaChip(icon: Icons.schedule_outlined, label: '5 min'),
    const SizedBox(width: AppSpacing.xs),
    const _HeroMetaChip(icon: Icons.auto_awesome, label: 'Medium'),
  ],
)
```

- [ ] **Step 2: Make AI greeting feel personal and calm**

Keep AI character visible without turning card into stats.

```dart
Text(
  'AI menemukan waktu terbaikmu ada di awal hari.',
  style: theme.textTheme.titleLarge,
)
```

- [ ] **Step 3: Refine weekly snapshot presentation**

Keep it informative, not dashboard-like.

```dart
Text(
  'Progress mingguan',
  style: theme.textTheme.labelMedium?.copyWith(color: AppColors.teal),
)
```

- [ ] **Step 4: Make continue practice and recommendation actions clearer**

Add explicit action labels in copy, keep routing to `/practice`.

```dart
Text('Lanjutkan frasa terakhir', style: theme.textTheme.labelMedium)
Text('Kami menyarankan latihan berikut', style: theme.textTheme.labelMedium)
```

### Task 4: Verify Sprint 2 Home
**Files:**
- Verify only

- [ ] **Step 1: Run formatter on touched files**

Run:

```bash
rtk dart format lib/features/home
```

Expected: formatter exits successfully.

- [ ] **Step 2: Run analyzer**

Run:

```bash
rtk flutter analyze
```

Expected: exit code 0.

- [ ] **Step 3: Review diff for scope**

Run:

```bash
rtk git diff -- lib/features/home docs/superpowers/specs/2026-07-07-home-sprint-2-design.md docs/superpowers/plans/2026-07-07-home-sprint-2.md
```

Expected: only Sprint 2 Home and planning docs appear.

## Self Review

- Spec coverage: data strategy, UI order, state handling, TODO integration markers, and Home widgets all mapped to tasks.
- Placeholder scan: no TBD/TODO inside plan steps beyond intended code comments.
- Type consistency: `HomeSummary`, `HomeRepository`, `fetchHomeSummary()`, and `HomeController` names match existing code.
