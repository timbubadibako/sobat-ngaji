# Aqua Nav Mushaf Practice Flow Implementation Plan

**For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans or execute inline task-by-task. Steps use checkbox (`- [ ]`) syntax tracking.

**Goal:** Build 5-point Aqua bottom navigation with Mushaf shell, non-blocking Insight/Profile skeleton loading, and verified Practice to Recording to Evaluation flow.

**Architecture:** Keep GoRouter shell as top-level navigation boundary. Add Mushaf as its own feature entry point with placeholder reading screen, while Quran-page source and popup navigation remain product decisions for later. Loading polish stays presentation-layer only except Profile mock fallback, which belongs in repository because backend deployment is pending.

**Tech Stack:** Flutter, GoRouter, Riverpod, Material 3, existing Aqua tokens.

---

### Task 1: Bottom Nav And Mushaf Route

**Files:**
- Modify: `lib/app/app_shell.dart`
- Modify: `lib/app/router.dart`
- Create: `lib/features/mushaf/mushaf.dart`
- Create: `lib/features/mushaf/presentation/screens/mushaf_screen.dart`
- Modify: `docs/UIGuideline.md`
- Modify: `docs/WidgetTree.md`

- [ ] Update shell routes to `Home`, `Mushaf`, `Practice`, `Insight`, `Profile`.
- [ ] Keep `/recording/:practiceId` and `/evaluation/:practiceId` selected under Practice.
- [ ] Make Practice center nav item floating circular mic, with nav body pill dark navy.
- [ ] Add Mushaf route and placeholder Aqua reading screen with page-first layout.
- [ ] Update docs to reflect 5-item nav.
- [ ] Run `rtk dart format` and `rtk flutter analyze`.
- [ ] Commit as `feat(mushaf): add aqua nav entry`.

### Task 2: Skeleton Loading For Insight And Profile

**Files:**
- Create: `lib/shared/widgets/shimmer_skeleton.dart`
- Modify: `lib/features/insight/presentation/screens/insight_screen.dart`
- Modify: `lib/features/profile/presentation/screens/profile_screen.dart`
- Modify: `lib/features/profile/data/repositories/profile_repository_impl.dart`

- [ ] Add lightweight shimmer skeleton widget using `AnimationController`.
- [ ] Replace Insight full spinner with screen-shaped skeleton.
- [ ] Replace Profile full spinner with screen-shaped skeleton.
- [ ] Use mock Profile summary when `AppConfig.mockDataEnabled` is true so Profile does not block on backend.
- [ ] Run `rtk dart format` and `rtk flutter analyze`.
- [ ] Commit as `style(loading): add aqua skeleton states`.

### Task 3: Practice Flow Verification

**Files:**
- Modify: `test/app/app_flow_test.dart`
- Modify if needed: `lib/features/recording/presentation/screens/recording_screen.dart`
- Modify if needed: `lib/features/evaluation/presentation/screens/evaluation_result_screen.dart`

- [ ] Extend app flow test to navigate Practice detail, Recording, and Evaluation.
- [ ] Fix any route or loading issue blocking the successful flow.
- [ ] Run `rtk flutter test test/app/app_flow_test.dart`.
- [ ] Run `rtk git diff --check`.
- [ ] Commit as `test(practice): cover recording evaluation flow`.
