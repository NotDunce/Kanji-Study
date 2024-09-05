class Flashcard {
  String question;
  String answer;
  int repetitions;
  int interval;
  double ease;
  DateTime dueDate;


  Flashcard({
    required this.question,
    required this.answer,
    this.repetitions = 0,
    this.interval = 1,
    this.ease = 2.5,
    required this.dueDate,
 
  });
}

/* 
okay for the sm2 algo

repetitions always starts at 0

default interval will be 1 for 1 minute
after 1 minute card will be shown
if ease for after 1 minute is high, then interval == 10 
after 10 minutes card will be shown
then there is a loop if the ef goes down
a card graduates when it gets past the 10 min interval and will be changed to the next day


*/

//calculate completion
// percentage = (list.length - wrong attempts) / list.length
// percentage * 100 = the actual percentage
  
//lessons: 
/* 

first we want to select 5 items from the list of characters randomly

for j in range(5){
  i = random.int(0, list.length);
  lesson = List<Flashcard> = flashcards[i];
}





*/


List<Flashcard> createFlashcards() {
  List<Map<String, String>> flashcardData = [
    //consonants
    {"question": "ㄱ" , "answer": "g"},
    {"question": "ㄲ" , "answer": "kk"},
    {"question": "ㄷ" , "answer": "d"},
    {"question": "ㄸ" , "answer": "tt"},
    {"question": "ㄹ" , "answer": "r"},
    {"question": "ㅁ" , "answer": "m"},
    {"question": "ㄴ" , "answer": "n"},
    {"question": "ㅂ" , "answer": "b"},
    {"question": "ㅃ" , "answer": "pp"},
    {"question": "ㅅ" , "answer": "s"},
    {"question": "ㅆ" , "answer": "ss"},
    {"question": "ㅇ" , "answer": "ng"},
    {"question": "ㅈ" , "answer": "j"},
    {"question": "ㅉ" , "answer": "jj"},
    {"question": "ㅊ" , "answer": "ch"},
    {"question": "ㅋ" , "answer": "k"},
    {"question": "ㅌ" , "answer": "t"},
    {"question": "ㅍ" , "answer": "p"},
    {"question": "ㅎ" , "answer": "h"},
    //vowels
    {"question": "ㅏ" , "answer": "a"},
    {"question": "ㅐ" , "answer": "ae"},
    {"question": "ㅑ" , "answer": "ya"},
    {"question": "ㅓ" , "answer": "eo"},
    {"question": "ㅔ" , "answer": "e"},
    {"question": "ㅕ" , "answer": "yeo"},
    {"question": "ㅖ" , "answer": "ye"},
    {"question": "ㅗ" , "answer": "o"},
    {"question": "ㅘ" , "answer": "wa"},
    {"question": "ㅙ" , "answer": "wae"},
    {"question": "ㅚ" , "answer": "oe"},
    {"question": "ㅛ" , "answer": "yo"},
    {"question": "ㅜ" , "answer": "u"},
    {"question": "ㅝ" , "answer": "wo"},
    {"question": "ㅞ" , "answer": "we"},
    {"question": "ㅟ" , "answer": "wi"},
    {"question": "ㅠ" , "answer": "yu"},
    {"question": "ㅡ" , "answer": "eu"},
    {"question": "ㅢ" , "answer": "ui"},
    {"question": "ㅣ" , "answer": "i"},
    
    
    // Add more flashcards as needed
  ];

  List<Flashcard> flashcards = [];

  for (var data in flashcardData) {
    flashcards.add(
      Flashcard(
        question: data["question"]!,
        answer: data["answer"]!,
        dueDate: DateTime.now(),

      ),
    );
  }

  return flashcards;
}

List<String> names = ['n', 'd', 'tt', 'r', 'm', 'b', 'pp', 's', 'ss', 'ng', 'jt', 'jj', 'ch', 'k', 't', 'p', 'h'];











//n d tt r m b pp s ss ng jt jj ch k t p h

