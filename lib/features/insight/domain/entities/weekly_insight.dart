/// Weekly learning insight shown on Insight screen.
class WeeklyInsight {
  const WeeklyInsight({
    required this.practiceCount,
    required this.averageScore,
    required this.growthPercent,
    required this.focusLetter,
    required this.summary,
    required this.trend,
    required this.letterMastery,
    required this.suggestion,
  });

  final int practiceCount;
  final int averageScore;
  final int growthPercent;
  final String focusLetter;
  final String summary;
  final List<int> trend;
  final List<LetterMastery> letterMastery;
  final String suggestion;
}

/// Mastery score for one Arabic letter.
class LetterMastery {
  const LetterMastery({
    required this.letter,
    required this.score,
    required this.mistakeCount,
  });

  final String letter;
  final int score;
  final int mistakeCount;
}
