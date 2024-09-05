import 'package:flutter/material.dart';
import 'package:hanja_learning/pages/home.dart';


import 'package:lottie/lottie.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
            ),
                      Text('A whole new world awaits...', style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey[600],
                      ),),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40,),

              Center(child: Lottie.network('https://assets6.lottiefiles.com/temp/lf20_zLc23z.json')),

              SizedBox(height: 100,),
              

              //sign up now, or continue if you have an account
              Center(child: GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                })),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[200],
                    ),
                  child: const Center(
                    child: Text("New user? Sign up here", style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                                ),
                  )),
              ))

            ],
          ),
        ),
      ),
    );
  }
}