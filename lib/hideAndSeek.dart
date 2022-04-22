import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_learning/stickers.dart';

class HideAndSeek extends StatefulWidget {
  HideAndSeek({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HideAndSeekState createState() => _HideAndSeekState();
}

class _HideAndSeekState extends State<HideAndSeek> {
  List<int> _numbers = [];
  int _current;
  int _maxValue = 5;

  @override
  void initState() {
    super.initState();
    generateList();
  }

  void generateList() {
    _numbers.clear();
    _current = 1;
    for (int i = 1; _numbers.length < (_maxValue * _maxValue); i++) {
      _numbers.add(i);
    }
    _numbers.shuffle();
    setState(() {
    });
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

  void successfulTap() {
    _current++;
    if (_current > _maxValue) {
      rollForSticker();
      generateList();
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
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 5/2,
                    ),
                    itemCount: _numbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      int numberOnCard = _numbers.elementAt(index);
                      String stringRepresentation = numberOnCard.toString();
                      if (numberOnCard > _maxValue) {
                        stringRepresentation = "";
                      }
                      return Opacity(
                        opacity: 0.7,
                        child: Card(
                          child: InkWell(
                            onTap: () {
                              if (_current == numberOnCard) {
                                successfulTap();
                              }
                              else {

                              }
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '$stringRepresentation',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}