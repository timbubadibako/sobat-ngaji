# Sprint 2 Home Design

## Scope

Implement Feature #2: Home.

Home must show:
- Daily Qira hero as strongest first-viewport element
- AI greeting
- weekly snapshot
- continue practice card
- AI recommendation preview

Data source for this sprint is static local mock data only. Auth session may
provide the display name so Sprint 1 and Sprint 2 feel like one coherent app.

## Visual Sources

- Design system: `design/sobat-ngaji-component-boards.html`
- Screen reference: `design/screens/home.html`
- Tokens: `docs/DesignGuideline.md`, `docs/DesignTokens.md`

## Architecture

Use feature-first structure already present in `lib/features/home/`.

Layers:
- `domain/`: immutable Home entities + repository contract
- `data/`: local mock-backed repository implementation
- `presentation/`: Riverpod controller, screen, feature widgets

`HomeController` remains `AsyncNotifier<HomeSummary>`.

## Data Strategy

Sprint 2 uses static local data.

Repository responsibilities:
- return Home payload
- map unexpected technical failures to `AppFailure`

Do not depend on backend data for Home payload in this sprint.

Use auth session only for lightweight display-name personalization.

Add `TODO` comments at integration boundaries for:
- backend API wiring
- real recommendation source

## UI Composition

`HomeScreen`
- loading state
- empty state
- error state
- success state

Success layout:
1. `ScreenHeader` style intro row
2. `DailyQiraHero`
3. `AiGreetingCard`
4. `WeeklySnapshotCard`
5. `ContinuePracticeCard`
6. `AiRecommendationPreview`

Ordering keeps Daily Qira as first-viewport focal point.

## Interaction

- pull to refresh reloads static payload
- Daily Qira primary action routes to `/practice`
- continue practice routes to `/practice`
- recommendation routes to `/practice`

## Copy Rules

Use calm AI companion language:
- "AI menemukan..."
- "Kami menyarankan..."
- "Evaluasi awal"

Avoid absolute correctness claims.

## Files Expected To Change

- `lib/features/home/data/repositories/home_repository_impl.dart`
- `lib/features/home/data/datasources/home_remote_data_source.dart`
- `lib/features/home/presentation/screens/home_screen.dart`
- `lib/features/home/presentation/widgets/daily_qira_hero.dart`
- `lib/features/home/presentation/widgets/ai_greeting_card.dart`
- `lib/features/home/presentation/widgets/weekly_snapshot_card.dart`
- `lib/features/home/presentation/widgets/continue_practice_card.dart`
- `lib/features/home/presentation/widgets/ai_recommendation_preview.dart`

Possible small shared/app edits only if required by layout consistency.

## Verification

- `flutter analyze`
- targeted widget/state sanity through app structure review

## Self Review

- Scope limited to Sprint 2 Home only
- No contradiction with roadmap or state-management rules
- Auth dependency explicitly removed for this sprint
- Backend integration deferred with explicit TODO markers
