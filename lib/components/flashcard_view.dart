import 'package:flutter/material.dart';

class flashcardUI extends StatelessWidget {
  final String kanji;
  final String meanings;
  final String readings_on;
  final String readings_kun;
   flashcardUI(
      {super.key,
      required this.kanji,
      required this.meanings,
      required this.readings_on,
      required this.readings_kun});
  //selectedCards[flashcardIndex].kanji
  //selectedCards[flashcardIndex].meanings
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 330,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              width: 300,
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.shade400,
                        blurRadius: 12.0,
                        spreadRadius: 1.0,
                        offset: Offset(4.0, 4.0)),
                    BoxShadow(
                        color: Colors.blue.shade100,
                        blurRadius: 12.0,
                        spreadRadius: 1.0,
                        offset: Offset(-4.0, -4.0)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      kanji,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 90),
                    ),

                    Text(meanings,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(height: 20,),
                    Text(
                      readings_on,
                      style:TextStyle(fontWeight: FontWeight.w500,fontSize:19)),
                      Text(
                        readings_kun,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),),
                    
                  ],
                ),
              ));
        },
      ),
    );
  }
}
