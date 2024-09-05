import 'package:flutter/material.dart';
import 'package:hanja_learning/components/top_bar.dart';
import 'package:hanja_learning/model/flashcard_old.dart';
import 'package:hanja_learning/pages/home.dart';

class AlphabetPage extends StatefulWidget {
  const AlphabetPage({super.key});

  @override
  State<AlphabetPage> createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {

  int flashcardIndex = 0; // tracks the current flashcard index
  int wrongAttempts = 0; // number of wrong attempts
  String answer = ""; // the answer that the user inputs
  final myController = TextEditingController(); 
  FocusNode myFocusNode = FocusNode();
  
  List<Flashcard> flashcards = createFlashcards();

  //iterates through the flashcards if the flashcard index is less than the length of the list

  void nextIndex() {
  // Increment the index
  // Check if the index is out of bounds
  if (flashcardIndex >= flashcards.length - 1) {
    // Wrap around to the beginning
    flashcardIndex = 0;
  }
  else{
    flashcardIndex++;
  }
}

void correctAnswer(){
  final text = myController.text;
  if(text != flashcards[flashcardIndex].answer){
    wrongAttempts++;
    print(wrongAttempts);
  }
  //need to add an event tracker to the textfield so that onSubmit, the next index is triggered, not just when the answer is correct
  else if(text == flashcards[flashcardIndex].answer){
    setState(() {
      nextIndex();
      myController.clear();
      myFocusNode.requestFocus();
    });
    
    //myController.clear();
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

  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(children: [
                  SizedBox(height: 10,),
                      //top row container
                      TopBar(),
                      //Creating a flashcard in the middle of the screen
          
                      SizedBox(height: 140,),
          
                      //flashcard ui 
                      Container(
                        width: 300,
                        height: 300,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 300,
                              height: 300,
                              
                              decoration: BoxDecoration(
                                color: Colors.white, 
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(4.0, 4.0)
                                  ),
                                  BoxShadow(
                                    color: Colors.teal.shade100,
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(-4.0, -4.0)
                                  ),
                                ]
                                ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(flashcards[flashcardIndex].question, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 120),),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 1,
                                    decoration: BoxDecoration(color: Colors.grey[400]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(flashcards[flashcardIndex].answer, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                  ),
                                  
                              ],)
                            );
                          },
                        ),
                      ),
          
                      SizedBox(height: 50,),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              nextIndex();
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.teal[100], 
                                borderRadius: BorderRadius.circular(20),
                               
                                ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 70,
                            child: TextField(
                              controller: myController,
                              textAlign: TextAlign.center,
                              autofocus: true,
                              autocorrect: false,
                              focusNode: myFocusNode,
                              onSubmitted: (value) {
                                
                                  correctAnswer();
                                
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>HomePage())),
                            child: Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.teal[100], 
                                borderRadius: BorderRadius.circular(20),
                               
                                ),
                            ),
                          ),
                        ],
                      ),
          
                      
          
                      
                ],),
          ),
        )),
    );
  }
}