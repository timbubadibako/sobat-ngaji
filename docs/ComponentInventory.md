# Component Inventory

Dokumen ini mencegah agent membuat widget duplikat. Sebelum membuat widget baru, cek daftar ini lebih dulu.

## App Shell
```text
AppShell
BottomNav
AppScaffold
ScreenHeader
```

## Home Components
```text
DailyQiraHero
AiGreetingCard
WeeklySnapshotCard
ContinuePracticeCard
```

## Practice Components
```text
PracticeSearchBar
PracticeFilterChip
PracticeCard
SurahCard
AyahCard
ReferenceAudioCard
StepProgress
```

## Recording Components
```text
RecordingPanel
RecordButton
Waveform
ReferenceAudioPlayer
RealtimeEventList
RecordingTimer
MicrophonePermissionCard
```

## Evaluation Components
```text
EvaluationResultScreen
ScoreRing
AiSummaryCard
AyahHighlightCard
HighlightLegend
RecommendationCard
RetryNextActions
```

## Insight Components
```text
WeeklyReportCard
WeeklyTrendChart
LetterMasteryCard
LetterMasteryBar
PracticeHeatmap
RadarScoreChart
SmartSuggestionCard
```

## Profile Components
```text
ProfileHeader
LearningSummaryCard
PreferenceRow
AchievementCard
LogoutButton
```

## Shared Components
```text
PrimaryButton
SecondaryButton
IconButton
AppCard
HeroCard
Badge
Chip
SearchField
ProgressBar
EmptyState
ErrorState
LoadingState
```

## Rules
- Jangan membuat komponen baru jika nama dan fungsi sudah ada di inventory.
- Komponen yang hanya dipakai satu feature tetap berada di folder feature.
- Komponen yang dipakai minimal dua feature boleh dipindah ke `shared/widgets`.
- Nama widget harus mengikuti `docs/CodingConvention.md`.

