import 'package:objectbox/objectbox.dart';
import 'package:hanja_learning/model/card.dart';
import 'package:hanja_learning/objectbox.g.dart';
import 'package:hanja_learning/services/reviewcardservice.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;
  late final Box<ReviewCard> reviewBox;

  ObjectBox._create(this.store) {
    reviewBox = Box<ReviewCard>(store);
    _initializeData();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    //final store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    // Initialize the store here
    final store = await openStore(directory: docsDir.path);
    final box = ObjectBox._create(store);
    return box;
  }

  Future<void> _initializeData() async {
    if (reviewBox.isEmpty()) {
      await _putReviewData();
    }
  }

  Future<void> _putReviewData() async {
    try {
      String filepath = 'lib/data/Kanjidata.json'; 
      List<ReviewCard> storedKanji = await setupAndStoreKanji(filepath);
      reviewBox.putMany(storedKanji);
    } catch (e) {
      print('An error occurred while putting review data: $e');
      // Handle the exception, maybe retry or alert the user
    }
  }

    void printAllReviewCards() {
    final List<ReviewCard> reviewCards = reviewBox.getAll();
    if (reviewCards.isNotEmpty) {
      for (final card in reviewCards) {
        print('ReviewCard: ${card.kanji}, ${card.id}, ${card.interval}');
      }
      print('Total number of ReviewCards: ${reviewCards.length}');
    } else {
      print('No ReviewCards found in the database.');
    }
  }

    void clearAllReviewCards() {
    reviewBox.removeAll();
    print('All ReviewCard objects removed from the ObjectBox store.');
  }
}


