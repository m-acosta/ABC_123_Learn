import 'package:flutter/material.dart';
import 'dart:math';
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

  @override
  void initState() {
      super.initState();
      _letters = chooseLetters();
      _answer = selectLetter(_letters);
  }

  String randomLetter() {
    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final _rnd = Random();
    return alphabet[_rnd.nextInt(alphabet.length)];
  }

  String chooseLetters() {
    String chosen = "";
    while (chosen.length < 4){
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
      final _rnd = Random();
      String s = fourLetters[_rnd.nextInt(fourLetters.length)];
      setState(() {
      });
      return s;
  }

  void rollForSticker() {
    final _rnd = Random();
    int dropRate = 3;
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
            image: AssetImage("assets/images/clouds.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please choose the letter: " + _answer)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset("assets/images/ice cream scoop.jpg"),
                        onPressed: () {
                          if (_answer == _letters[0]) {
                            rollForSticker();
                            _letters = chooseLetters();
                            _answer = selectLetter(_letters);
                          }
                          else {

                          }
                        }
                    ),
                    Text(_letters[0]),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset("assets/images/ice cream scoop.jpg"),
                        onPressed: () {
                          if (_answer == _letters[1]) {
                            rollForSticker();
                            _letters = chooseLetters();
                            _answer = selectLetter(_letters);
                          }
                          else {

                          }
                        }
                    ),
                    Text(_letters[1]),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset("assets/images/ice cream scoop.jpg"),
                        onPressed: () {
                          if (_answer == _letters[2]) {
                            rollForSticker();
                            _letters = chooseLetters();
                            _answer = selectLetter(_letters);
                          }
                          else {

                          }
                        }
                    ),
                    Text(_letters[2]),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset("assets/images/ice cream scoop.jpg"),
                        onPressed: () {
                          if (_answer == _letters[3]) {
                            rollForSticker();
                            _letters = chooseLetters();
                            _answer = selectLetter(_letters);
                          }
                          else {

                          }
                        }
                    ),
                    Text(_letters[3]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}