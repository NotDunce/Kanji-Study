import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        const Text(
                          'Hello Cecelia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black
                          ),
                        ),
                        Text(
                          'Would you like to play a game? :D',
                          style: TextStyle(
                            
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),

                    
                  ],
                ),
              )
          ],
                )),
    );
  }
}
