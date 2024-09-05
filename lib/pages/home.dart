import 'package:flutter/material.dart';
import 'package:hanja_learning/components/my_box.dart';
import 'package:hanja_learning/components/top_bar.dart';

import 'package:hanja_learning/pages/AlphabetPage.dart';
import 'package:hanja_learning/pages/games_page.dart';
import 'package:hanja_learning/pages/supermemo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      extendBody: true,
      body: Column(
        children: [
          GestureDetector(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TopBar(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Lessons',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.grid_view,
                            color: Colors.grey[500],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 700,
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          MyBox(
                            text: "Reading",
                            image: 'lib/images/book-stack.png',
                            subtext: 'You have completed 50%',
                          ),
                          MyBox(
                            text: "Listening",
                            image: 'lib/images/headphones.png',
                          ),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AlphabetPage())),
                              child: MyBox(
                                text: "Alphabet",
                                image: 'lib/images/abc.png',
                              )),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SupermemoPage())),
                              child: MyBox(
                                text: "Kanji",
                                image: 'lib/images/talking.png',
                              )),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => GamesPage(),)
                            ),
                            child: MyBox(
                              text: "Games",
                              image: 'lib/images/rubik.png',
                            ),
                          ),
                          MyBox(
                            text: "Writing",
                            image: 'lib/images/copy-writing.png',
                          ),
                          MyBox(
                            text: "Test",
                            image: 'lib/images/test.png',
                          ),
                          MyBox(
                            text: "Cultures",
                            image: 'lib/images/earth.png',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
