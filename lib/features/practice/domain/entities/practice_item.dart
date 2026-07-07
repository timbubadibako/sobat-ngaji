/// Curated ayah or phrase users can practice in the MVP flow.
class PracticeItem {
  const PracticeItem({
    required this.id,
    required this.surahName,
    required this.surahNumber,
    required this.ayahLabel,
    required this.arabicName,
    required this.arabicText,
    required this.translation,
    required this.focus,
    required this.level,
    required this.estimatedMinutes,
    required this.referenceAudioUrl,
    required this.isDaily,
  });

  final String id;
  final String surahName;
  final int surahNumber;
  final String ayahLabel;
  final String arabicName;
  final String arabicText;
  final String translation;
  final String focus;
  final String level;
  final int estimatedMinutes;
  final String referenceAudioUrl;
  final bool isDaily;
}
