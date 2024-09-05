import 'package:flutter/material.dart';

class ReviewButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  const ReviewButton({super.key, required this.buttonColor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 70,
      decoration: BoxDecoration(
        color: buttonColor,
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
      
      child: Center(child: Text(buttonText,style: TextStyle(color: Colors.white),)),
    ); 
  }
}
