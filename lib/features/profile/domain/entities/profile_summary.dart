/// Lightweight Profile data shown in Sprint 7.
class ProfileSummary {
  const ProfileSummary({
    required this.totalSessions,
    required this.averageScore,
    required this.focusLetter,
    required this.streakDays,
    required this.learningSummary,
    required this.preferences,
    required this.achievement,
  });

  final int totalSessions;
  final int averageScore;
  final String focusLetter;
  final int streakDays;
  final String learningSummary;
  final List<PreferenceItem> preferences;
  final String achievement;
}

/// User preference row.
class PreferenceItem {
  const PreferenceItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final String icon;
}
