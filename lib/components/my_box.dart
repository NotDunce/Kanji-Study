import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyBox extends StatelessWidget {
  final String text;
  final String image;
  final String subtext;

  const MyBox({super.key, this.text = " ", this.image = '', this.subtext = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                image,
                height: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You have completed 50%',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            SizedBox(
              height: 15,
            ),
            LinearPercentIndicator(
              percent: 0.5,
            )
          ]),
        ),
      ),
    );
  }
}
