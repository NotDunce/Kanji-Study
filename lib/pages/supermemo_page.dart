import 'package:flutter/material.dart';
import 'package:hanja_learning/components/flashcard_view.dart';
import 'package:hanja_learning/components/review_buttons.dart';
import 'package:hanja_learning/components/top_bar.dart';
import 'package:hanja_learning/model/card.dart';
import 'package:hanja_learning/model/flashcard_old.dart';
import 'package:hanja_learning/objectbox.dart';
import 'package:provider/provider.dart';
import 'package:spaced_repetition/main.dart';

class SupermemoPage extends StatefulWidget {
  const SupermemoPage({super.key});

  @override
  State<SupermemoPage> createState() => _SupermemoPageState();
}

class _SupermemoPageState extends State<SupermemoPage> {
  int flashcardIndex = 0; // tracks the current flashcard index
  int wrongAttempts = 0; // number of wrong attempts
  String answer = ""; // the answer that the user inputs
  final myController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  List<ReviewCard> selectedCards = [];



  //iterates through the flashcards if the flashcard index is less than the length of the list

  List<ReviewCard> cardSelection(List<ReviewCard> reviewCardList) {
    // Check if all intervals are the same and equal to the default interval
    bool allDefaultIntervals =
        reviewCardList.every((card) => card.interval == 0);

    // If it's the first review, just return the first seven cards
    if (allDefaultIntervals) {
      return reviewCardList.take(7).toList();
    } else {
      // Otherwise, sort by intervals and take the first seven cards
      reviewCardList.sort((a, b) => a.interval.compareTo(b.interval));
      return reviewCardList.take(7).toList();
    }
  }

//listens for the updated event and prints the result
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  void printkanji() {}

  Widget build(BuildContext context) {

    final objectBox = Provider.of<ObjectBox>(context);
    final reviewBox = objectBox.reviewBox;

    final List<ReviewCard> reviewCards = reviewBox.getAll();

    List<ReviewCard> selectedCards = cardSelection(reviewCards);

    print(selectedCards[flashcardIndex].id);
    
    final sm = Sm();
    void nextIndex() {
      // Increment the index
      // Check if the index is out of bounds
      if (flashcardIndex >= selectedCards.length - 1) {
        // Wrap around to the beginning
        flashcardIndex = 0;
      } else {
        flashcardIndex++;
      }
    }



    // for (final card in selectedCards) {
    //   print('ReviewCard: ${card.kanji}, ${card.id}, ${card.interval},');
    // }
    // for (final card in reviewCards) {
    //     print('ReviewCard: ${card.kanji}, ${card.id}, ${card.interval}');
    // }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //top row container
              TopBar(),
              //Creating a flashcard in the middle of the screen

              SizedBox(
                height: 90,
              ),

              flashcardUI(
                kanji: selectedCards[flashcardIndex].kanji,
                meanings: selectedCards[flashcardIndex].meanings,
                readings_kun: selectedCards[flashcardIndex].readings_kun,
                readings_on: selectedCards[flashcardIndex].readings_on,
              ),

              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          nextIndex();
                          setState(() {
                            SmResponse smResponse = sm.calc(
                                quality: 0,
                                repetitions: selectedCards[flashcardIndex].repetition,
                                previousInterval: selectedCards[flashcardIndex].previousInterval,
                                previousEaseFactor: selectedCards[flashcardIndex].easeFactor
                            );

                                selectedCards[flashcardIndex].interval = smResponse.interval;
                                selectedCards[flashcardIndex].easeFactor =smResponse.easeFactor;
                                selectedCards[flashcardIndex].repetition = smResponse.repetitions;

                                reviewBox.put(selectedCards[flashcardIndex]);
                          });
                        },
                        child: ReviewButton(
                          buttonColor: Colors.red.shade200,
                          buttonText: ':(',
                        )),
                    GestureDetector(
                      onTap: () {
                        nextIndex();
                        setState(() {
                          SmResponse smResponse = sm.calc(
                                quality: 1,
                                repetitions: selectedCards[flashcardIndex].repetition,
                                previousInterval: selectedCards[flashcardIndex].previousInterval,
                                previousEaseFactor: selectedCards[flashcardIndex].easeFactor
                            );

                                selectedCards[flashcardIndex].interval = smResponse.interval;
                                selectedCards[flashcardIndex].easeFactor =smResponse.easeFactor;
                                selectedCards[flashcardIndex].repetition = smResponse.repetitions;

                                reviewBox.put(selectedCards[flashcardIndex]);
                        });
                      },
                      child: ReviewButton(
                        buttonColor: Colors.orange.shade200,
                        buttonText: 'Hard',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        nextIndex();
                        setState(() {
                          SmResponse smResponse = sm.calc(
                                quality: 2,
                                repetitions: selectedCards[flashcardIndex].repetition,
                                previousInterval: selectedCards[flashcardIndex].previousInterval,
                                previousEaseFactor: selectedCards[flashcardIndex].easeFactor
                            );

                                selectedCards[flashcardIndex].interval = smResponse.interval;
                                selectedCards[flashcardIndex].easeFactor =smResponse.easeFactor;
                                selectedCards[flashcardIndex].repetition = smResponse.repetitions;

                                reviewBox.put(selectedCards[flashcardIndex]);
                        });
                      },
                      child: ReviewButton(
                          buttonColor: Colors.yellow.shade300,
                          buttonText: 'Medium'),
                    ),
                    GestureDetector(
                      onTap: () {
                        nextIndex();
                        setState(() {
                          SmResponse smResponse = sm.calc(
                                quality: 3,
                                repetitions: selectedCards[flashcardIndex].repetition,
                                previousInterval: selectedCards[flashcardIndex].previousInterval,
                                previousEaseFactor: selectedCards[flashcardIndex].easeFactor
                            );

                                selectedCards[flashcardIndex].interval = smResponse.interval;
                                selectedCards[flashcardIndex].easeFactor =smResponse.easeFactor;
                                selectedCards[flashcardIndex].repetition = smResponse.repetitions;

                                reviewBox.put(selectedCards[flashcardIndex]);
                        });
                      },
                      child: ReviewButton(
                          buttonColor: Colors.green.shade200, buttonText: 'Easy'),
                    ),
                    GestureDetector(
                      onTap: () {
                        nextIndex();
                        setState(() {
                          SmResponse smResponse = sm.calc(
                                quality: 5,
                                repetitions: selectedCards[flashcardIndex].repetition,
                                previousInterval: selectedCards[flashcardIndex].previousInterval,
                                previousEaseFactor: selectedCards[flashcardIndex].easeFactor
                            );

                                selectedCards[flashcardIndex].interval = smResponse.interval;
                                selectedCards[flashcardIndex].easeFactor =smResponse.easeFactor;
                                selectedCards[flashcardIndex].repetition = smResponse.repetitions;

                                reviewBox.put(selectedCards[flashcardIndex]);
                        });
                      },
                      child: ReviewButton(
                        buttonColor: Colors.green.shade300,
                        buttonText: 'Very easy',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
