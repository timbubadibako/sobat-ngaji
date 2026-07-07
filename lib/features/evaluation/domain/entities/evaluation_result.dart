/// Evaluation output contract shown after recording.
class EvaluationResult {
  const EvaluationResult({
    required this.resultId,
    required this.practiceId,
    required this.matchScore,
    required this.confidenceLevel,
    required this.summary,
    required this.recommendation,
    required this.highlights,
    required this.letterInsights,
    required this.events,
  });

  final String resultId;
  final String practiceId;
  final int matchScore;
  final String confidenceLevel;
  final String summary;
  final String recommendation;
  final List<HighlightSegment> highlights;
  final List<LetterInsight> letterInsights;
  final List<String> events;
}

/// Highlighted ayah segment with semantic status.
class HighlightSegment {
  const HighlightSegment({
    required this.segment,
    required this.status,
    required this.note,
  });

  final String segment;
  final HighlightStatus status;
  final String note;
}

enum HighlightStatus { read, current, needsCheck, needsRetry }

/// Per-letter insight from evaluation.
class LetterInsight {
  const LetterInsight({
    required this.letter,
    required this.masteryScore,
    required this.mistakeCount,
  });

  final String letter;
  final int masteryScore;
  final int mistakeCount;
}
