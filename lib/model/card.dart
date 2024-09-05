import 'dart:math';

import 'package:objectbox/objectbox.dart';

enum AnswerQuality { CORRECT, GOOD, INCORRECT }

@Entity()
class ReviewCard {
  @Id()
  int? id;
  static const minimumEF = 1.3;
  int interval = 0;
  int previousInterval = 0;
  final String kanji;
  final String readings_on;
  final String readings_kun;
  final String meanings;
  int repetition = 0;
  double easeFactor = 2.5;
  @Property(type: PropertyType.date)
  DateTime? lastReviewed;
  @Property(type: PropertyType.date)
  DateTime? nextReviewDate;

  ReviewCard({required this.kanji, required this.readings_on, required this.readings_kun, required this.meanings});

  void review(AnswerQuality quality) {
    updateSM2(quality);
    lastReviewed = DateTime.now();
    calculateNextReviewDate();
  }

  void updateSM2(AnswerQuality quality) {
    if (quality == AnswerQuality.INCORRECT) {
      repetition = 0;
      interval = 1;
    } else {
      repetition += 1;
      interval = calculateInterval(repetition, easeFactor);
      easeFactor = easeFactor + (0.1 - (minimumEF - quality.index) * (0.08 + (minimumEF - quality.index) * 0.02));
      easeFactor = max(easeFactor, minimumEF); // Ensure minimum ease factor
    }
  }
  int calculateInterval(int repCount, double ef) {
    if (repCount <= 1) {
      return 1;
    } else if (repCount == 2) {
      return 6;
    } else {
      return (interval * ef).round();
    }
  }

  void calculateNextReviewDate() {
    if (lastReviewed == null) {
      // Handle initial case where there's no last reviewed date
      nextReviewDate = DateTime.now();
    } else {
      nextReviewDate = lastReviewed!.add(Duration(days: interval));
    }
  }
}