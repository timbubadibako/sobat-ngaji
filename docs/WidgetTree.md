# Widget Tree

Widget tree ini menjadi panduan implementasi Flutter. Tujuannya agar agent
membangun dari struktur yang konsisten, bukan menebak layout ulang tiap screen.

## App

```text
SobatNgajiApp
↓
ProviderScope
↓
MaterialApp.router
↓
GoRouter
↓
AppShell
```

## App Shell

```text
AppShell
↓
Scaffold
├── IndexedStack / StatefulShellRoute body
└── BottomNav
    ├── Home
    ├── Mushaf
    ├── Practice center mic action
    ├── Insight
    └── Profile
```

## HomeScreen

```text
HomeScreen
↓
AppScaffold
├── ScreenHeader
├── DailyQiraHero
├── AiGreetingCard
├── WeeklySnapshotCard
└── ContinuePracticeCard
```

## MushafScreen

```text
MushafScreen
↓
AquaScreenScaffold
├── ScreenHeader
├── QuranPageSurface
├── PageNavigationActions
└── MushafNavigationSheet
```

## PracticeScreen

```text
PracticeScreen
↓
AppScaffold
├── ScreenHeader
├── PracticeSearchBar
├── PracticeFilterChipList
├── AiRecommendationCard
├── PracticeCardList
└── StepProgress
```

## RecordingScreen

```text
RecordingScreen
↓
AppScaffold
├── ScreenHeader
├── AyahCard
├── ReferenceAudioPlayer
├── RecordingPanel
│   ├── RecordingTimer
│   ├── RecordButton
│   └── Waveform
├── RealtimeEventList
└── AiListeningCard
```

## EvaluationScreen

```text
EvaluationScreen
↓
AppScaffold
├── ScreenHeader
├── EvaluationScoreCard
│   ├── ScoreRing
│   └── ConfidenceBadge
├── AyahHighlightCard
├── AiSummaryCard
├── RealtimeResultEventList
└── RetryNextActions
```

## InsightScreen

```text
InsightScreen
↓
AppScaffold
├── ScreenHeader
├── WeeklyReportCard
├── WeeklyTrendChart
├── LetterMasteryCard
├── PracticeHeatmap
├── RadarScoreChart
└── SmartSuggestionCard
```

## ProfileScreen

```text
ProfileScreen
↓
AppScaffold
├── ProfileHeader
├── LearningSummaryCard
├── StatsGrid
├── PreferenceList
└── AchievementCard
```

## Widget Ownership Rule

- Screen hanya menyusun komponen.
- Controller mengatur state.
- Repository mengambil data.
- Service menangani detail teknis.
