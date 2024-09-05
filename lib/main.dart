import 'package:flutter/material.dart';
import 'package:hanja_learning/model/card.dart';
import 'package:hanja_learning/objectbox.dart';
import 'package:hanja_learning/pages/welcome.dart';
import 'package:hanja_learning/services/reviewcardservice.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //String filepath = 'lib/data/Kanjidata.json';
  //testRecall(filepath);


  
  ObjectBox objectBox = await ObjectBox.create();
  objectBox.printAllReviewCards();
 
  
   
    runApp(
    Provider.value(
      value: objectBox,
      child: MyApp(),
    ),);
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: WelcomePage(),
    );
  }
}