import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30),boxShadow: [
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('lib/images/Japanflag.png', height: 30,),
                          Row(
                            children: [
                              Image.asset('lib/images/flame.png', height: 30,),
                              SizedBox(width: 10,),
                              Text('2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('lib/images/turtle.png', height: 30,),
                              SizedBox(width: 10,),
                              Text('4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)
                            ],
                          ),
                          Image.asset('lib/images/bell.png', height: 30,)
                        ],
                      ),
                    );

  }
}