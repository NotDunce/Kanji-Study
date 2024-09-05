
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hanja_learning/model/card.dart';

Future<List<ReviewCard>> setupAndStoreKanji(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  Map<String, dynamic> kanjiMap = jsonDecode(jsonString);
  List<ReviewCard> reviewCards = [];

  // Filter and create review card objects for grade 1 kanji entries
  kanjiMap.forEach((kanji, data) {
    if (data["grade"] == 1) {
      ReviewCard reviewCard = ReviewCard(
        kanji: kanji,
        readings_on: data["readings_on"].join(", "),
        readings_kun: data["readings_kun"].join(", "),
        meanings: data["meanings"][0],
      );
      reviewCards.add(reviewCard);
    }
  });

  return reviewCards;
}

void testRecall(String filepath) async {
  List<ReviewCard> storedKanji = await setupAndStoreKanji(filepath);
  for (ReviewCard card in storedKanji) {
    print('Kanji: ${card.kanji}, Meaning: ${card.meanings}, On: ${card.readings_on}, Kun: ${card.readings_kun}');
  }
}

