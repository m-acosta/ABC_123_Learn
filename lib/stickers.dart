import 'package:flutter/material.dart';

class Stickers extends StatefulWidget {
  Stickers({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StickersState createState() => _StickersState();
}

List<String> _stickers;
List<bool> _unlocked;
int maxStickers;
int currentlyUnlocked;

class _StickersState extends State<Stickers> {
  @override
  void initState() {
    super.initState();
    if (_unlocked == null || _stickers == null) {
      clearUnlocks();
    }
    unlockNextSticker();
    setState(() {
    });
  }

  void clearUnlocks() {
    _stickers = <String>[
      'assets/images/stickers/balloons.jpg',
      'assets/images/stickers/bee.jpg',
      'assets/images/stickers/bird.png',
      'assets/images/stickers/boat.jpeg',
      'assets/images/stickers/car.jpg',
      'assets/images/stickers/cupcake.png',
      'assets/images/stickers/rainbow.jpeg',
      'assets/images/stickers/star.jpg',
      'assets/images/stickers/unicorn.png',
    ];
    _unlocked = <bool>[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    maxStickers = _unlocked.length;
    currentlyUnlocked = 0;
  }

  void unlockNextSticker() {
    for (int i = 0; i < _unlocked.length; i++) {
      if (!_unlocked.elementAt(i)) {
        _unlocked.replaceRange(i, (i + 1), [true]);
        currentlyUnlocked = (_unlocked.lastIndexOf(true)) + 1;
        break;
      }
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
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        'Stickers Collected ' +
                            '${currentlyUnlocked}/${maxStickers}'
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 100, right: 100),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: _stickers.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (_unlocked[index]) {
                        return Card(
                          child: Container(
                            child: Image.asset(
                              _stickers[index],
                              fit: BoxFit.fill,
                            )
                          ),
                        );
                      }
                      else {
                        return Card(
                          child: Container(
                              foregroundDecoration: BoxDecoration(
                                color: Colors.grey,
                                backgroundBlendMode: BlendMode.saturation,
                              ),
                              child: Image.asset(
                                _stickers[index],
                                fit: BoxFit.fill,
                              )
                          ),
                        );
                      }
                    }
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                    onPressed: () {
                      clearUnlocks();
                      setState(() {
                      });
                    },
                    child: Text('Clear Progress')
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}