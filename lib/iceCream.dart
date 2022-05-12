import 'dart:math';

import 'package:flutter/material.dart';

import 'stickers.dart';

class IceCream extends StatefulWidget {
  IceCream({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IceCreamState createState() => _IceCreamState();
}

class _IceCreamState extends State<IceCream> {
  String _letters = '';
  String _answer = '';
  int numberOfScoops = 4;
  List<int> colorCodes = <int>[50, 200, 400, 600];
  final _rnd = Random();

  @override
  void initState() {
    super.initState();
    _letters = chooseLetters();
    _answer = selectLetter(_letters);
  }

  String randomLetter() {
    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return alphabet[_rnd.nextInt(alphabet.length)];
  }

  String chooseLetters() {
    String chosen = "";
    while (chosen.length < numberOfScoops){
      String currentLetter = randomLetter();
      if (!chosen.contains(currentLetter)) {
        chosen += currentLetter;
      }
    }
    setState(() {
    });
    return chosen;
  }

  String selectLetter(String fourLetters) {
    String s = fourLetters[_rnd.nextInt(fourLetters.length)];
    setState(() {
    });
    return s;
  }

  void rollForSticker() {
    int dropRate = numberOfScoops - 1;
    int temp = _rnd.nextInt(dropRate) + 1;
    if (temp == dropRate) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Stickers()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/watercolor-cotton-candy-colors.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Please choose the letter: " + _answer,
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ],
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(20),
                itemCount: numberOfScoops,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_answer == _letters[index]) {
                              rollForSticker();
                              _letters = chooseLetters();
                              _answer = selectLetter(_letters);
                            }
                            else {
                            }
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/ice_cream_top.png",
                                color: Colors.yellow[colorCodes[_rnd.nextInt(4)]],
                                colorBlendMode: BlendMode.modulate,
                              ),
                              Text(
                                  _letters[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                  )
                              ),
                            ]
                          )
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}